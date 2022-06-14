import 'package:convas/common/commonValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/otherClass/commonRtmChatChannelMessage.dart';
import '../../common/provider/userProvider.dart';
import 'callRoomCommonPartsUI.dart';
import 'callRoomProvider.dart';

Widget callRoomWithChatUI(WidgetRef ref,String appointmentDocId,BuildContext context){

  return Column(
    children: [
      SizedBox(height:200,child: renderVideoAreaWithChat(ref,appointmentDocId)) ,
      SizedBox(height:35,child: buttonsForVideoCall(ref,context,appointmentDocId)),
      Expanded(child:chatListArea(ref)),
      SizedBox(height:65,child: chatInputArea(ref)),
    ],
  );
}

Widget renderVideoAreaWithChat(WidgetRef ref,String appointmentId) {
  return
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        friendView(ref,appointmentId,160,140),
        localView(160,140)
      ],
    );
}

Widget chatListArea(WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:14.0),
    child: ListView.builder(
      reverse: true,
      // itemExtent: 24,
      itemBuilder: (context, i) {

        if (ref.watch(callRoomProvider).channelMessageList[i].userDocId == ref.watch(userDataProvider).userData["userDocId"]) {
          return balloon(ref.watch(callRoomProvider).channelMessageList[i], "right", context,ref);
        } else {
          return balloon(ref.watch(callRoomProvider).channelMessageList[i], "left", context,ref);
        }
      },
      itemCount: ref.watch(callRoomProvider).channelMessageList.length,
    ),
  );
}

Widget chatInputArea(WidgetRef ref) {
  var _peerMessageController = TextEditingController();

  return Column(
    children: [

      Row(children: <Widget>[
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 14.0),
        child: commonTextBoxGrayForChat(
            onChanged: (String value) {
            },
            controller: _peerMessageController,
            multiLine: true),
      )),
      commonButtonIconCircle(
        size: 20,
        icon: Icons.send,
        onPressed: () async{
          await ref.read(callRoomProvider).sendMessage(_peerMessageController.text,ref);
          _peerMessageController.clear();
          ref.read(callRoomProvider).rebuildUI();
        },
        color: Colors.white,
        backcolor: commonColorPrimary,
        showBorder: false,
      )
      ]),
    ],
  );
}


Padding balloon(
    CommonRtmChatChannelMessage chatMessage, String rightLeft, BuildContext context,WidgetRef ref) {
  //rightLeft="right"or"left"

  List<Widget> widgetList = [];
  widgetList.add(Padding(
      padding: const EdgeInsets.all(16.0),
      child: commonText14Gray(chatMessage.message)));


  return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: commonBalloon(
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widgetList),
          rightLeft));
}
