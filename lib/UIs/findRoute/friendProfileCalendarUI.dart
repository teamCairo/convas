import 'package:convas/UIs/now/nowPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/commonValues.dart';

class FriendProfileCalendar extends ConsumerWidget {
  FriendProfileCalendar({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      // ref.watch(nowPageProvider.notifier).initializeEditedEvent();
    }

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SfCalendar(
                      timeSlotViewSettings: const TimeSlotViewSettings(
                          timeInterval: Duration(hours: 2)),
                      view: CalendarView.timelineDay,
                      monthViewSettings: const MonthViewSettings(showAgenda: true),
                      dataSource: ref.watch(nowPageProvider).eventDataSource,
                      onTap: (calendarTapDetails) async {
                        // ref.read(nowPageProvider.notifier).setCalendarTapDetails(calendarTapDetails);
                      },
                      onViewChanged:(viewChangedDetails) async {
                        // ref.read(nowPageProvider.notifier).refleshEventShow(viewChangedDetails.visibleDates[0].add(const Duration(days:-1)), viewChangedDetails.visibleDates[0].add(const Duration(days:1)));
                      })
              ),
            ],
          ),
        ));
  }
}