import 'dart:typed_data';
import 'package:isar/isar.dart';

import '../entityIsar/friendEntityIsar.dart';

Future<Friend?> selectIsarFriendById(String friendUserDocId) async {

  var isarInstance = Isar.getInstance();
  Friend? resultFriend;
  await isarInstance?.writeTxn((isar) async {
    List<Friend> resultList =
    await isar.friends.filter().deleteFlgEqualTo(false).and().friendUserDocIdEqualTo(friendUserDocId).findAll();

    if(resultList.length == 0){
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
    await isar.friends.filter().deleteFlgEqualTo(false).findAll();

  });
  return resultFriendList;
}


Future<int> insertOrUpdateIsarFriend({
  required String friendDocId,
  required String userDocId,
  required String friendUserDocId,
  String? friendUserName,
  String? lastMessageContent,
  String? lastMessageDocId,
  DateTime? lastMessageTime,
  Uint8List? profilePhoto,
  required int profilePhotoUpdateCnt,
  String? profilePhotoNameSuffix,
  required bool mute,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,
}) async {

  Friend? targetFriend =await selectIsarFriendById(friendUserDocId);

  int returnValue=0;
  if(targetFriend==null){
    returnValue= await insertIsarFriend(
      friendDocId:friendDocId,
      userDocId:userDocId,
      friendUserDocId:friendUserDocId,
      friendUserName:friendUserName,
      lastMessageContent:lastMessageContent,
      lastMessageDocId:lastMessageDocId,
      lastMessageTime:lastMessageTime,
      profilePhoto:profilePhoto,
      profilePhotoUpdateCnt:profilePhotoUpdateCnt,
      profilePhotoNameSuffix:profilePhotoNameSuffix,
      mute:mute,
      insertUserDocId:insertUserDocId,
      insertProgramId:insertProgramId,
      insertTime:insertTime,
      updateUserDocId:updateUserDocId,
      updateProgramId:updateProgramId,
      updateTime:updateTime,
      readableFlg:readableFlg,
      deleteFlg:deleteFlg,


    );

  }else{

    returnValue= await updateIsarFriend(
      friendDocId:friendDocId,
      userDocId:userDocId,
      friendUserDocId:friendUserDocId,
      friendUserName:friendUserName,
      lastMessageContent:lastMessageContent,
      lastMessageDocId:lastMessageDocId,
      lastMessageTime:lastMessageTime,
      profilePhoto:profilePhoto,
      profilePhotoUpdateCnt:profilePhotoUpdateCnt,
      profilePhotoNameSuffix:profilePhotoNameSuffix,
      mute:mute,
      insertUserDocId:insertUserDocId,
      insertProgramId:insertProgramId,
      insertTime:insertTime,
      updateUserDocId:updateUserDocId,
      updateProgramId:updateProgramId,
      updateTime:updateTime,
      readableFlg:readableFlg,
      deleteFlg:deleteFlg,
    );
  }

  return returnValue;

}


Future<int> insertIsarFriend({
  required String friendDocId,
  required String userDocId,
  required String friendUserDocId,
  String? friendUserName,
  String? lastMessageContent,
  String? lastMessageDocId,
  DateTime? lastMessageTime,
  Uint8List? profilePhoto,
  required int profilePhotoUpdateCnt,
  String? profilePhotoNameSuffix,
  required bool mute,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,

}) async {

  Friend insertFriend = Friend(
    friendDocId,
    userDocId,
    friendUserDocId,
    friendUserName,
    lastMessageContent,
    lastMessageDocId,
    lastMessageTime,
    profilePhoto,
    profilePhotoUpdateCnt,
    profilePhotoNameSuffix,
    mute,
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
    returnResult=  await isar.friends.put(insertFriend);
  });

  return returnResult;

}



Future<int> updateIsarFriend({
  required String friendDocId,
  required String userDocId,
  required String friendUserDocId,
  String? friendUserName,
  String? lastMessageContent,
  String? lastMessageDocId,
  DateTime? lastMessageTime,
  Uint8List? profilePhoto,
  required int profilePhotoUpdateCnt,
  String? profilePhotoNameSuffix,
  required bool mute,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,

}) async {

  Friend? targetFriend =await selectIsarFriendById(friendUserDocId);

  Friend updateFriend = setIsarFriendParameters(
    inputFriend: targetFriend!,
    friendDocId:friendDocId,
    userDocId:userDocId,
    friendUserDocId:friendUserDocId,
    friendUserName:friendUserName,
    lastMessageContent:lastMessageContent,
    lastMessageDocId:lastMessageDocId,
    lastMessageTime:lastMessageTime,
    profilePhoto:profilePhoto,
    profilePhotoUpdateCnt:profilePhotoUpdateCnt,
    profilePhotoNameSuffix:profilePhotoNameSuffix,
    mute:mute,
    insertUserDocId:insertUserDocId,
    insertProgramId:insertProgramId,
    insertTime:insertTime,
    updateUserDocId:updateUserDocId,
    updateProgramId:updateProgramId,
    updateTime:updateTime,
    readableFlg:readableFlg,
    deleteFlg:deleteFlg,
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.friends.put(updateFriend);
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



Future<int> deleteIsarFriendsById(String friendUserDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.friends.filter().deleteFlgEqualTo(false).and().friendUserDocIdEqualTo(friendUserDocId).deleteAll();
  });

  return returnInt;

}



Friend setIsarFriendParameters({
  required Friend inputFriend,
  required String friendDocId,
  required String userDocId,
  required String friendUserDocId,
  String? friendUserName,
  String? lastMessageContent,
  String? lastMessageDocId,
  DateTime? lastMessageTime,
  Uint8List? profilePhoto,
  required int profilePhotoUpdateCnt,
  String? profilePhotoNameSuffix,
  required bool mute,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,

}){

  Friend tmpFriend =inputFriend;
  tmpFriend.friendDocId=friendDocId;
  tmpFriend.userDocId=userDocId;
  tmpFriend.friendUserDocId=friendUserDocId;
  tmpFriend.friendUserName=friendUserName;
  tmpFriend.lastMessageContent=lastMessageContent;
  tmpFriend.lastMessageDocId=lastMessageDocId;
  tmpFriend.lastMessageTime=lastMessageTime;
  tmpFriend.profilePhoto=profilePhoto;
  tmpFriend.profilePhotoUpdateCnt=profilePhotoUpdateCnt;
  tmpFriend.profilePhotoNameSuffix=profilePhotoNameSuffix;
  tmpFriend.mute=mute;
  tmpFriend.insertUserDocId=insertUserDocId;
  tmpFriend.insertProgramId=insertProgramId;
  tmpFriend.insertTime=insertTime;
  tmpFriend.updateUserDocId=updateUserDocId;
  tmpFriend.updateProgramId=updateProgramId;
  tmpFriend.updateTime=updateTime;
  tmpFriend.readableFlg=readableFlg;
  tmpFriend.deleteFlg=deleteFlg;
  return tmpFriend;
}