import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../common/provider/masterProvider.dart';
import '../call/callRoomRootUI.dart';
import 'appointmentRequestProvider.dart';

class AppointmentRequestView extends ConsumerWidget {
  AppointmentRequestView(
    this.argumentFriendUserDocId,
    this.argumentFriendUserName,
    this.argumentFriendPhoto,
    this.requestDocId,
    this.appointmentDocId,
    this.mode,
  ) : super();
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;
  final Image? argumentFriendPhoto;
  final String requestDocId;
  final String appointmentDocId;
  final String mode;
  bool initialProcessFlg = true;

  // mode:1:create,2:update/delete/see

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(appointRequestProvider.notifier).initialize(
          mode, appointmentDocId, requestDocId, argumentFriendUserDocId);
    }
    return commonScaffoldScroll(context, ref, MainAxisAlignment.start, [
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          commonCircleAvatarImage(
              radius: 45,
              image: argumentFriendPhoto,
              name: argumentFriendUserName),
          commonText24BlackBoldLeft(argumentFriendUserName)
        ],
      ),
      const SizedBox(height:20),

      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:65,
              child: Icon(Icons.access_time_outlined, color:  commonColorSecondary)),
          Column(
            children: [
              commonText16BlackLeft(
                  ref.watch(appointRequestProvider).getStringFrom()),
              commonVerticalGap(),
              commonText16BlackLeft(
                  ref.watch(appointRequestProvider).getStringTo()),
            ],
          ),
        ],
      ),
      commonVerticalGap(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:65,
              child: Icon(Icons.send, color:  commonColorSecondary)),
          commonText16BlackLeft(getMasterData("requestStatus",
              ref.watch(appointRequestProvider).status, ref)
              .name),
        ],
      ),
      commonVerticalGap(),
      Row(
        children: [
          commonHorizontalGap(),
          commonText16BlackLeft("Request message"),
        ],
      ),
      commonVerticalGap(),
      Row(
        children: [
          commonHorizontalGap(),
          Flexible(
            child: Text(
              ref.watch(appointRequestProvider).requestMessage,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      requestArea( mode,  ref,  context),
      commonVerticalGap(),
      footerButtonArea(mode, ref, context)
    ],
        appBar:commonAppbar(mode == "1" ? "Lesson request" : "Lesson appointment",helpTitle:"Tap times and adjust to time when you like",helpText: "You can set available time then learners find you",contextForHelp: context));
  }


  Widget requestArea(String mode, WidgetRef ref, BuildContext context) {
    if(mode =="1"){
      return commonTextBoxBordered(
        text: "Message to learner",
        initialValue: ref.watch(appointRequestProvider).message,
        onChanged: (String value) {
          ref.read(appointRequestProvider.notifier).setMessage(value);
        },
        maxLines: 20,
        minLines: 7,
      );
    }else{
      return Text(
        ref.watch(appointRequestProvider).message,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black54,
        ),
      );
    }
  }

  Widget footerButtonArea(String mode, WidgetRef ref, BuildContext context) {


    if (mode == "1") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonButtonRoundWhiteSmall(
            width:commonWidthHalfButton(context),
            text: "Deny",
            onPressed: () async {
              await ref
                  .read(appointRequestProvider.notifier)
                  .denyLessonRequest(ref);
              await commonShowOkInfoDialog(
                  context, "Thank you!","You denied this request");
              Navigator.of(context).pop();
            },
          ),
          commonButtonSecondaryColorRound(
              text: "Accept",
              onPressed: () async {
                await ref
                    .read(appointRequestProvider.notifier)
                    .acceptLessonRequest(ref);
                await commonShowOkInfoDialog(
                    context,"Thank you!", "You accepted this request");
                Navigator.of(context).pop();
              },
              width:commonWidthHalfButton(context)),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonButtonRoundWhiteSmall(
            width:commonWidthHalfButton(context),
            text: "Cancel lesson",
            onPressed: () async {
              commonShowOkNgInfoDialog(
                  context, "Are you sure you wanna cancel lesson?", () {

                Navigator.of(context).pop();
              });
            },
          ),
          commonButtonSecondaryColorRound(
              text: "Enter room",
              onPressed: () async {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return CallRoomRoot(appointmentId: ref.watch(appointRequestProvider).appointmentDocId, argumentFriendUserDocId: argumentFriendUserDocId);
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                    },
                  ),
                );

              },
              width:commonWidthHalfButton(context)),
        ],
      );
    }
  }
}



