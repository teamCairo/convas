import 'package:convas/UIs/now/nowPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/otherClass/calendar/commonClassEventDataSourceNew.dart';

class NowPage extends ConsumerWidget {
  NowPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
