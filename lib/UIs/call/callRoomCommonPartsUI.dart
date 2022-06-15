import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import '../../common/UI/commonButtonUI.dart';
import '../../daoFirebase/appointmentsDaoFirebase.dart';
import 'callRoomProvider.dart';

Widget localView(double height, double? width) {
  return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: RtcLocalView.SurfaceView());
}

Widget friendView(
    WidgetRef ref, String appointmentDocId, double height, double? width) {
  if (ref.watch(callRoomProvider).friendUserid == null) {
    return Container(
        height: height, width: width ?? double.infinity, color: Colors.black);
  } else {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: RtcRemoteView.SurfaceView(
        channelId: appointmentDocId,
        uid: ref.watch(callRoomProvider).friendUserid!,
      ),
    );
  }
}

Widget buttonsForVideoCall(
    WidgetRef ref, BuildContext context, String appointmentDocId) {
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
          icon: Icons.call_end,
          color: Colors.white,
          showBorder: false,
          onPressed: () async{
            bool checkBool = await checkDoneCall(ref, context);

            if (checkBool)  {
              commonShowOkNgInfoDialog(context,
                  "You wanna finish your lesson?\nYou can't rejoin this lesson",
                  () {
                Navigator.pop(context);
                ref
                    .read(callRoomProvider.notifier)
                    .leaveChannel(ref, appointmentDocId);
              });
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
            ref.read(callRoomProvider.notifier).changeVideoMuteMode();
          },
          backcolor: Colors.white,
          size: 20),
      commonButtonIconCircle(
          icon: Icons.switch_video,
          color: Colors.black,
          onPressed: () {
            ref.read(callRoomProvider.notifier).changeSwitchCamera();
          },
          backcolor: Colors.white,
          size: 20),
      commonButtonIconCircle(
          icon: ref.watch(callRoomProvider).screenMode == 2
              ? Icons.fullscreen_outlined
              : Icons.fullscreen_exit,
          color: Colors.black,
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            ref.read(callRoomProvider.notifier).changeScreenMode();
          },
          backcolor: Colors.white,
          size: 20),
    ],
  );
}

Future<bool> checkDoneCall(WidgetRef ref, BuildContext context) async{

  ref.read(callRoomProvider.notifier).refleshAppointmentData();

  if (ref
      .watch(callRoomProvider)
      .appointmentData
      .fromTime
      .isAfter(DateTime.now())) {
    commonShowOkWarningDialog(context, "It's too early to finish the lesson");
    return false;
  };

  if(ref
      .watch(callRoomProvider)
      .appointmentData.status=="2"){
    commonShowOkWarningDialog(context, "Your opponent hasn't been here");
    return false;
  }

  return true;
}
