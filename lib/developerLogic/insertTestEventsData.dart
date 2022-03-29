import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../daoFirebase/eventsDaoFirebase.dart';
import '../daoFirebase/usersDaoFirebase.dart';


Future<void> insertTestEventsData(WidgetRef ref) async {

  var rng = Random();
  int times = 0;
  QuerySnapshot snapshot = await selectFirebaseAll();
  for(int i=0;i<10;i++){

    times =rng.nextInt(5);

    for(int j = 0;j<times; j++){

      DateTime from = DateTime.now().add(Duration(hours:rng.nextInt(100)));
      DateTime to = from.add(Duration(hours:1+rng.nextInt(4)));
      insertEventUnitData(ref:ref,userDocId:snapshot.docs[i].id,fromTime:from,toTime:to);
    }
  }
}

Future<String> insertEventUnitData({
  required WidgetRef ref,
  required String userDocId,
  required DateTime fromTime,
  required DateTime toTime,
})async {
  String insertedDocId = await insertEventData(
      ref:ref,
      eventName:"available",
      userDocId:userDocId,
      eventType:"1",
      friendUserDocId:"",
      callChannelId:"",
      fromTime:fromTime,
      toTime:toTime,
      isAllDay:false,
      repeat:false,
      monday:false,
      tuesday:false,
      wednesday:false,
      thursday:false,
      friday:false,
      saturday:false,
      sunday:false,
      description:"",
      programId:"insertTestEventsData"
  );

  return insertedDocId;
}