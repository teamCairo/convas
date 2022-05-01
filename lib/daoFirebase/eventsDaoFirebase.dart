import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/logic/commonLogicLog.dart';
import '../common/provider/userProvider.dart';
import '../entityIsar/eventEntityIsar.dart';

Future<List<Event>> selectFirebaseEventsNotRepeatByDateTimeAndFriend(
    DateTime from, DateTime to, userDocId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('fromTime', isGreaterThan: Timestamp.fromDate(from.add(const Duration(days:-1))))
      .where('fromTime', isLessThan: Timestamp.fromDate(to))
      .where('repeat', isEqualTo: false)
      .where('userDocId',isEqualTo: userDocId)
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);
  return returnList;
}

Future<List<Event>> selectRepeatingEventDateByDateTimeAndFriend(DateTime to, String userDocId) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('toTime', isLessThanOrEqualTo: Timestamp.fromDate(to))
      .where('repeat', isEqualTo: true)
      .where('userDocId',isEqualTo: userDocId)
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);
  return returnList;
}

Future<List<Event>> selectFirebaseEventsByDateTimeOrderByFromLimitNum(
    DateTime from, DateTime to, int limitNum) async {

  //単発のデータを取得（その日と1日前～のFROMのデータ）
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('fromTime', isGreaterThan: Timestamp.fromDate(from))
      .where('fromTime', isLessThan: Timestamp.fromDate(to))
      .where('repeat', isEqualTo: false)
      .orderBy('fromTime')
      .limit(limitNum)
      .get();

  List<Event> returnList = setEventListFromSnapshot(snapshot);

  //Fromの日(前日の日付)の曜日の繰り返しデータ
  returnList.addAll(changeRepeatingEventDate(await selectFirebaseEventsByADay(from.weekday,limitNum), from));

  //Fromの日の翌日の曜日の繰り返しデータ
  DateTime thisDay=from.add(const Duration(days:1));
  int thisWeekDay=thisDay.weekday;
  returnList.addAll(changeRepeatingEventDate(await selectFirebaseEventsByADay(thisWeekDay,limitNum), thisDay));
//TODO ソートする
  //TODO　重複なくす
  //TODO　今の処理方式だと過去日の無駄なデータがいっぱい取れてしまう→TO日付でみたほうが良かったか違う★★過去イベントを表示するのはもうやめよう
  returnList.sort((a,b) => a.fromTime!.compareTo(b.fromTime!));


  return returnList;
}

List<Event> changeRepeatingEventDate(List<Event> inputEventList,DateTime fromDate){

  List<Event> outputList=[];

  for(int i=0;i<inputEventList.length;i++){

    DateTime newFromDate = DateTime(fromDate.year,fromDate.month,fromDate.day,inputEventList[i].fromTime!.hour,inputEventList[i].fromTime!.minute);
    Duration dayDifferenceFromTo = inputEventList[i].toTime!.difference(inputEventList[i].fromTime!);

    outputList.add(
      Event( inputEventList[i].eventDocId,
        inputEventList[i].userDocId,
        inputEventList[i].eventName,
        inputEventList[i].eventType,
        inputEventList[i].friendUserDocId,
        inputEventList[i].callChannelId,
        newFromDate,
        newFromDate.add(dayDifferenceFromTo),
        inputEventList[i].isAllDay,
        inputEventList[i].repeat,
        inputEventList[i].monday,
        inputEventList[i].tuesday,
        inputEventList[i].wednesday,
        inputEventList[i].thursday,
        inputEventList[i].friday,
        inputEventList[i].saturday,
        inputEventList[i].sunday,
        inputEventList[i].description,
        inputEventList[i].recurrenceRule,
        inputEventList[i].insertUserDocId,
        inputEventList[i].insertProgramId,
        inputEventList[i].insertTime,
        inputEventList[i].updateUserDocId,
        inputEventList[i].updateProgramId,
        inputEventList[i].updateTime,
        inputEventList[i].readableFlg,
        inputEventList[i].deleteFlg,
      )
    );

  }
  return outputList;

}

Future<List<Event>> selectFirebaseEventsByADay(int day,int limitNum) async {
  String dayStr="";
  if(day==1){
    dayStr="monday";

  }else if(day==2){
    dayStr="tuesday";

  }else if(day==3){
    dayStr="wednesday";

  }else if(day==4){
    dayStr="thursday";

  }else if(day==5){
    dayStr="friday";

  }else if(day==6){
    dayStr="saturday";

  }else if(day==7){
    dayStr="sunday";

  }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('events')
        .where(dayStr, isEqualTo: true)
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
    bool? isAllDay,
    bool? repeat,
    bool? monday,
    bool? tuesday,
    bool? wednesday,
    bool? thursday,
    bool? friday,
    bool? saturday,
    bool? sunday,
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
        'isAllDay': isAllDay??false,
        'repeat': repeat??false,
        'monday': monday??false,
        'tuesday': tuesday??false,
        'wednesday': wednesday??false,
        'thursday': thursday??false,
        'friday': friday??false,
        'saturday': saturday??false,
        'sunday': sunday??false,
        'description': description,
        'recurrenceRule': makeRRule(repeat??false, monday??false, tuesday??false, wednesday??false,
            thursday??false, friday??false, saturday??false, sunday??false),
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
  if (saturday) {
    rRule = rRule + "SA,";
  }
  if (sunday) {
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
    bool? isAllDay,
    bool? repeat,
    bool? monday,
    bool? tuesday,
    bool? wednesday,
    bool? thursday,
    bool? friday,
    bool? saturday,
    bool? sunday,
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
      'isAllDay': isAllDay??false,
      'repeat': repeat??false,
      'monday': monday??false,
      'tuesday': tuesday??false,
      'wednesday': wednesday??false,
      'thursday': thursday??false,
      'friday': friday??false,
      'saturday': saturday??false,
      'sunday': sunday??false,
      'description': description,
      'recurrenceRule':makeRRule(repeat??false, monday??false, tuesday??false, wednesday??false, thursday??false, friday??false, saturday??false, sunday??false),
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
