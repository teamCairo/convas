import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicDate.dart';
import 'friendProfileCalendarDetailBottomSheetProvider.dart';

void friendProfileCalendarDetailBottomSheet(
    BuildContext context, CalendarTapDetails calendarDetails, WidgetRef ref, String friendUserDocId) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(0)),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, StateSetter setState) {
          return
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonButtonCloseForModal(context),
                  dateTimeRow(ref, context, "from", setState),
                  dateTimeRow(ref, context, "to", setState),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: commonButtonOrangeRound(
                        text: "Send Request",
                        onPressed: () async {
                          await ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).sendRequest(friendUserDocId,ref);
                        }),
                  )
                ],
                // ),
              ),
            );
        },
      );
    },
  );
}

Widget dateTimeRow(
    WidgetRef ref, BuildContext context, String fromTo, StateSetter setState) {

  DateTime dateTime = (fromTo == "from"
      ? ref.watch(friendProfileCalendarDetailBottomSheetProvider).selectedDateTimeFrom!
      : ref.watch(friendProfileCalendarDetailBottomSheetProvider).selectedDateTimeTo!);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
          child: commonText16GrayLeft(
            fromDateToYearMonthDayText(dateTime),
          ),
          onTap: () async {
            log("XXXXXXXタップした　日付");
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
              setState(() {
                if (fromTo == "from") {
                  ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeFrom(
                      DateTime(d.year, d.month, d.day, dateTime.hour,
                          dateTime.minute));
                } else {
                  ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeTo(
                      DateTime(d.year, d.month, d.day, dateTime.hour,
                          dateTime.minute));
                }
              });
            }
          }),
      GestureDetector(
          child: commonText16GrayLeft(
            fromDateToHourMinuteText(dateTime),
          ),
          onTap: () async {
            log("XXXXXXXタップした　時間");
            final TimeOfDay? t = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
            );
            if (t != null) {
              setState(() {
                if (fromTo == "from") {
                  log("XXXXXXXFrom時間修正");
                  ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeFrom(
                      DateTime(dateTime.year, dateTime.month, dateTime.day,
                          t.hour, t.minute));
                } else {
                  ref.read(friendProfileCalendarDetailBottomSheetProvider.notifier).setSelectedDateTimeTo(
                      DateTime(dateTime.year, dateTime.month, dateTime.day,
                          t.hour, t.minute));
                }
              });
            }
          }),
    ]),
  );
}
