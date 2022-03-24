import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/provider/settingProvider.dart';
import 'package:convas/entityIsar/eventEntityIsar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoIsar/eventDaoIsar.dart';
import '../logic/commonLogicLog.dart';

final eventDataProvider = ChangeNotifierProvider(
  (ref) => EventDataNotifier(),
);

class EventDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;
  DateTime? updateTime;//追加

  void closeStream() async {
    streamSub!.cancel();
  }

  void controlStreamOfReadEventNewDataFromFirebaseToIsar(WidgetRef ref,
      String userDocId) async {
    streamSub = await readEventNewDataFromFirebaseToIsar(ref,userDocId);

    if (controller.hasListener) {
    } else {
      controller.stream.listen((value) async {
        if(value=="listen"){
          streamSub = await readEventNewDataFromFirebaseToIsar(ref,userDocId);
        }

        if(value=="cancel"){
          streamSub!.cancel();
        }

      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>> readEventNewDataFromFirebaseToIsar(WidgetRef ref,
      String userDocId) async {
    DateTime eventUpdatedTime = ref.watch(settingDataProvider).getSettingUpdateCheckData("events");

    _callStream = FirebaseFirestore.instance
        .collection('events')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(eventUpdatedTime))
        .where('userDocId', isEqualTo: userDocId)
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();


    StreamSubscription<QuerySnapshot> streamSub =
        _callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

        controller.sink.add("cancel");

        for (int i = 0; i < snapshot.size; i++) {
          commonLogAddDBProcess(
              databaseName: 'Firebase',
              entityName: 'events',
              crudType: 'read',
              columnName1: '',
              columnValue1: '',
              methodName: 'StreamSubscription<QuerySnapshot> streamSub',
              optionString: 'count:' + snapshot.size.toString());

          if (snapshot.docs[i].get("deleteFlg")) {
            await deleteIsarEventsById(snapshot.docs[i].id);
          } else {
            await insertOrUpdateIsarEvent(Event(
                snapshot.docs[i].id,
                snapshot.docs[i].get('userDocId'),
                snapshot.docs[i].get('eventName'),
                snapshot.docs[i].get('eventType'),
                snapshot.docs[i].get('friendUserDocId'),
                snapshot.docs[i].get('callChannelId'),
                snapshot.docs[i].get('fromTime').toDate(),
                snapshot.docs[i].get('toTime').toDate(),
                snapshot.docs[i].get('isAllDay'),
                snapshot.docs[i].get('insertUserDocId'),
                snapshot.docs[i].get('insertProgramId'),
                snapshot.docs[i].get('insertTime').toDate(),
                snapshot.docs[i].get('updateUserDocId'),
                snapshot.docs[i].get('updateProgramId'),
                snapshot.docs[i].get('updateTime').toDate(),
                snapshot.docs[i].get('readableFlg'),
                snapshot.docs[i].get('deleteFlg')));
          }
        }
        ref.read(settingDataProvider).setSettingUpdateCheckData("events", snapshot.docs[snapshot.size-1].get("updateTime").toDate());
        controller.sink.add("listen");
      }
    });
    return streamSub;
  }
}
