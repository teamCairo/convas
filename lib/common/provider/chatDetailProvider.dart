import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/chatDetailEntityIsar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoIsar/chatDetailDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';

final chatDetailDataProvider = ChangeNotifierProvider(
      (ref) => ChatDetailDataNotifier(),
);

class ChatDetailDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;
  DateTime? updateCheckTime;

  void closeStream() async {
    streamSub!.cancel();
  }

  void controlStreamOfReadChatDetailNewDataFromFirebaseToIsar(WidgetRef ref,String userDocId)async {

    streamSub=await readChatDetailNewDataFromFirebaseToIsar(userDocId,ref);

    if(controller.hasListener){

    }else{

      controller.stream.listen((value) async {
        if(value=="listen"){
          streamSub=await readChatDetailNewDataFromFirebaseToIsar(userDocId,ref);
        }

        if(value=="cancel"){
          streamSub!.cancel();
        }

      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>> readChatDetailNewDataFromFirebaseToIsar(String userDocId,WidgetRef ref) async {

    updateCheckTime ??= await selectIsarSettingUpdateCheckTimeByEntityName("chatDetails");

    _callStream = FirebaseFirestore.instance
        .collection('chatDetails')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(updateCheckTime!))
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
        }

        updateCheckTime=snapshot.docs[snapshot.size-1].get("updateTime").toDate();
        insertOrUpdateIsarSettingUpdateCheckTime(
            "chatDetails",
            snapshot.docs[snapshot.size-1].get("updateTime").toDate()
        );
        controller.sink.add("listen");
      }

    });
    return streamSub;
  }
}
