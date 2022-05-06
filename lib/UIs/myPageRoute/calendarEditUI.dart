import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../entityIsar/eventEntityIsar.dart';
import 'calendarEditLogic.dart';

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


        return Scaffold(
            body: SafeArea(
                child: Column(
                  children: [
                    commonAppbar("Calendar",leadingWidget:commonIconButtonQuestion(onTap:(){
                      commonShowOkInfoDialog(context, "Tap the calendar","You can set available time then learners find you");
                    }) ),
                    Expanded(
                      child: SfCalendar(
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
