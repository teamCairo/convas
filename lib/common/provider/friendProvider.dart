import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/friendEntityIsar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../daoIsar/friendDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../logic/commonLogic.dart';

final friendDataProvider = ChangeNotifierProvider(
      (ref) => FriendDataNotifier(),
);

class FriendDataNotifier extends ChangeNotifier {
  Map<String, Friend> _friendData = {}; //キーはFriendのuserDocId
  get friendData => _friendData;

  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<bool>();
  StreamSubscription<QuerySnapshot>? streamSub;

  Future<Uint8List?> readFriendPhotoFromFirebase(
      WidgetRef ref, String friendUserDocId) async {

    if ((_friendData[friendUserDocId]!.profilePhotoNameSuffix??"") == "" ) {
      return null;
    }else{
      //画像ファイルの取得
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference imageRef = storage.ref().child("profile").child(friendUserDocId).child("mainPhoto_small" + _friendData[friendUserDocId]!.profilePhotoNameSuffix!);
      String imageUrl = await imageRef.getDownloadURL();
      File imgFile=await urlToFile(imageUrl);

      if(imgFile==null){
        return null;
      }else{
        Uint8List? bytes;
        await imgFile.readAsBytes().then((value) {
          bytes = Uint8List.fromList(value);
          log('reading of bytes is completed');
        }).catchError((onError) {
          log('Exception Error while reading audio from path:' +
              onError.toString());
        });
        return bytes;

      }
    }
  }

  void closeStream() async {
    streamSub!.cancel();
  }

  Future<void> readFriendDataFromIsarToMemory() async {
    //データリセット
    _friendData ={};
    List<Friend>? tmpFriendList = await selectIsarFriendAll();

    for(int i=0;i<tmpFriendList!.length;i++){
      _friendData[tmpFriendList[i].friendUserDocId]=tmpFriendList[i];
    }
  }

  void clearIsarAndMemory()async {

    _friendData = {};
    deleteIsarSettingsByCode("friendsUpdateCheck");
    deleteIsarFriends();
  }

  void controlStreamOfReadFriendNewDataFromFirebaseToHiveAndMemory(
      WidgetRef ref,String userDocId) async {
    //最初は必ず呼び出し
    streamSub = await readFriendFromFirebaseToHiveAndMemory(ref,userDocId);

    if (controller.hasListener) {
    } else {
      //2回目以降は新しいデータを更新するたびに起動
      controller.stream.listen((value) async {
        streamSub!.cancel();
        streamSub = await readFriendFromFirebaseToHiveAndMemory(ref,userDocId);
      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>>
  readFriendFromFirebaseToHiveAndMemory(WidgetRef ref,String userDocId) async {

    Setting? tmpSetting = await selectIsarSettingByCode("friendsUpdateCheck");
    DateTime friendsUpdatedTime = tmpSetting!.dateTimeValue1!;

    _callStream = FirebaseFirestore.instance
        .collection('friends')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(friendsUpdatedTime))
        .where('readableFlg', isEqualTo: true)
        .where('userDocId',
        isEqualTo: userDocId)
        .orderBy('updateTime', descending: false)
        .snapshots();

    StreamSubscription<QuerySnapshot> streamSub =
    _callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

        for (int i = 0; i < snapshot.size; i++) {
          if (snapshot.docs[i].get("deleteFlg")) {
              _friendData.remove(snapshot.docs[i].get('friendUserDocId'));
              await deleteIsarFriendsById(snapshot.docs[i].get('friendUserDocId'));
          } else {

            Uint8List? photoUint8List;
            //写真のアップデートがあったときの処理
            if (_friendData[snapshot.docs[i].get('friendUserDocId')] != null){
              if(_friendData[snapshot.docs[i].get('friendUserDocId')]!.profilePhotoUpdateCnt<(snapshot.docs[i].get('profilePhotoUpdateCnt')!)){
                // ２回目移行かつ写真の更新あり
                photoUint8List=await readFriendPhotoFromFirebase(ref,snapshot.docs[i].get('friendUserDocId'));
              }else{
                // ２回目移行かつ写真の更新なし
                photoUint8List=_friendData[snapshot.docs[i].get('friendUserDocId')]!.profilePhoto;
              }
            }else{
              //初回連携時
              photoUint8List=await readFriendPhotoFromFirebase(ref,snapshot.docs[i].get('friendUserDocId'));
            }

            _friendData[snapshot.docs[i].get('friendUserDocId')]=Friend(
              snapshot.docs[i].id,
              snapshot.docs[i].get('userDocId'),
              snapshot.docs[i].get('friendUserDocId'),
              snapshot.docs[i].get('friendUserName'),
              snapshot.docs[i].get('lastMessageContent'),
              snapshot.docs[i].get('lastMessageDocId'),
              snapshot.docs[i].get('lastMessageTime').toDateTime(),
              photoUint8List,
              snapshot.docs[i].get('profilePhotoUpdateCnt'),
              snapshot.docs[i].get('profilePhotoNameSuffix'),
              snapshot.docs[i].get('mute'),
              snapshot.docs[i].get('insertUserDocId'),
              snapshot.docs[i].get('insertProgramId'),
              snapshot.docs[i].get('insertTime').toDateTime(),
              snapshot.docs[i].get('updateUserDocId'),
              snapshot.docs[i].get('updateProgramId'),
              snapshot.docs[i].get('updateTime').toDateTime(),
              snapshot.docs[i].get('readableFlg'),
              snapshot.docs[i].get('deleteFlg'),
            );

            insertOrUpdateIsarFriend(
              friendDocId:snapshot.docs[i].id,
              userDocId:snapshot.docs[i].get('userDocId'),
              friendUserDocId:snapshot.docs[i].get('friendUserDocId'),
              friendUserName:snapshot.docs[i].get('friendUserName'),
              lastMessageContent:snapshot.docs[i].get('lastMessageContent'),
              lastMessageDocId:snapshot.docs[i].get('lastMessageDocId'),
              lastMessageTime:snapshot.docs[i].get('lastMessageTime').toDateTime(),
              profilePhoto:photoUint8List,
              profilePhotoUpdateCnt:snapshot.docs[i].get('profilePhotoUpdateCnt'),
              profilePhotoNameSuffix:snapshot.docs[i].get('profilePhotoNameSuffix'),
              mute:snapshot.docs[i].get('mute'),
              insertUserDocId:snapshot.docs[i].get('insertUserDocId'),
              insertProgramId:snapshot.docs[i].get('insertProgramId'),
              insertTime:snapshot.docs[i].get('insertTime').toDateTime(),
              updateUserDocId:snapshot.docs[i].get('updateUserDocId'),
              updateProgramId:snapshot.docs[i].get('updateProgramId'),
              updateTime:snapshot.docs[i].get('updateTime').toDateTime(),
              readableFlg:snapshot.docs[i].get('readableFlg'),
            );
          }

          if (snapshot.docs[i].get("updateTime").toDate().isAfter(friendsUpdatedTime)) {
            await insertOrUpdateIsarSettingBySettingCode(
                settingCode: "friendsUpdateCheck",
                dateTimeValue1: snapshot.docs[0].get("updateTime").toDate()
            );
          }
        }
        controller.sink.add(true);
        notifyListeners();
      }
    });
    return streamSub;
  }
}