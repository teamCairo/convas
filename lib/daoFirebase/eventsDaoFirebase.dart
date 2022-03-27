import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/logic/commonLogicLog.dart';
import '../common/provider/userProvider.dart';
import '../entityIsar/eventEntityIsar.dart';

Future<List<Event>> selectFirebaseEventsByDateTimeAndFriend(
    DateTime from, DateTime to, userDocId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('fromTime', isGreaterThan: Timestamp.fromDate(from))
      .where('fromTime', isLessThan: Timestamp.fromDate(to))
      .where('userDocId',isEqualTo: userDocId)
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);
  return returnList;
}

Future<List<Event>> selectFirebaseEventsByDateTimeOrderByFromLimitNum(
    DateTime from, DateTime to, int limitNum) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('fromTime', isGreaterThan: Timestamp.fromDate(from))
      .where('fromTime', isLessThan: Timestamp.fromDate(to))
      .orderBy('fromTime')
      .limit(limitNum)
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);
  return returnList;
}

List<Event> setEventListFromSnapshot(QuerySnapshot snapshot) {
  List<Event> returnList = [];
  for (int i = 0; i < snapshot.size; i++) {
    returnList.add(Event(
        snapshot.docs[i].id,
        snapshot.docs[i].get('userDocId'),
        snapshot.docs[i].get('eventName'),
        snapshot.docs[i].get('eventType'),
        snapshot.docs[i].get('friendUserDocId'),
        snapshot.docs[i].get('callChannelId'),
        snapshot.docs[i].get('fromTime').toDate(),
        snapshot.docs[i].get('toTime').toDate(),
        snapshot.docs[i].get('isAllDay'),
        snapshot.docs[i].get('repeat'),
        snapshot.docs[i].get('monday'),
        snapshot.docs[i].get('tuesday'),
        snapshot.docs[i].get('wednesday'),
        snapshot.docs[i].get('thursday'),
        snapshot.docs[i].get('friday'),
        snapshot.docs[i].get('saturday'),
        snapshot.docs[i].get('sunday'),
        snapshot.docs[i].get('description'),
        snapshot.docs[i].get('recurrenceRule'),
        snapshot.docs[i].get('insertUserDocId'),
        snapshot.docs[i].get('insertProgramId'),
        snapshot.docs[i].get('insertTime').toDate(),
        snapshot.docs[i].get('updateUserDocId'),
        snapshot.docs[i].get('updateProgramId'),
        snapshot.docs[i].get('updateTime').toDate(),
        snapshot.docs[i].get('readableFlg'),
        snapshot.docs[i].get('deleteFlg')));
  }
  return returnList;
}

Future<String> insertEventData(
    {required WidgetRef ref,
    required String userDocId,
    required String eventName,
    required String eventType,
    required String friendUserDocId,
    required String callChannelId,
    required DateTime fromTime,
    required DateTime toTime,
    required bool isAllDay,
    required bool repeat,
    required bool monday,
    required bool tuesday,
    required bool wednesday,
    required bool thursday,
    required bool friday,
    required bool saturday,
    required bool sunday,
    required String description,
    required String programId}) async {
  try {
    String insertedDocId = "";

    await FirebaseFirestore.instance.collection('events').add(
      {
        'userDocId': userDocId,
        'eventName': eventName,
        'eventType': eventType,
        'friendUserDocId': friendUserDocId,
        'callChannelId': callChannelId,
        'fromTime': Timestamp.fromDate(fromTime),
        'toTime': Timestamp.fromDate(toTime),
        'isAllDay': isAllDay,
        'repeat': repeat,
        'monday': monday,
        'tuesday': tuesday,
        'wednesday': wednesday,
        'thursday': thursday,
        'friday': friday,
        'saturday': saturday,
        'sunday': sunday,
        'description': description,
        'recurrenceRule': makeRRule(repeat, monday, tuesday, wednesday,
            thursday, friday, saturday, sunday),
        'insertUserDocId': ref.watch(userDataProvider).userData["userDocId"],
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId': ref.watch(userDataProvider).userData["userDocId"],
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      },
    ).then((value) {
      insertedDocId = value.id;
    });

    return insertedDocId;
  } catch (e) {
    log(e.toString());
    return "";
  }
}

String makeRRule(
  bool repeat,
  bool monday,
  bool tuesday,
  bool wednesday,
  bool thursday,
  bool friday,
  bool saturday,
  bool sunday,
) {
  if (!repeat) {
    return "";
  }

  String rRule = 'FREQ=WEEKLY;INTERVAL=1;BYDAY=';
  if (monday) {
    rRule = rRule + "MO,";
  }
  if (tuesday) {
    rRule = rRule + "TU,";
  }
  if (wednesday) {
    rRule = rRule + "WED,";
  }
  if (thursday) {
    rRule = rRule + "TH,";
  }
  if (friday) {
    rRule = rRule + "FRI,";
  }
  if (monday) {
    rRule = rRule + "SA,";
  }
  if (monday) {
    rRule = rRule + "SU,";
  }
  return rRule.substring(0,rRule.length-1);
}

Future<void> updateEventData(
    {required WidgetRef ref,
    required String eventDocId,
    required String userDocId,
    required String eventName,
    required String eventType,
    required String friendUserDocId,
    required String callChannelId,
    required DateTime fromTime,
    required DateTime toTime,
    required bool isAllDay,
      required bool repeat,
      required bool monday,
      required bool tuesday,
      required bool wednesday,
      required bool thursday,
      required bool friday,
      required bool saturday,
      required bool sunday,
      required String description,
    required String programId}) async {
  try {
    await FirebaseFirestore.instance
        .collection('events')
        .doc(eventDocId)
        .update({
      'userDocId': userDocId,
      'eventName': eventName,
      'eventType': eventType,
      'friendUserDocId': friendUserDocId,
      'callChannelId': callChannelId,
      'fromTime': Timestamp.fromDate(fromTime),
      'toTime': Timestamp.fromDate(toTime),
      'isAllDay': isAllDay,
      'repeat': repeat,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'description': description,
      'recurrenceRule':makeRRule(repeat, monday, tuesday, wednesday, thursday, friday, saturday, sunday),
      'updateUserDocId': ref.watch(userDataProvider).userData["userDocId"],
      'updateProgramId': programId,
      'updateTime': FieldValue.serverTimestamp(),
    });
  } catch (e) {
    log(e.toString());
  }

  commonLogAddDBProcess(
      databaseName: 'Firebase',
      entityName: 'events',
      crudType: 'update',
      columnName1: 'eventDocId',
      columnValue1: eventDocId,
      methodName: 'updateEventData');
}

Future<void> logicalDeleteEventData(
    String eventDocId, String userDocId, String programId) async {
  await FirebaseFirestore.instance.collection('events').doc(eventDocId).update({
    "deleteFlg": true,
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
  commonLogAddDBProcess(
      databaseName: 'Firebase',
      entityName: 'events',
      crudType: 'delete logial',
      columnName1: 'eventDocId',
      columnValue1: eventDocId,
      methodName: 'logicalDeleteEventData');
}
