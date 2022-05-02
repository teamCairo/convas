import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicDate.dart';
import 'friendProfileProvider.dart';
import 'lessonRequestProvider.dart';

class FriendProfileLessonRequest extends ConsumerWidget {
  FriendProfileLessonRequest({
    required this.argumentFriendUserDocId,
    required this.argumentFriendUserName,
    required this.calendarDetails,
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;
  final CalendarTapDetails calendarDetails;
  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref
          .read(lessonRequestProvider.notifier)
          .initialize(calendarDetails.date!);
    }
    return Scaffold(
        appBar: commonAppbarWhite("Lesson request"),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  commonCircleAvatarImage(
                      radius: 70,
                      image: ref
                          .watch(friendProfileDataProvider)
                          .friendProfilePhotoData,
                      name:ref.watch(friendProfileDataProvider).friendProfileData["name"]),
                  commonText24BlackBoldLeft(ref.watch(friendProfileDataProvider).friendProfileData["name"])
                ],
              ),
              requestDateTimeRow(ref, context, "from"),
              requestDateTimeRow(ref, context, "to"),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: commonButtonOrangeRound(
                    text: "Send Request",
                    onPressed: () async {
                      await ref
                          .read(lessonRequestProvider.notifier)
                          .sendRequest(argumentFriendUserDocId, ref);
                    }),
              ),
              commonText24BlackBoldLeft("Message")
            ],
            // ),
          ),
        )));
  }
}

Widget requestDateTimeRow(WidgetRef ref, BuildContext context, String fromTo) {
  DateTime dateTime = (fromTo == "from"
      ? ref.watch(lessonRequestProvider).selectedDateTimeFrom!
      : ref.watch(lessonRequestProvider).selectedDateTimeTo!);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
          child: commonText16GrayLeft(
            fromDateToYearMonthDayText(dateTime),
          ),
          onTap: () async {
            // log("XXXXXXXタップした　日付");
            final DateTime? d = await showDatePicker(
              context: context,
              initialDate: dateTime,
              firstDate: DateTime(
                  dateTime.add(const Duration(days: -30)).year,
                  dateTime.add(const Duration(days: -30)).month,
                  dateTime.add(const Duration(days: -30)).day),
              lastDate: DateTime(
                  dateTime.add(const Duration(days: 30)).year,
                  dateTime.add(const Duration(days: 30)).month,
                  dateTime.add(const Duration(days: 30)).day),
            );
            // if (d != null) {
            // setState(() {
            //   if (fromTo == "from") {
            //     ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeFrom(
            //         DateTime(d.year, d.month, d.day, dateTime.hour,
            //             dateTime.minute));
            //   } else {
            //     ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeTo(
            //         DateTime(d.year, d.month, d.day, dateTime.hour,
            //             dateTime.minute));
            //   }
            // });
            // }
          }),
      GestureDetector(
          child: commonText16GrayLeft(
            fromDateToHourMinuteText(dateTime),
          ),
          onTap: () async {
            // log("XXXXXXXタップした　時間");
            final TimeOfDay? t = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
            );
            // if (t != null) {
            // setState(() {
            //   if (fromTo == "from") {
            //     log("XXXXXXXFrom時間修正");
            //     ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeFrom(
            //         DateTime(dateTime.year, dateTime.month, dateTime.day,
            //             t.hour, t.minute));
            //   } else {
            //     ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeTo(
            //         DateTime(dateTime.year, dateTime.month, dateTime.day,
            //             t.hour, t.minute));
            //   }
            // });
            // }
          }),
    ]),
  );
}
