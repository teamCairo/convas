import 'dart:developer';
import 'package:isar/isar.dart';

import '../common/logic/commonLogicLog.dart';
import '../entityIsar/eventEntityIsar.dart';

Future<Event?> selectIsarEventById(String eventDocId) async {

  var isarInstance = Isar.getInstance();
  Event? result;
  await isarInstance?.writeTxn((isar) async {
    result =
    await isar.events.filter().deleteFlgEqualTo(false).and().eventDocIdEqualTo(eventDocId).findFirst();

  });

  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'event', crudType: 'read', columnName1: 'eventDocId',
      columnValue1: eventDocId,methodName: 'selectIsarEventById');

  return result;
}

Future<List<Event>?> selectIsarEventAll() async {

  List<Event>? resultEventList;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    resultEventList =
    await isar.events.filter().deleteFlgEqualTo(false).findAll();
  });

  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'event', crudType: 'read', columnName1: '',
      columnValue1:'' , optionString: 'count='+resultEventList!.length.toString(), methodName: 'selectIsarEventAll');
  return resultEventList;
}


Future<int> insertOrUpdateIsarEvent({
  required String eventDocId,
  required String eventName,
  required String eventType,
  required String friendUserDocId,
  required String friendUserName,
  String? callChannelId,
  DateTime? fromTime,
  DateTime? toTime,
  required bool isAllDay,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,

}) async {

  Event? targetEvent =await selectIsarEventById(eventDocId);

  int returnValue=0;
  if(targetEvent==null){
    returnValue= await insertIsarEvent(
      eventDocId: eventDocId,
      eventName: eventName,
      eventType: eventType,
      friendUserDocId: friendUserDocId,
      friendUserName: friendUserName,
      callChannelId: callChannelId,
      fromTime: fromTime,
      toTime: toTime,
      isAllDay: isAllDay,
      insertUserDocId: insertUserDocId,
      insertProgramId: insertProgramId,
      insertTime: insertTime,
      updateUserDocId: updateUserDocId,
      updateProgramId: updateProgramId,
      updateTime: updateTime,
      readableFlg: readableFlg,
      deleteFlg: deleteFlg,

    );

  }else{

    returnValue= await updateIsarEvent(
      eventDocId: eventDocId,
      eventName: eventName,
      eventType: eventType,
      friendUserDocId: friendUserDocId,
      friendUserName: friendUserName,
      callChannelId: callChannelId,
      fromTime: fromTime,
      toTime: toTime,
      isAllDay: isAllDay,
      insertUserDocId: insertUserDocId,
      insertProgramId: insertProgramId,
      insertTime: insertTime,
      updateUserDocId: updateUserDocId,
      updateProgramId: updateProgramId,
      updateTime: updateTime,
      readableFlg: readableFlg,
      deleteFlg: deleteFlg,



    );

  }

  return returnValue;

}


Future<int> insertIsarEvent({
  required String eventDocId,
  required String eventName,
  required String eventType,
  required String friendUserDocId,
  required String friendUserName,
  String? callChannelId,
  DateTime? fromTime,
  DateTime? toTime,
  required bool isAllDay,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,



}) async {

  Event insertEvent = Event(
    eventDocId,
    eventName,
    eventType,
    friendUserDocId,
    friendUserName,
    callChannelId,
    fromTime,
    toTime,
    isAllDay,
    insertUserDocId,
    insertProgramId,
    insertTime,
    updateUserDocId,
    updateProgramId,
    updateTime,
    readableFlg,
    deleteFlg,
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.events.put(insertEvent);
  });

  return returnResult;

}



Future<int> updateIsarEvent({
  required String eventDocId,
  required String eventName,
  required String eventType,
  required String friendUserDocId,
  required String friendUserName,
  String? callChannelId,
  DateTime? fromTime,
  DateTime? toTime,
  required bool isAllDay,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,

}) async {

  Event? targetEvent =await selectIsarEventById(eventDocId);

  Event updateEvent = setIsarEventParameters(
    inputEvent: targetEvent!,
    eventDocId: eventDocId,
    eventName: eventName,
    eventType: eventType,
    friendUserDocId: friendUserDocId,
    friendUserName: friendUserName,
    callChannelId: callChannelId,
    fromTime: fromTime,
    toTime: toTime,
    isAllDay: isAllDay,
    insertUserDocId: insertUserDocId,
    insertProgramId: insertProgramId,
    insertTime: insertTime,
    updateUserDocId: updateUserDocId,
    updateProgramId: updateProgramId,
    updateTime: updateTime,
    readableFlg: readableFlg,
    deleteFlg: deleteFlg,

  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.events.put(updateEvent);
  });

  return returnResult;

}


Future<int> deleteIsarEventsById(eventDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.events.filter().deleteFlgEqualTo(false).and().eventDocIdEqualTo(eventDocId).deleteAll();
  });

  return returnInt;

}



Event setIsarEventParameters({
  required Event inputEvent,
  required String eventDocId,
  required String eventName,
  required String eventType,
  required String friendUserDocId,
  required String friendUserName,
  String? callChannelId,
  DateTime? fromTime,
  DateTime? toTime,
  required bool isAllDay,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,

}){

  Event tmpEvent =inputEvent;
  tmpEvent.eventDocId=eventDocId;
  tmpEvent.eventName=eventName;
  tmpEvent.eventType=eventType;
  tmpEvent.friendUserDocId=friendUserDocId;
  tmpEvent.friendUserName=friendUserName;
  tmpEvent.callChannelId=callChannelId;
  tmpEvent.fromTime=fromTime;
  tmpEvent.toTime=toTime;
  tmpEvent.isAllDay=isAllDay;
  tmpEvent.insertUserDocId=insertUserDocId;
  tmpEvent.insertProgramId=insertProgramId;
  tmpEvent.insertTime=insertTime;
  tmpEvent.updateUserDocId=updateUserDocId;
  tmpEvent.updateProgramId=updateProgramId;
  tmpEvent.updateTime=updateTime;
  tmpEvent.readableFlg=readableFlg;
  tmpEvent.deleteFlg=deleteFlg;


  return tmpEvent;
}