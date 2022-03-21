import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../entityIsar/eventEntityIsar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source) {
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


    if(appointments![index].eventType=="1"){
      return const Color(0xFF0F8644);
    }else{

      return const Color(0xFFF0F000);
    }
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}