import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Appointment> source) {

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
    return appointments![index].subject;
  }

  @override
  Color getColor(int index) {

    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  String getRecurrenceRule(int index) {
    return appointments![index].recurrenceRule;
  }

  @override
  String getNotes(int index) {
    return appointments![index].notes;
  }
}