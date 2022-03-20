import 'package:isar/isar.dart';
import '../entityIsar/chatDetailEntityIsar.dart';



Future<ChatDetail?> selectIsarChatDetailById(String chatDetailDocId) async {

  var isarInstance = Isar.getInstance();

  ChatDetail? result;
  await isarInstance?.writeTxn((isar) async {
    result =
    await isar.chatDetails.filter().chatDetailDocIdEqualTo(chatDetailDocId).findFirst();
  });
  return result;
}


Future<List<ChatDetail>?> selectIsarChatDetailAll() async {
  var isarInstance = Isar.getInstance();

  List<ChatDetail>? resultList;
  await isarInstance?.writeTxn((isar) async {
    resultList =
    await isar.chatDetails.filter().deleteFlgEqualTo(false).findAll();
  });
  return resultList;
}

Future<List<ChatDetail>?> selectIsarChatDetailByChatHeaderDocId(String chatHeaderDocId) async {
  var isarInstance = Isar.getInstance();

  List<ChatDetail>? resultList;
  await isarInstance?.writeTxn((isar) async {
    resultList =
    await isar.chatDetails.filter().chatHeaderDocIdEqualTo(chatHeaderDocId).findAll();
  });
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

  return returnResult;

}

Future<int> deleteIsarChatDetailsById(String chatDetailDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.chatDetails.filter().chatDetailDocIdEqualTo(chatDetailDocId).deleteAll();
  });

  return returnInt;

}