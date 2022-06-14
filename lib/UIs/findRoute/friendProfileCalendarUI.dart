import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../talk/appointmentRequestViewUI.dart';
import 'friendProfileCalendarProvider.dart';


class FriendProfileCalendar extends ConsumerWidget {
  FriendProfileCalendar({
    required this.argumentFriendUserDocId,
    required this.argumentFriendUserName,
    this.argumentFriendPhoto,
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;
  final Image? argumentFriendPhoto;

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(friendProfileCalendarProvider.notifier).initialize();
    }

    return Scaffold(
      appBar:commonAppbar("Calendar",helpTitle:"Tap the calendar",helpText: "Find available time and send the teacher lesson request",contextForHelp: context),
        body: SafeArea(
          child: SfCalendar(
              timeSlotViewSettings: const TimeSlotViewSettings(),
              view: CalendarView.week,
              monthViewSettings: const MonthViewSettings(showAgenda: true),
              dataSource: ref.watch(friendProfileCalendarProvider).eventDataSource,
              onTap: (calendarTapDetails) async {
                commonNavigatorPushSlideHorizon(context, AppointmentRequestView(argumentFriendUserDocId,
                  argumentFriendUserName ,
                  "",
                  "",
                  calendarTapDetails,
                "1"));
              },
              onViewChanged:(viewChangedDetails) async {
                ref.read(friendProfileCalendarProvider.notifier).calendarRefreshShow( ref,  viewChangedDetails.visibleDates.first, viewChangedDetails.visibleDates.last, argumentFriendUserDocId, argumentFriendUserName);
              }),
        ));
  }
}