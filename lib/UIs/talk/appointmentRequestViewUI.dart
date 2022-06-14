import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../common/provider/masterProvider.dart';
import '../call/callRoomRootUI.dart';
import 'appointmentRequestProvider.dart';

class AppointmentRequestView extends ConsumerWidget {
  AppointmentRequestView(
    this.argumentFriendUserDocId,
    this.argumentFriendUserName,
    this.requestDocId,
    this.appointmentDocId,
    this.calendarDetails,
    this.mode,
  ) : super();
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;
  final String requestDocId;
  final String appointmentDocId;
  final CalendarTapDetails? calendarDetails;
  final String mode;
  bool initialProcessFlg = true;

  // mode:
  //  1:request create
  //  2:request see and appointment create
  //  3:appointment see
  //  4:result see

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(appointRequestProvider.notifier).clear();
      ref.read(appointRequestProvider.notifier).initialize(
          mode, appointmentDocId, requestDocId, argumentFriendUserDocId,calendarDetails);
    }
    return commonScaffoldScroll(context, ref, MainAxisAlignment.start, [
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          commonCircleAvatarImage(
              radius: 45,
              image: ref.watch(appointRequestProvider).friendPhoto,
              name: argumentFriendUserName),
          commonText24BlackBoldLeft(argumentFriendUserName)
        ],
      ),
      const SizedBox(height:20),

      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),
          ref.watch(appointRequestProvider).from==null?Container():listRow(
              Icons.access_time_outlined,
              Column(
                children: [
                  dateTimeRow(ref, context,
                      ref.watch(appointRequestProvider).from!,
                          (DateTime dateTime) {
                        ref
                            .read(appointRequestProvider.notifier)
                            .setFrom(dateTime);
                      }),
                  commonVerticalGap(),
                  dateTimeRow(ref, context,
                      ref.watch(appointRequestProvider).to!,
                          (DateTime dateTime) {
                        ref
                            .read(appointRequestProvider.notifier)
                            .setTo(dateTime);
                      }),
                ],
              )),
        ],
      ),
      showRequestMessageArea( mode,  ref,  context),
      commonLineHorizontalGrayThin(16, 16),
      requestMessageArea( mode,  ref,  context),
      commonVerticalGap(),
      footerButtonArea(mode, ref, context)
    ],
        appBar:commonAppbar("Lesson request" ,helpTitle:"Send your request message",helpText: "You can adjust time and type your greeting and request message to your teacher",contextForHelp: context));
  }



  Widget showRequestMessageArea(String mode, WidgetRef ref, BuildContext context) {
    if (mode == "1") {
      return Container();
    } else {
      return Column(
        children:[
          commonLineHorizontalGrayThin(16, 16),
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
        ]
      );
    }
  }

  Widget requestMessageArea(String mode, WidgetRef ref, BuildContext context) {
    if(mode=="1"){
      return commonTextBoxBordered(
        text: "Request message",
        initialValue: ref.watch(appointRequestProvider).message,
        onChanged: (String value) {
          ref.read(appointRequestProvider.notifier).setMessage(value);
        },
        maxLines: 20,
        minLines: 7,
      );

  }else if(mode =="2"){
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
      return Column(
          children:[
            Row(
              children: [
                commonHorizontalGap(),
                commonText16BlackLeft("Message to leaner"),
              ],
            ),
            commonVerticalGap(),
            Row(
              children: [
                commonHorizontalGap(),
                Flexible(
                  child: Text(
                    ref.watch(appointRequestProvider).message,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ]
      );
    }
  }

  Widget footerButtonArea(String mode, WidgetRef ref, BuildContext context) {
    if(mode =="1"){
      return commonButtonSecondaryColorRound(
          text: "Send Request",
          onPressed: () async {
        await ref
            .read(appointRequestProvider.notifier)
            .sendRequest(argumentFriendUserDocId, ref);
        await commonShowOkInfoDialog(context, "Please wait for a while","Request has been sent!!\nTeacher will respond!!");
        Navigator.of(context).pop();
      },);
    }else if (mode == "2") {
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
    } else if(mode =="3") {
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
                commonNavigatorPushSlideHorizon(context, CallRoomRoot(appointmentId: ref.watch(appointRequestProvider).appointmentDocId, argumentFriendUserDocId: argumentFriendUserDocId));

              },
              width:commonWidthHalfButton(context)),
        ],
      );
    }else{
      return Container();
    }
  }
}

Widget listRow(IconData iconData, Widget child, {Color? color}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 65,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(iconData, color: color ?? Colors.black87),
            ],
          ),
        ),
        child
      ]);
}

Widget dateTimeRow(WidgetRef ref, BuildContext context, DateTime dateTime,
    Function(DateTime dateTime) setDateFunction) {
  return Row(children: [
    GestureDetector(
        child: commonText16BlackLeft(
          fromDateToYearMonthDayText(dateTime),
        ),
        onTap: () async {
          final DateTime? d = await showDatePicker(
            context: context,
            initialDate: dateTime,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 31)),
          );
          if (d != null) {
            setDateFunction(DateTime(d.year,d.month,d.day,dateTime.hour,dateTime.minute));
          }
        }),
    const SizedBox(width: 60),
    GestureDetector(
        child: commonText16BlackLeft(
          fromDateToHourMinuteText(dateTime),
        ),
        onTap: () async {
          final TimeOfDay? t = await showTimePicker(
            context: context,
            initialTime:
            TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
          );
          if (t != null) {
            setDateFunction(DateTime(
                dateTime.year, dateTime.month, dateTime.day, t.hour, t.minute));
          }
        }),
  ]);
}


