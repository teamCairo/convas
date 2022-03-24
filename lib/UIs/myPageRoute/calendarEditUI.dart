import 'dart:developer';

import 'package:convas/UIs/login/loginProvider.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/commonValues.dart';
import '../../common/otherClass/calendar/commonClassCalendarEvent.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../entityIsar/eventEntityIsar.dart';
import 'calendarEditLogic.dart';
import 'calendarEditProvider.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicDate.dart';

class CalendarEdit extends ConsumerStatefulWidget  {
  const CalendarEdit(this.argumentFriendUserDocId, {
    Key? key,
    //argumentFriendUserDocIdがNULLかどうかでモードを判断
  }) : super(key: key);
  final String? argumentFriendUserDocId;

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

    var isarInstance = Isar.getInstance();
    Query<Event>? eventDataQuery = isarInstance?.events
        .filter()
        .deleteFlgEqualTo(false)
        .build();

    return StreamBuilder<List<Event>>(
      stream: eventDataQuery?.watch(initialReturn: true),
      builder: (context, AsyncSnapshot<List<Event>> eventsList) {
        if (!eventsList.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (eventsList.hasError) {
          return const Text('Something went wrong');
        }

        List<CalendarEvent> calendarEventList=[];
        for(int i=0;i<eventsList.data!.length;i++){
          calendarEventList.add(
              CalendarEvent(eventsList.data![i].eventDocId,
                  eventsList.data![i].userDocId,
                  ref.watch(userDataProvider).userData["name"],
                  eventsList.data![i].eventName,
                  eventsList.data![i].eventType,
                  eventsList.data![i].friendUserDocId,
                  eventsList.data![i].callChannelId,
                  eventsList.data![i].fromTime,
                  eventsList.data![i].toTime,
                  eventsList.data![i].isAllDay,
                  calendarColorForMe
              )

          );
        }

        return Scaffold(
            body: SafeArea(
                child: SfCalendar(
                    view: CalendarView.week,
                    monthViewSettings: const MonthViewSettings(showAgenda: true),
                    dataSource: EventDataSource(calendarEventList),
                    onTap: (calendarDetails) async{
                      await selectCalendarTime(calendarDetails,
                          ref, context);
                    })));

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
          child: commonText20BlackRight(fromDateToYearMonthDayText(dateTime),
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
          child: commonText20BlackRight( fromDateToHourMinuteText(dateTime),
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