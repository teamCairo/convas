import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/eventEntityIsar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../daoIsar/eventDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../entityIsar/eventEntityIsar.dart' as event;
import '../logic/commonLogicLog.dart';

final eventDataProvider = ChangeNotifierProvider(
  (ref) => EventDataNotifier(),
);

class EventDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<bool>();
  StreamSubscription<QuerySnapshot>? streamSub;
  DateTime? updateTime;//追加

  void closeStream() async {
    streamSub!.cancel();
  }

  void clearIsar() async {
    deleteIsarSettingsByCode("eventsUpdateCheck");
    var isarInstance = Isar.getInstance();
    await isarInstance?.writeTxn((isar) async {
      isar.events.clear();
    });
  }

  void controlStreamOfReadEventNewDataFromFirebaseToIsar(
      String userDocId) async {
    streamSub = await readEventNewDataFromFirebaseToIsar(userDocId);

    if (controller.hasListener) {
    } else {
      controller.stream.listen((value) async {
        streamSub!.cancel();

        streamSub = await readEventNewDataFromFirebaseToIsar(userDocId);
      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>> readEventNewDataFromFirebaseToIsar(
      String userDocId) async {
    Setting? tmpSetting = await selectIsarSettingByCode("eventsUpdateCheck");
    DateTime eventUpdatedTime = tmpSetting!.dateTimeValue1!;

    log("listen");
    commonLogAddDBProcess(
        databaseName: 'Firebase',
        entityName: 'events',
        crudType: 'ListenStart',
        columnName1: 'updateTime',
        columnValue1: eventUpdatedTime.toString(),
        columnName2: 'userDocId',
        columnValue2: userDocId,
        methodName: 'readEventNewDataFromFirebaseToIsar');

    _callStream = FirebaseFirestore.instance
        .collection('events')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(eventUpdatedTime))
        .where('userDocId', isEqualTo: userDocId)
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();


    //TODO 1データを複数件として取得してしまう問題有り

    StreamSubscription<QuerySnapshot> streamSub =
        _callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

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
          if (snapshot.docs[i]
              .get("updateTime")
              .toDate()
              .isAfter(eventUpdatedTime)) {
            await insertOrUpdateIsarSettingBySettingCode(
                settingCode: "eventsUpdateCheck",
                dateTimeValue1: snapshot.docs[i].get("updateTime").toDate());
          }
        }
        controller.sink.add(true);
      }
    });
    return streamSub;
  }
}
