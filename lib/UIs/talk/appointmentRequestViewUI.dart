import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextUI.dart';
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

    return Scaffold(
        appBar:
            commonAppbar(mode == "1" ? "Lesson request" : "Lesson appointment"),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      commonCircleAvatarImage(
                          radius: 45,
                          image: argumentFriendPhoto,
                          name: argumentFriendUserName),
                      commonText24BlackBoldLeft(argumentFriendUserName)
                    ],
                  ),
                ),
                commonText16GrayCenter(
                    ref.watch(appointRequestProvider).getStringFrom()),
                commonText16GrayCenter(
                    ref.watch(appointRequestProvider).getStringTo()),
                commonText16GrayLeft(getMasterData("requestStatus",
                        ref.watch(appointRequestProvider).status, ref)
                    .name),
                commonText24BlackBoldLeft("Request message"),
                commonText16GrayLeft(
                    ref.watch(appointRequestProvider).requestMessage),
                commonText24BlackBoldLeft("Message"),
                TextFormField(
                  maxLines: null,
                  minLines: 7,
                  // テキスト入力のラベルを設定
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  initialValue: ref.watch(appointRequestProvider).message,
                  onChanged: (String value) {
                    ref.read(appointRequestProvider.notifier).setMessage(value);
                  },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                footerButtonArea(mode, ref, context)
              ],
              // ),
            ),
          ),
        )));
  }

  Widget footerButtonArea(String mode, WidgetRef ref, BuildContext context) {

    double widthHalfButton = (MediaQuery.of(context).size.width-56)/2;

    if (mode == "1") {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: commonButtonRoundWhiteSmall(
              width:widthHalfButton,
              text: "Deny",
              onPressed: () async {
                await ref
                    .read(appointRequestProvider.notifier)
                    .denyLessonRequest(ref);
                await commonShowOkInfoDialog(
                    context, "You denied this request");
                Navigator.of(context).pop();
              },
            ),
          ),
          commonButtonRoundOrangeSmall(
              text: "Accept",
              onPressed: () async {
                await ref
                    .read(appointRequestProvider.notifier)
                    .acceptLessonRequest(ref);
                await commonShowOkInfoDialog(
                    context, "You accepted this request");
                Navigator.of(context).pop();
              },
              width:widthHalfButton),
        ],
      );
    } else {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: commonButtonRoundWhiteSmall(
              width:widthHalfButton,
              text: "Cancel lesson",
              onPressed: () async {
                commonShowOkNgInfoDialog(
                    context, "Are you sure you wanna cancel lesson?", () {

                  Navigator.of(context).pop();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: commonButtonRoundOrangeSmall(
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
            width:widthHalfButton),
          ),
        ],
      );
    }
  }
}
