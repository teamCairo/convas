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


Future<int> insertOrUpdateIsarEvent(
    Event eventData
    ) async {
  await deleteIsarEventsById(eventData.eventDocId);
  return await insertIsarEvent(eventData);

}


Future<int> insertIsarEvent(
    Event eventData
    ) async {


  var isarInstance = Isar.getInstance();
  int returnResult=0;
  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.events.put(eventData);
  });

  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'event', crudType: 'create', columnName1: 'eventDocId',
      columnValue1:eventData.eventDocId ,columnName2: 'id', columnValue2:returnResult.toString() ,methodName: 'insertIsarEvent');

  return returnResult;

}

Future<int> deleteIsarEventsById(eventDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.events.filter().deleteFlgEqualTo(false).and().eventDocIdEqualTo(eventDocId).deleteAll();
  });
  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'event', crudType: 'delete', columnName1: 'eventDocId',
      columnValue1:eventDocId ,columnName2: 'id', columnValue2:returnInt.toString() ,methodName: 'deleteIsarEventsById');

  return returnInt;

}