import 'package:convas/common/provider/friendProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../daoFirebase/friendsDaoFirebase.dart';
import '../talk/chatPageUI.dart';
import 'friendProfileProvider.dart';

Future<void> insertFriendAndMoveToChatPage(WidgetRef ref,BuildContext context, String friendUserDocId) async{
  String chatHeaderDocId ="";
  if(!ref.watch(friendProfileDataProvider).friendProfileData["friendFlg"]){
    chatHeaderDocId = await insertFriendsData(ref, friendUserDocId, "friendProfile");
  }else{
    chatHeaderDocId=ref.watch(friendDataProvider).friendData[friendUserDocId]!.chatHeaderId;
  }

  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) {
      return ChatPage(
        friendUserDocId:friendUserDocId
        ,friendUserName:ref.watch(friendProfileDataProvider).friendProfileData["name"],
        chatHeaderDocId: chatHeaderDocId,
      );
    }),
  );

}