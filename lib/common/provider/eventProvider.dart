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

final eventDataProvider = ChangeNotifierProvider(
      (ref) => EventDataNotifier(),
);

class EventDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<bool>();
  StreamSubscription<QuerySnapshot>? streamSub;
  List<Event> _eventList = [];
  get eventList => _eventList;


  void closeStream() async {
    streamSub!.cancel();
  }

  Future<void> readEventDataFromIsarToMemory() async {

    _eventList=(await selectIsarEventAll())!;
    notifyListeners();
  }

  void clearIsar()async {


    deleteIsarSettingsByCode("eventsUpdateCheck");
    var isarInstance = Isar.getInstance();
    await isarInstance?.writeTxn((isar) async {
      isar.events.clear();
    });
  }

  void controlStreamOfReadEventNewDataFromFirebaseToIsar(String userDocId)async {

    streamSub=await readEventNewDataFromFirebaseToIsar(userDocId);

    if(controller.hasListener){

    }else{
      controller.stream.listen((value)  async{
        streamSub!.cancel();

        streamSub=await readEventNewDataFromFirebaseToIsar(userDocId);

      });
    }

  }

  Future<StreamSubscription<QuerySnapshot>> readEventNewDataFromFirebaseToIsar(String userDocId) async {
    Setting? tmpSetting = await selectIsarSettingByCode("eventsUpdateCheck");
    DateTime eventUpdatedTime = tmpSetting!.dateTimeValue1!;

    _callStream = FirebaseFirestore.instance
        .collection('events')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(eventUpdatedTime))
        .where('userDocId', isEqualTo: userDocId)
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();

    //TODO 1データを複数件として取得してしまう問題有り

    StreamSubscription<QuerySnapshot> streamSub=_callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {
        for(int i=0;i<snapshot.size;i++){
          if(snapshot.docs[i].get("deleteFlg")){

            await deleteIsarEventsById(snapshot.docs[i].id);

          }else{

            insertOrUpdateIsarEvent(
              eventDocId: snapshot.docs[i].id,
              eventName: snapshot.docs[i].get('eventName'),
              eventType: snapshot.docs[i].get('eventType'),
              friendUserDocId: snapshot.docs[i].get('friendUserDocId'),
              friendUserName: snapshot.docs[i].get('friendUserName'),
              callChannelId: snapshot.docs[i].get('callChannelId'),
              fromTime: snapshot.docs[i].get('fromTime').toDate(),
              toTime: snapshot.docs[i].get('toTime').toDate(),
              isAllDay: snapshot.docs[i].get('isAllDay'),
              insertUserDocId: snapshot.docs[i].get('insertUserDocId'),
              insertProgramId: snapshot.docs[i].get('insertProgramId'),
              insertTime: snapshot.docs[i].get('insertTime').toDate(),
              updateUserDocId: snapshot.docs[i].get('updateUserDocId'),
              updateProgramId: snapshot.docs[i].get('updateProgramId'),
              updateTime: snapshot.docs[i].get('updateTime').toDate(),
              readableFlg: snapshot.docs[i].get('readableFlg'),
              deleteFlg: snapshot.docs[i].get('deleteFlg'),


            );

          }
          if (snapshot.docs[i].get("updateTime").toDate().isAfter(eventUpdatedTime)) {
            await insertOrUpdateIsarSettingBySettingCode(
                settingCode: "eventsUpdateCheck",
                dateTimeValue1: snapshot.docs[i].get("updateTime").toDate()
            );
          }

        }
        await readEventDataFromIsarToMemory();
        controller.sink.add(true);
      }

    });
    return streamSub;
  }
}
