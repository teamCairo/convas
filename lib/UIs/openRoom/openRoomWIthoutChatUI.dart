import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget openRoomWithoutChatUI(WidgetRef ref,BuildContext context){

  return Column(
    children: [
      SizedBox(height:500,child: renderVideoAreaWithoutChat(ref)) ,
      // buttonsForVideoCall(ref,context,appointmentDocId),
    ],
  );
}

Widget renderVideoAreaWithoutChat(WidgetRef ref) {

  return
    Stack(
      children: [
        // Align(alignment: Alignment.topLeft, child: friendView(ref,appointmentId,500,null)),
        // Align(
        //     alignment: Alignment.bottomRight,
        //     child: localView(150,120)
        // ),
      ],
      // ),
    );
}