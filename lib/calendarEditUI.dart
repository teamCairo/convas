import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendarEditDeleteDialogUI.dart';
import 'calendarEditLogic.dart';
import 'calendarEditProvider.dart';
import 'calendarEditSelectModeDialogUI.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/UI/commonUITextForm.dart';
import 'common/logic/commonLogic.dart';
import 'common/provider/eventProvider.dart';

class CalendarEdit extends ConsumerStatefulWidget  {
  const CalendarEdit({
    Key? key,
  }) : super(key: key);

  @override
  CalendarEditState createState() => CalendarEditState();
}

class CalendarEditState extends ConsumerState<CalendarEdit> {

  @override
  void initState() {
    super.initState();

    //必要に応じ初期処理追加
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: SfCalendar(
                view: CalendarView.week,
                monthViewSettings: const MonthViewSettings(showAgenda: true),
                dataSource: EventDataSource(
                    ref.watch(eventDataProvider).eventList),
                onTap: (calendarDetails) async{
                  if(calendarDetails.appointments==null){

                    ref.read(calendarEditProvider.notifier).setEditMode("insert");
                    ref.read(calendarEditProvider.notifier).initializeEditedEvent(calendarDetails.date!);
                    _fabPressed(context, calendarDetails,ref);

                  }else{

                    ref.read(calendarEditProvider.notifier).setEditMode("cancel");

                    await showDialog<void>(
                      context: context,
                      builder: (_) {
                        return CalendarEditSelectModeDialog(details: calendarDetails);
                      },
                    );

                    if(ref.watch(calendarEditProvider).editMode=="delete"){

                      await showDialog<void>(
                        context: context,
                        builder: (_) {
                          return CalendarEditDeleteDialog(details: calendarDetails);
                        },
                      );

                    }else if(ref.watch(calendarEditProvider).editMode=="update"){

                      ref.read(calendarEditProvider.notifier).setEditedEventInfo(calendarDetails.appointments![0]);
                      _fabPressed(context, calendarDetails,ref);

                    }else if(ref.watch(calendarEditProvider).editMode=="insert"){
                      ref.read(calendarEditProvider.notifier).initializeEditedEvent(calendarDetails.date!);
                      _fabPressed(context, calendarDetails,ref);
                    }

                  }
                })));
  }

  void _fabPressed(BuildContext context, CalendarTapDetails calendarDetails,WidgetRef ref) {

    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  closeButtonForModal(context),
                  borderedTextBox(
                    text: "title",
                    initialValue: ref.watch(calendarEditProvider).editedEventName ,
                    onChanged: (String value) {
                      ref.read(calendarEditProvider.notifier).setEditedEventName(value);
                    },
                    passwordSecure: false,
                  ),
                  dateTimeRow(ref,context,"from",setState),
                  dateTimeRow(ref,context,"to",setState),
                  Padding(
                    padding: const EdgeInsets.only(bottom:14.0),
                    child: orangeRoundButton(text: ref.watch(calendarEditProvider).editMode=="insert"?"Create Event":"Update Event",
                        onPressed: ()async {

                      if(ref.watch(calendarEditProvider).editMode=="insert"){
                        await ref.read(calendarEditProvider.notifier).insertEditedEvent(ref);

                      }else{
                        await ref.read(calendarEditProvider.notifier).updateEditedEvent(ref);

                      }
                          Navigator.of(context).pop();
                        }),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}


Widget dateTimeRow(WidgetRef ref,BuildContext context,String fromTo,StateSetter setState){

  log("XXXXXXX構築");
  DateTime dateTime =(fromTo=="from"?ref.watch(calendarEditProvider).editedDateTimeFrom:ref.watch(calendarEditProvider).editedDateTimeTo);
  return    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical:8),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
          child: gray20TextRight(fromDateToYearMonthDayText(dateTime),
          ),
          onTap: () async{
            log("XXXXXXXタップした　日付");
            final DateTime? d = await showDatePicker(
              context: context,
              initialDate: dateTime,
              firstDate: DateTime(dateTime.add(const Duration(days:-30)).year,dateTime.add(const Duration(days:-30)).month,dateTime.add(const Duration(days:-30)).day),
              lastDate: DateTime(dateTime.add(const Duration(days:30)).year,dateTime.add(const Duration(days:30)).month,dateTime.add(const Duration(days:30)).day),
            );
            if (d != null) {
              setState(() {
                if(fromTo=="from"){
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeFrom(DateTime(d.year,d.month,d.day,dateTime.hour,dateTime.minute));
                }else{

                  ref.read(calendarEditProvider.notifier).setEditedDateTimeTo(DateTime(d.year,d.month,d.day,dateTime.hour,dateTime.minute));
                }
              });
            }


          }
      ),
      GestureDetector(
          child: gray20TextRight( fromDateToHourMinuteText(dateTime),
          ),
          onTap: () async{
            log("XXXXXXXタップした　時間");
            final TimeOfDay? t = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute ),
            );
            if (t != null) {
              setState(() {
                if(fromTo=="from"){
                  log("XXXXXXXFrom時間修正");
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeFrom(DateTime(dateTime.year,dateTime.month,dateTime.day,t.hour,t.minute));
                }else{
                  ref.read(calendarEditProvider.notifier).setEditedDateTimeTo(DateTime(dateTime.year,dateTime.month,dateTime.day,t.hour,t.minute));
                }
              });
            }

          }),
    ]),
  );
}