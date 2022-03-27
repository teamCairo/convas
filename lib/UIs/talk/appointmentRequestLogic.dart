import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/UIs/talk/appointmentRequestProvider.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:convas/daoIsar/friendDaoIsar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../daoFirebase/friendsDaoFirebase.dart';
import '../../daoFirebase/requestsDaoFirebase.dart';
import '../../entityIsar/friendEntityIsar.dart';

Future<void> createRequest(String friendUserDocId, WidgetRef ref)async {

  String chatHeaderDocId="";
  //Friendかどうかをチェック
  Friend? checkFriend = await selectIsarFriendById(friendUserDocId);
  if(checkFriend==null){
    chatHeaderDocId = await insertFriendsData(ref,friendUserDocId,"createRequest");
  }else{
    chatHeaderDocId = checkFriend.chatHeaderId;
  }

  String requestDocId = await insertFirebaseRequests(
      userDocId:ref.watch(userDataProvider).userData["userDocId"],
      friendUserDocId:friendUserDocId,
      courseCodeListText:ref.watch(appointRequestProvider).courseCodeListText,
      categoryCodeListText:ref.watch(appointRequestProvider).categoryCodeListText,
      message:ref.watch(appointRequestProvider).requestMessage,
      programId:"createRequest"
  );

  await insertChatDetailsDataMessage(
      ref:ref,
      chatHeaderDocId:chatHeaderDocId,
        friendUserDocId:friendUserDocId,
        message:ref.watch(appointRequestProvider).requestMessage,
        messageType:"3",
        referDocId: requestDocId,
        programId: "createRequest");

}