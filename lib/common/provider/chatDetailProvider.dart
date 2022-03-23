import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/chatDetailEntityIsar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../daoIsar/chatDetailDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../entityIsar/chatDetailEntityIsar.dart' as chatDetail;

final chatDetailDataProvider = ChangeNotifierProvider(
      (ref) => ChatDetailDataNotifier(),
);

class ChatDetailDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;

  void closeStream() async {
    streamSub!.cancel();
  }

  void clearIsar()async {


    deleteIsarSettingsByCode("chatDetailsUpdateCheck");
    var isarInstance = Isar.getInstance();
    await isarInstance?.writeTxn((isar) async {
      isar.chatDetails.clear();
    });
  }

  void controlStreamOfReadChatDetailNewDataFromFirebaseToIsar(String userDocId)async {

    streamSub=await readChatDetailNewDataFromFirebaseToIsar(userDocId);

    if(controller.hasListener){

    }else{

      controller.stream.listen((value) async {
        if(value=="listen"){
          streamSub=await readChatDetailNewDataFromFirebaseToIsar(userDocId);
        }

        if(value=="cancel"){
          streamSub!.cancel();
        }

      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>> readChatDetailNewDataFromFirebaseToIsar(String userDocId) async {
    Setting? tmpSetting = await selectIsarSettingByCode("chatDetailsUpdateCheck");
    DateTime chatDetailUpdatedTime = tmpSetting!.dateTimeValue1!;

    _callStream = FirebaseFirestore.instance
        .collection('chatDetails')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(chatDetailUpdatedTime))
        .where('userDocId', isEqualTo: userDocId)
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();


    StreamSubscription<QuerySnapshot> streamSub=_callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

        controller.sink.add("cancel");

        for(int i=0;i<snapshot.size;i++){
          if(snapshot.docs[i].get("deleteFlg")){

            await deleteIsarChatDetailsById(snapshot.docs[i].id);

          }else{

            await insertOrUpdateIsarChatDetail(
              ChatDetail(
                  snapshot.docs[i].id,
                  snapshot.docs[i].get('chatHeaderDocId'),
                  snapshot.docs[i].get('senderUserDocId'),
                  snapshot.docs[i].get('receiverUserDocId'),
                  snapshot.docs[i].get('userDocId'),
                  snapshot.docs[i].get('messageType'),
                  snapshot.docs[i].get('fileNameSuffix'),
                  snapshot.docs[i].get('referDocId'),
                  snapshot.docs[i].get('message'),
                  snapshot.docs[i].get('sendTime').toDate(),
                  snapshot.docs[i].get('insertUserDocId'),
                  snapshot.docs[i].get('insertProgramId'),
                  snapshot.docs[i].get('insertTime').toDate(),
                  snapshot.docs[i].get('updateUserDocId'),
                  snapshot.docs[i].get('updateProgramId'),
                  snapshot.docs[i].get('updateTime').toDate(),
                  snapshot.docs[i].get('readableFlg'),
                  snapshot.docs[i].get('deleteFlg')
              )

            );

          }
          if (snapshot.docs[i].get("updateTime").toDate().isAfter(chatDetailUpdatedTime)) {
            await insertOrUpdateIsarSettingBySettingCode(
                settingCode: "chatDetailsUpdateCheck",
                dateTimeValue1: snapshot.docs[i].get("updateTime").toDate()
            );
          }

        }

        controller.sink.add("listen");
      }

    });
    return streamSub;
  }
}
