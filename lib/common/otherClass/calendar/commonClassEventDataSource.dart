import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../entityIsar/eventEntityIsar.dart';
import 'commonClassCalendarEvent.dart';


class EventDataSource extends CalendarDataSource {
  EventDataSource(List<CalendarEvent> source) {

    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].fromTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].toTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {

    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}