import 'package:isar/isar.dart';

import '../entityIsar/friendEntityIsar.dart';

Future<Friend?> selectIsarFriendById(String friendUserDocId) async {

  var isarInstance = Isar.getInstance();
  Friend? resultFriend;
  await isarInstance?.writeTxn((isar) async {
    List<Friend> resultList =
    await isar.friends.filter().deleteFlgEqualTo(false).and().friendUserDocIdEqualTo(friendUserDocId).findAll();

    if(resultList.isEmpty){
      resultFriend = null;
    }else{
      resultFriend = resultList[0];
    }
  });
  return resultFriend;
}

Future<List<Friend>?> selectIsarFriendAll() async {

  List<Friend>? resultFriendList;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    resultFriendList =
    await isar.friends.filter().deleteFlgEqualTo(false).sortByLastMessageTimeDesc().findAll();

  });
  return resultFriendList;
}


Future<int> insertOrUpdateIsarFriend(
    Friend friendData
    ) async {
  await deleteIsarFriendsByFriendUserDocId(friendData.friendUserDocId);
  return await insertIsarFriend(friendData);

}

Future<int> insertIsarFriend(
    Friend friendData
    ) async {

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.friends.put(friendData);
  });

  return returnResult;

}

Future<int> deleteIsarFriends() async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.friends.filter().deleteFlgEqualTo(false).deleteAll();
  });

  return returnInt;

}

Future<int> deleteIsarFriendsByFriendUserDocId(String friendUserDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.friends.filter().deleteFlgEqualTo(false).and().friendUserDocIdEqualTo(friendUserDocId).deleteAll();
  });

  return returnInt;

}