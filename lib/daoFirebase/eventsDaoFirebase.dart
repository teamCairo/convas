import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/logic/commonLogicLog.dart';
import '../common/provider/userProvider.dart';
import '../entityIsar/eventEntityIsar.dart';

Future<List<Event>> selectFirebaseEventsByDateTimeAndFriend(DateTime from, DateTime to,userDocId)async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('userDocId', isEqualTo: userDocId)
      .where('toTime', isGreaterThan: from)
      .where('fromTime', isLessThan: to)
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);
  return returnList;
}

Future<List<Event>> selectFirebaseEventsByDateTimeOrderByFrom(DateTime from, DateTime to)async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('fromTime', isGreaterThan: Timestamp.fromDate(from))
      .where('fromTime', isLessThan: Timestamp.fromDate(to))
      .orderBy('fromTime')
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);
  return returnList;
}

List<Event> setEventListFromSnapshot(QuerySnapshot snapshot){

  List<Event> returnList = [];
  for(int i =0;i<snapshot.size;i++){
    returnList.add(Event(
      snapshot.docs[i].id,snapshot.docs[i].get('userDocId'),
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
      snapshot.docs[i].get('deleteFlg')
    ));
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

    commonLogAddDBProcess(databaseName: 'Firebase', entityName: 'events', crudType: 'create', columnName1: 'eventDocId',
        columnValue1: insertedDocId, methodName: 'insertEventData');

    return insertedDocId;
  } catch (e) {
    log(e.toString());
    return "";
  }
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
      'isAllDay':isAllDay,
      'updateUserDocId': ref.watch(userDataProvider).userData["userDocId"],
      'updateProgramId': programId,
      'updateTime': FieldValue.serverTimestamp(),
    });
  } catch (e) {
    log(e.toString());
  }

  commonLogAddDBProcess(databaseName: 'Firebase', entityName: 'events', crudType: 'update', columnName1: 'eventDocId',
      columnValue1: eventDocId, methodName: 'updateEventData');
}



Future<void> logicalDeleteEventData(String eventDocId,String userDocId,String programId) async {

  await FirebaseFirestore.instance
      .collection('events')
      .doc(eventDocId)
      .update({
    "deleteFlg": true,
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
  commonLogAddDBProcess(databaseName: 'Firebase', entityName: 'events', crudType: 'delete logial', columnName1: 'eventDocId',
      columnValue1: eventDocId, methodName: 'logicalDeleteEventData');
}