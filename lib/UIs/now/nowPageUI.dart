import 'package:convas/UIs/now/nowPageProvider.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/commonClassEventDataSource.dart';

class NowPage extends ConsumerWidget {
  NowPage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
        body: SafeArea(
            child: SfCalendar(
                view: CalendarView.timelineDay,
                monthViewSettings: const MonthViewSettings(showAgenda: true),
                dataSource: EventDataSource(
                  ref.watch(nowPageProvider).eventList
                    ),
                onTap: (calendarDetails) async{
                })));
  }
}
