import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import '../../common/UI/commonButtonUI.dart';
import 'callRoomProvider.dart';

Widget localView(double height,double? width){
  return SizedBox(
      width: width??double.infinity, height: height, child: RtcLocalView.SurfaceView());
}

Widget friendView(WidgetRef ref,String appointmentId,double height,double? width){
  if (ref.watch(callRoomProvider).friendUserid == null) {
    return Container(height: height,
        width: width??double.infinity,
        color:Colors.black);
  } else {
    return  SizedBox(
      height: height,
      width: width??double.infinity,
      child: RtcRemoteView.SurfaceView(
        channelId: appointmentId,
        uid: ref.watch(callRoomProvider).friendUserid!,
      ),
    );
  }
}

Widget buttonsForVideoCall(WidgetRef ref,BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      commonButtonIconCircle(
          icon: ref.watch(callRoomProvider).localAvStatus
              ? Icons.mic
              : Icons.mic_off,
          color: Colors.black,
          onPressed: () {
            ref.read(callRoomProvider.notifier).changeAvMuteMode();
          },
          backcolor: Colors.white,
          size: 20),
      commonButtonIconCircle(
          icon: ref.watch(callRoomProvider).isJoinedCall?Icons.call_end:Icons.arrow_forward_outlined,
          color: Colors.white,
          showBorder: false,
          onPressed: () {
            if (ref.watch(callRoomProvider).isJoinedCall) {
              ref.read(callRoomProvider.notifier).leaveChannel(ref);
              // Navigator.of(context).pop();
            } else {
              ref.read(callRoomProvider.notifier).joinCallChannel();
            }
          },
          backcolor: Colors.red,
          size: 20),
      commonButtonIconCircle(
          icon: ref.watch(callRoomProvider).localVideoStatus
              ? Icons.videocam
              : Icons.videocam_off,
          color: Colors.black,
          onPressed: () {
            ref
                .read(callRoomProvider.notifier)
                .changeVideoMuteMode();
          },
          backcolor: Colors.white,
          size: 20),
      commonButtonIconCircle(
          icon:  Icons.switch_video,
          color: Colors.black,
          onPressed: () {
            ref.read(callRoomProvider.notifier)
                .changeSwitchCamera();
          },
          backcolor: Colors.white,
          size: 20),
      commonButtonIconCircle(
          icon:  Icons.fit_screen,
          color: Colors.black,
          onPressed: () {
            ref.read(callRoomProvider.notifier).changeScreenMode();
          },
          backcolor: Colors.white,
          size: 20),
    ],
  );
}