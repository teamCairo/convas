import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/logic/commonLogicDate.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../common/provider/masterProvider.dart';
import 'calendarEditLogic.dart';
import 'calendarEditProvider.dart';
import 'calendarEditSelectAvailableTypeDialogUI.dart';

class CalendarEditDetail extends ConsumerWidget {
  CalendarEditDetail({
    required this.calendarDetails,
    Key? key,
  }) : super(key: key);
  CalendarTapDetails calendarDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonScaffold(
        context,
        ref,
        MainAxisAlignment.spaceBetween,
        [
          Column(
            children: [
              const SizedBox(height: 10),
              listRow(
                  Icons.access_time_outlined,
                  Column(
                    children: [
                      dateTimeRow(ref, context,
                          ref.watch(calendarEditProvider).editedDateTimeFrom!,
                          (DateTime dateTime) {
                        ref
                            .read(calendarEditProvider.notifier)
                            .setEditedDateTimeFrom(dateTime);
                      }),
                      commonVerticalGap(),
                      dateTimeRow(ref, context,
                          ref.watch(calendarEditProvider).editedDateTimeTo!,
                          (DateTime dateTime) {
                        ref
                            .read(calendarEditProvider.notifier)
                            .setEditedDateTimeTo(dateTime);
                      }),
                    ],
                  )),
              commonLineHorizontalGrayThin(16, 16),
              listRow(
                  Icons.circle,
                  GestureDetector(
                      child: commonText16BlackLeft(getMasterData(
                              "eventType",
                              ref.watch(calendarEditProvider).editedEventType,
                              ref)
                          .name),
                      onTap: () {
                        commonShowClassDialog(context,
                            const CalendarEditSelectAvailableTypeDialog());
                      }),
                  color: commonGetAvailabilityColor(
                      ref.watch(calendarEditProvider).editedEventType)),
              commonLineHorizontalGrayThin(16, 16),
              listRow(
                Icons.repeat,
                GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText16BlackLeft("Weekly repeats on"),
                        commonVerticalGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          daysOfWeekButton("sunday", "S", ref),
                          daysOfWeekButton("monday", "M", ref),
                          daysOfWeekButton("tuesday", "T", ref),
                          daysOfWeekButton("wednesday", "W", ref),
                          daysOfWeekButton("thursday", "T", ref),
                          daysOfWeekButton("friday", "F", ref),
                          daysOfWeekButton("saturday", "S", ref),
                        ])
                      ],
                    ),
                    onTap: () async {}),
              ),
            ],
          ),
          Column(
            children: [
              Row(children: [
                const SizedBox(width: 20),
                commonButtonWhiteBorderRound(
                    width: commonWidthHalfButton(context),
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                      ;
                    }),
                commonHorizontalGap(),
                commonButtonOrangeRound(
                    width: commonWidthHalfButton(context),
                    text: "OK",
                    onPressed: () async {
                      bool checkBool = await checkEventData(context, ref);
                      if (checkBool) {
                        if (ref.watch(calendarEditProvider).editMode ==
                            "insert") {
                          await ref
                              .read(calendarEditProvider.notifier)
                              .insertEditedEvent(ref);
                        } else {
                          await ref
                              .read(calendarEditProvider.notifier)
                              .updateEditedEvent(ref);
                        }
                        Navigator.of(context).pop();
                      }
                    }),
                const SizedBox(width: 20),
              ]),
              commonVerticalGap()
            ],
          )
        ],
        withoutPadding: true,
        appBar: commonAppbar("Set available time"));
  }
}

Widget daysOfWeekButton(String dayName, String dayDisplay, WidgetRef ref) {
  bool repeatOnOff = ref.watch(calendarEditProvider).getRepeats(dayName);
  Color bkColor = Colors.black;
  Color stringColor = Colors.black;
  if (repeatOnOff) {
    bkColor = Colors.orange;
    stringColor = Colors.white;
  } else {
    bkColor = Colors.white;
    stringColor = Colors.black87;
  }
  return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            ref
                .read(calendarEditProvider.notifier)
                .setRepeats(!repeatOnOff, dayName);
          },
          child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: bkColor,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    dayDisplay,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: stringColor,
                    ),
                  ))),
        ),
        const SizedBox(width:6)
      ]);
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