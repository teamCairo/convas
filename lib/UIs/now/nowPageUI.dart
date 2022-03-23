import 'package:convas/UIs/now/nowPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class NowPage extends ConsumerWidget {
  NowPage({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg=true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(initialProcessFlg){
      initialProcessFlg=false;
      DateTime nowTime=DateTime.now();
      DateTime afterTomorrowTime=nowTime.add(const Duration(days:2));
      ref.watch(nowPageProvider.notifier).initializeEditedEvent(DateTime(nowTime.year,nowTime.month,nowTime.day,0,0,0), DateTime(afterTomorrowTime.year,afterTomorrowTime.month,afterTomorrowTime.day,0,0,0));
    }
    return Scaffold(
        body: SafeArea(
      child: SfCalendar(
          view: CalendarView.timelineDay,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          dataSource: ref.watch(nowPageProvider).eventDataSource,
          onTap: (calendarDetails) async {}),
    ));
  }
}
