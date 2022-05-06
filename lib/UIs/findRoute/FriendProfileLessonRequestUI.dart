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
        appBar: commonAppbar("Lesson request"),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    commonCircleAvatarImage(
                        radius: 70,
                        image: ref
                            .watch(friendProfileDataProvider)
                            .friendProfilePhotoData,
                        name:argumentFriendUserName),
                    commonText24BlackBoldLeft(argumentFriendUserName)
                  ],
                ),
              ),
              requestDateTimeRow(ref, context, "from"),
              requestDateTimeRow(ref, context, "to"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child:commonText24BlackBoldLeft("Message"),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical:30,horizontal:24.0),
                child:TextFormField(
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
                  initialValue:ref.watch(lessonRequestProvider).message,
                  onChanged: (String value) {
                    ref.read(lessonRequestProvider.notifier).setMessage(value);
                  },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: commonButtonOrangeRound(
                    text: "Send Request",
                    onPressed: () async {
                      await ref
                          .read(lessonRequestProvider.notifier)
                          .sendRequest(argumentFriendUserDocId, ref);
                      await commonShowOkInfoDialog(context, "XXXX","Request has been sent!!");
                      Navigator.of(context).pop();
                    }),
              ),
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
            if (d != null) {
              if (fromTo == "from") {
                ref.read(lessonRequestProvider.notifier).setSelectedDateTimeFrom(
                    DateTime(d.year, d.month, d.day, dateTime.hour,
                        dateTime.minute));
              } else {
                ref.read(lessonRequestProvider.notifier).setSelectedDateTimeTo(
                    DateTime(d.year, d.month, d.day, dateTime.hour,
                        dateTime.minute));
              }
            }
          }),
      GestureDetector(
          child: commonText16GrayLeft(
            fromDateToHourMinuteText(dateTime),
          ),
          onTap: () async {
            final TimeOfDay? t = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
            );

            if (t != null) {
              if (fromTo == "from") {
                ref.read(lessonRequestProvider.notifier).setSelectedDateTimeFrom(
                            DateTime(dateTime.year, dateTime.month, dateTime.day,
                                t.hour, t.minute));
              } else {
                ref.read(lessonRequestProvider.notifier).setSelectedDateTimeTo(
                            DateTime(dateTime.year, dateTime.month, dateTime.day,
                                t.hour, t.minute));
              }
            }
          }),
    ]),
  );
}
