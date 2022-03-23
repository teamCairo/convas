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
import '../logic/commonLogicFile.dart';

final friendDataProvider = ChangeNotifierProvider(
      (ref) => FriendDataNotifier(),
);

class FriendDataNotifier extends ChangeNotifier {
  Map<String, Friend> _friendData = {}; //キーはFriendのuserDocId
  Map<String, Friend> get friendData => _friendData;

  List<Friend> getFriendList(){

    List<Friend> friendList=[];

    _friendData.forEach((key, value) {
      friendList.add(value);
    });

    friendList.sort((a,b) => b.lastMessageTime.compareTo(a.lastMessageTime));

    return friendList;
  }

  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;

  Future<Uint8List?> readFriendPhotoFromFirebase(
      WidgetRef ref, String friendUserDocId, String profilePhotoNameSuffix) async {

    if (profilePhotoNameSuffix == "" ) {
      return null;
    }else{
      //画像ファイルの取得
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference imageRef = storage.ref().child("profile").child(friendUserDocId).child("mainPhoto_small" + profilePhotoNameSuffix);
      String imageUrl = await imageRef.getDownloadURL();
      File imgFile=await urlToFile(imageUrl);

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

  void controlStreamOfReadFriendNewDataFromFirebaseToIsarAndMemory(
      WidgetRef ref,String userDocId) async {
    //最初は必ず呼び出し
    streamSub = await readFriendFromFirebaseToIsarAndMemory(ref,userDocId);

    if (controller.hasListener) {
    } else {
      controller.stream.listen((value) async {
        if(value=="listen"){
          streamSub = await readFriendFromFirebaseToIsarAndMemory(ref,userDocId);
        }

        if(value=="cancel"){
          streamSub!.cancel();
        }

      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>>
  readFriendFromFirebaseToIsarAndMemory(WidgetRef ref,String userDocId) async {

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
        controller.sink.add("cancel");

        for (int i = 0; i < snapshot.size; i++) {
          if (snapshot.docs[i].get("deleteFlg")) {
              _friendData.remove(snapshot.docs[i].get('friendUserDocId'));
              await deleteIsarFriendsByFriendUserDocId(snapshot.docs[i].get('friendUserDocId'));
          } else {

            Uint8List? photoUint8List;
            //写真のアップデートがあったときの処理
            if (_friendData[snapshot.docs[i].get('friendUserDocId')] != null){
              if(_friendData[snapshot.docs[i].get('friendUserDocId')]!.profilePhotoUpdateCnt<(snapshot.docs[i].get('profilePhotoUpdateCnt')!)){
                // ２回目移行かつ写真の更新あり
                photoUint8List=await readFriendPhotoFromFirebase(ref,snapshot.docs[i].get('friendUserDocId'),snapshot.docs[i].get('profilePhotoNameSuffix'));
              }else{
                // ２回目移行かつ写真の更新なし
                photoUint8List=_friendData[snapshot.docs[i].get('friendUserDocId')]!.profilePhoto;
              }
            }else{
              //初回連携時
              photoUint8List=await readFriendPhotoFromFirebase(ref,snapshot.docs[i].get('friendUserDocId'),snapshot.docs[i].get('profilePhotoNameSuffix'));
            }

            _friendData[snapshot.docs[i].get('friendUserDocId')]=Friend(
              snapshot.docs[i].id,
              snapshot.docs[i].get('userDocId'),
              snapshot.docs[i].get('friendUserDocId'),
              snapshot.docs[i].get('friendUserName'),
              snapshot.docs[i].get('lastMessageContent'),
              snapshot.docs[i].get('lastMessageDocId'),
              snapshot.docs[i].get('lastMessageTime').toDate(),
              photoUint8List,
              snapshot.docs[i].get('profilePhotoUpdateCnt'),
              snapshot.docs[i].get('profilePhotoNameSuffix'),
              snapshot.docs[i].get('mute'),
              snapshot.docs[i].get('chatHeaderDocId'),
              snapshot.docs[i].get('insertUserDocId'),
              snapshot.docs[i].get('insertProgramId'),
              snapshot.docs[i].get('insertTime').toDate(),
              snapshot.docs[i].get('updateUserDocId'),
              snapshot.docs[i].get('updateProgramId'),
              snapshot.docs[i].get('updateTime').toDate(),
              snapshot.docs[i].get('readableFlg'),
              snapshot.docs[i].get('deleteFlg'),
            );

            await insertOrUpdateIsarFriend(
                _friendData[snapshot.docs[i].get('friendUserDocId')]!
            );
          }

          if (snapshot.docs[i].get("updateTime").toDate().isAfter(friendsUpdatedTime)) {
            await insertOrUpdateIsarSettingBySettingCode(
                settingCode: "friendsUpdateCheck",
                dateTimeValue1: snapshot.docs[0].get("updateTime").toDate()
            );
          }
        }
        controller.sink.add("listen");
        notifyListeners();
      }
    });
    return streamSub;
  }
}
