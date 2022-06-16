import 'dart:ffi';

import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonPushUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:isar/isar.dart';

import '../../common/UI/commonIconsUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../entityIsar/chatDetailEntityIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../findRoute/friendProfileRootUI.dart';
import 'appointmentRequestViewUI.dart';

class ChatPage extends ConsumerWidget {
  String friendUserDocId;
  String friendUserName;
  String chatHeaderDocId;
  Image? friendPhoto;

  ChatPage({
    required this.friendUserDocId,
    required this.friendUserName,
    required this.chatHeaderDocId,
    this.friendPhoto,
    Key? key,
  }) : super(key: key);

  String message = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Friend? friendData =
        ref.watch(friendDataProvider).friendData[friendUserDocId];

    Image? friendImage;
    String friendNameTmp = "";
    if (friendData != null) {
      friendNameTmp = friendData.friendUserName;
      if (friendData.profilePhoto == null) {
        friendData.profilePhoto;
      } else {
        friendImage = Image.memory(friendData.profilePhoto!);
      }
    } else {
      friendImage = friendPhoto;
      friendNameTmp = friendUserName;
    }

    return Scaffold(
        appBar:commonAppbar(friendNameTmp),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
              child: buildMessageList(
                  ref.watch(userDataProvider).userData["userDocId"]!,
                  friendUserDocId,
                  chatHeaderDocId,
                  ref),
            ),
          ),
          textInputWidget(ref, context, friendNameTmp, friendImage)
        ])));
  }

  Padding balloon(
      ChatDetail chatDetail, String rightLeft, BuildContext context,WidgetRef ref) {
    //rightLeft="right"or"left"

    List<Widget> widgetList = [];
    widgetList.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: commonText14Black(chatDetail.message)));
    if (chatDetail.messageType == "3") {
      if (rightLeft == "right") {
        widgetList.add(commonText14Black("You sent a request"));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "View request", onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AppointmentRequestView(friendUserDocId,
                  friendUserName, chatDetail.referDocId ,"",null,"2");
            }),
          );
        }));
      } else {
        widgetList.add(commonText14Gray("Friend sent a request"));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "View request",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return AppointmentRequestView(friendUserDocId,
                      friendUserName,chatDetail.referDocId,"",null,"2" );
                }),
              );
            }));
      }
    }

    return Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: commonBalloon(
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widgetList),
            rightLeft));
  }

  Widget textInputWidget(WidgetRef ref, BuildContext context, String friendName,
      Image? friendPhoto) {
    var _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: commonTextBoxGrayForChat(
              onChanged: (String value) {
                message = value;
              },
              controller: _controller,
              multiLine: true),
        )),
        commonButtonGraySmallerIcon(
            icon: MyFlutterApp.send,
            onPressed: () async {

              if(message!=""){
                String tmpMessage=message;
                message="";
                _controller.clear();

                await insertChatDetailsDataMessage(
                  ref: ref,
                  chatHeaderDocId: chatHeaderDocId,
                  friendUserDocId: friendUserDocId,
                  message: tmpMessage,
                  programId: "chatPageUI",
                );
              }


            }),
        // speedDialButton(
        //     ref, context, friendUserDocId, friendName, friendPhoto)
      ]),
    );
  }

  Widget buildMessageList(
      String userDocId, String friendUserDocId, String chatHeaderDocId,WidgetRef ref) {
    var isarInstance = Isar.getInstance();
    Query<ChatDetail>? chatDetailDataQuery = isarInstance?.chatDetails
        .filter()
        .chatHeaderDocIdEqualTo(chatHeaderDocId)
        .sortBySendTimeDesc()
        .build();

    return StreamBuilder<List<ChatDetail>>(
      stream: chatDetailDataQuery?.watch(initialReturn: true),
      builder: (context, AsyncSnapshot<List<ChatDetail>> chatDetailsList) {
        if (!chatDetailsList.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (chatDetailsList.hasError) {
          return const Text('Something went wrong');
        }
        return ListView(
          reverse: true,
          // controller: _scrollController,
          children: chatDetailsList.data!.map((ChatDetail chatDetail) {
            if (chatDetail.senderUserDocId == userDocId) {
              return balloon(chatDetail, "right", context,ref);
            } else {
              return balloon(chatDetail, "left", context,ref);
            }
          }).toList(),
        );
      },
    );
  }
}
