import 'dart:developer';

import 'package:convas/UIs/myPageRoute/calendarEditSelectTypeDialogUI.dart';
import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicDate.dart';
import 'calendarEditProvider.dart';

void calendarEditBottomSheet(
    BuildContext context, CalendarTapDetails calendarDetails, WidgetRef ref) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(0)),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, StateSetter setState) {
          return
            // SizedBox(
            // height: 300,
            // child:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonButtonCloseForModal(context),
                  commonTextBoxBordered(
                    text: "title",
                    initialValue: ref.watch(calendarEditProvider).editedEventName,
                    onChanged: (String value) {
                      ref
                          .read(calendarEditProvider.notifier)
                          .setEditedEventName(value);
                    },
                    passwordSecure: false,
                  ),
                  dateTimeRow(ref, context, "from", setState),
                  dateTimeRow(ref, context, "to", setState),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 36.0, right: 36, top:20,bottom:10),
                      child: commonText16GrayLeft(getMasterData("eventType", ref.watch(calendarEditProvider).editedEventType, ref).name
                      ),
                    ),
                  onTap:()async{
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return CalendarEditSelectTypeDialog();
                      }),
                    );
                    setState(() {
                    });
                      }),
                  weekCheckList(ref, setState),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: commonButtonOrangeRound(
                        text: ref.watch(calendarEditProvider).editMode == "insert"
                            ? "Create Event"
                            : "Update Event",
                        onPressed: () async {
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

Widget checkItem(String dbItemName, String displayItemName, WidgetRef ref, StateSetter setState){
  return commonCheckBoxList (displayItemName, ref.watch(calendarEditProvider).checkMap[dbItemName]!,
          onChanged: (bool? value) {
        setState(() {
          ref.read(calendarEditProvider.notifier).setCheck(value ?? false, dbItemName);
        });
      }
  );
}

Widget weekCheckList(WidgetRef ref,StateSetter setState){
  if(ref.watch(calendarEditProvider).checkMap["repeat"]!){

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child:Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children:[
          checkItem("repeat","Weekly repeat",  ref,  setState),
          checkItem("monday", "Monday",  ref,  setState),
          checkItem("tuesday","Tuesday",  ref,  setState),
          checkItem("wednesday", "Wednesday",  ref,  setState),
          checkItem("thursday", "Thursday",  ref,  setState),
          checkItem("friday", "Friday",  ref,  setState),
          checkItem("saturday", "Saturday",  ref,  setState),
          checkItem("sunday", "Sunday",  ref,  setState),
        ]
            ));
  }else{

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: checkItem("repeat","Weekly repeat",  ref,  setState),
    );

  }
}

Widget dateTimeRow(
    WidgetRef ref, BuildContext context, String fromTo, StateSetter setState) {
  log("XXXXXXX構築");
  DateTime dateTime = (fromTo == "from"
      ? ref.watch(calendarEditProvider).editedDateTimeFrom!
      : ref.watch(calendarEditProvider).editedDateTimeTo!);
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
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeFrom(
                      DateTime(d.year, d.month, d.day, dateTime.hour,
                          dateTime.minute));
                } else {
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeTo(
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
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeFrom(
                      DateTime(dateTime.year, dateTime.month, dateTime.day,
                          t.hour, t.minute));
                } else {
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeTo(
                      DateTime(dateTime.year, dateTime.month, dateTime.day,
                          t.hour, t.minute));
                }
              });
            }
          }),
    ]),
  );
}
