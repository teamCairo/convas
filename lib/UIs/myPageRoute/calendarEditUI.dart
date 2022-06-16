import 'package:convas/common/commonValues.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../entityIsar/eventEntityIsar.dart';
import 'calendarEditLogic.dart';

class CalendarEdit extends ConsumerWidget {
  const CalendarEdit(
      this.argumentFriendUserDocId, {
  Key? key,
  }) : super(key: key);
  final String? argumentFriendUserDocId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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

        String helpText="";
        if(ref.watch(userDataProvider).userData["userType"]=="1"){
          helpText ="You can set available time then teachers find you";
        }else{
          helpText ="You can set available time then learners find you";
        }
        return Scaffold(
            appBar:commonAppbar("Calendar",helpTitle:"Tap the calendar",helpText: helpText,contextForHelp: context),
            body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SfCalendar(
                        selectionDecoration:const BoxDecoration(
                          border:null
                        ) ,
                          todayHighlightColor:commonColorSecondary,
                          view: CalendarView.week,
                          // showNavigationArrow: true,
                          monthViewSettings: const MonthViewSettings(showAgenda: true),
                          dataSource: EventDataSource(commonGetAppointmentListFromEventList(eventsList.data!,{})),
                          onTap: (calendarDetails) async{
                            await selectCalendarTime(calendarDetails,
                                ref, context);
                          }),
                    ),
                  ],
                )));

      },
    );

  }

}
