import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/eventEntityIsar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoIsar/eventDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';

final eventDataProvider = ChangeNotifierProvider(
  (ref) => EventDataNotifier(),
);

class EventDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;
  DateTime? updateCheckTime;

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
    updateCheckTime ??= await selectIsarSettingUpdateCheckTimeByEntityName("events");


    _callStream = FirebaseFirestore.instance
        .collection('events')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(updateCheckTime!))
        .where('userDocId', isEqualTo: userDocId)
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();


    StreamSubscription<QuerySnapshot> streamSub =
        _callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

        controller.sink.add("cancel");
        for (int i = 0; i < snapshot.size; i++) {

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

        updateCheckTime=snapshot.docs[snapshot.size-1].get("updateTime").toDate();
        insertOrUpdateIsarSettingUpdateCheckTime(
            "events",
            snapshot.docs[snapshot.size-1].get("updateTime").toDate()
        );
        controller.sink.add("listen");
      }
    });
    return streamSub;
  }
}
