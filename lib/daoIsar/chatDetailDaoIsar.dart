import 'package:isar/isar.dart';
import '../common/logic/commonLogicLog.dart';
import '../entityIsar/chatDetailEntityIsar.dart';



Future<ChatDetail?> selectIsarChatDetailById(String chatDetailDocId) async {

  var isarInstance = Isar.getInstance();

  ChatDetail? result;
  await isarInstance?.writeTxn((isar) async {
    result =
    await isar.chatDetails.filter().chatDetailDocIdEqualTo(chatDetailDocId).findFirst();
  });
  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'chatDetail', crudType: 'read', columnName1: 'chatDetailDocId',
      columnValue1: result==null?"":result!.chatDetailDocId, methodName: 'selectIsarChatDetailById');
  return result;
}


Future<List<ChatDetail>?> selectIsarChatDetailAll() async {
  var isarInstance = Isar.getInstance();

  List<ChatDetail>? resultList;
  await isarInstance?.writeTxn((isar) async {
    resultList =
    await isar.chatDetails.filter().deleteFlgEqualTo(false).findAll();
  });
  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'chatDetail', crudType: 'read', columnName1: '',
      columnValue1: '',optionString: "count="+resultList!.length.toString(),methodName: 'selectIsarChatDetailAll');
  return resultList;
}

Future<int> insertOrUpdateIsarChatDetail(
    ChatDetail chatDetailData
    ) async {

  await deleteIsarChatDetailsById(chatDetailData.chatDetailDocId);
  return await insertIsarChatDetail(chatDetailData);

}


Future<int> insertIsarChatDetail(
    ChatDetail chatDetailData
    ) async {
  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.chatDetails.put(chatDetailData);
  });

  commonLogAddDBProcess(databaseName: 'Isar', entityName: 'chatDetail', crudType: 'create', columnName1: 'chatDetailDocId',
      columnValue1: chatDetailData.chatDetailDocId,methodName: 'insertIsarChatDetail');

  return returnResult;

}

Future<int> deleteIsarChatDetailsById(String chatDetailDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.chatDetails.filter().chatDetailDocIdEqualTo(chatDetailDocId).deleteAll();
  });
  //
  // commonLogAddDBProcess(databaseName: 'Isar', entityName: 'chatDetail', crudType: 'delete', columnName1: 'chatDetailDocId',
  //     columnValue1: chatDetailDocId,methodName: 'deleteIsarChatDetailsById');

  return returnInt;

}