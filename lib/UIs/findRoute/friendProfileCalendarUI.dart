import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonPushUI.dart';
import 'FriendProfileLessonRequestUI.dart';
import 'friendProfileCalendarProvider.dart';


class FriendProfileCalendar extends ConsumerWidget {
  FriendProfileCalendar({
    required this.argumentFriendUserDocId,
    required this.argumentFriendUserName,
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(friendProfileCalendarProvider.notifier).initialize();
    }

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SfCalendar(
                      timeSlotViewSettings: const TimeSlotViewSettings(
                          timeInterval: Duration(hours: 2)),
                      view: CalendarView.week,
                      monthViewSettings: const MonthViewSettings(showAgenda: true),
                      dataSource: ref.watch(friendProfileCalendarProvider).eventDataSource,
                      onTap: (calendarTapDetails) async {
                        commonNavigatorPushSlideHorizon(context, FriendProfileLessonRequest(argumentFriendUserDocId: argumentFriendUserDocId,
                          argumentFriendUserName:argumentFriendUserName ,
                          calendarDetails: calendarTapDetails,));
                      },
                      onViewChanged:(viewChangedDetails) async {
                        ref.read(friendProfileCalendarProvider.notifier).calendarRefreshShow( ref,  viewChangedDetails.visibleDates.first, viewChangedDetails.visibleDates.last, argumentFriendUserDocId, argumentFriendUserName);
                      })
              ),
            ],
          ),
        ));
  }
}