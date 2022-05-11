import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../entityIsar/eventEntityIsar.dart';
import '../../commonValues.dart';
import '../../logic/commonLogicOthers.dart';

Appointment commonMakeAppointment(String eventDocId,
    String userDocId,
    String userName,
    String eventName,
    String eventType,
    String friendUserDocId,
    String callChannelId,
    DateTime fromTime,
    DateTime toTime,
    bool isAllDay,
    bool repeat,
    bool monday,
    bool tuesday,
    bool wednesday,
    bool thursday,
    bool friday,
    bool saturday,
    bool sunday,
    String description,
    String recurrenceRule,
    List<DateTime>? recurrenceExceptionDates,
    Color color,
    String location) {
  String notes =
      "eventDocId@@:" + eventDocId + separatingCharacter5at +
          "repeat@@:" + repeat.toString() + separatingCharacter5at +
          "monday@@:" + monday.toString() + separatingCharacter5at +
          "tuesday@@:" + tuesday.toString() + separatingCharacter5at +
          "wednesday@@:" + wednesday.toString() + separatingCharacter5at +
          "thursday@@:" + thursday.toString() + separatingCharacter5at +
          "friday@@:" + friday.toString() + separatingCharacter5at +
          "saturday@@:" + saturday.toString() + separatingCharacter5at +
          "sunday@@:" + sunday.toString() + separatingCharacter5at +
          "description@@:" + description + separatingCharacter5at +
          "userName@@:" + userName + separatingCharacter5at +
          "userDocId@@:" + userDocId + separatingCharacter5at +
          "callChannelId@@:" + callChannelId + separatingCharacter5at +
          "friendUserDocId@@:" + friendUserDocId + separatingCharacter5at +
          "eventType@@:" + eventType + separatingCharacter5at;

  return Appointment(
      isAllDay: isAllDay,
      notes: notes,
      startTime: fromTime,
      endTime: toTime,
      recurrenceRule: recurrenceRule,
      recurrenceExceptionDates: recurrenceExceptionDates,
      color: color,
      subject: eventName,
      location: location
  );
}

String commonGetAppointmentNotesItemString(Appointment appointment,
    String itemName) {
  return appointment.notes!.substring(appointment.notes!.indexOf(itemName + "@@:")+(itemName + "@@:").length,appointment.notes!.indexOf(separatingCharacter5at,appointment.notes!.indexOf(itemName + "@@:")+(itemName + "@@:").length));
}

List<Appointment> commonGetAppointmentListFromEventList(
    List<Event> eventsList,Map<String,UserInfoForTimeline> userMap) {
  List<Appointment> appointmentsList = [];
  for (int i = 0; i < eventsList.length; i++) {
    appointmentsList.add(
        commonMakeAppointment(
            eventsList[i].eventDocId,
            eventsList[i].userDocId,
            userMap[eventsList[i].userDocId]==null?"":userMap[eventsList[i].userDocId]!.name,
            eventsList[i].eventName,
            eventsList[i].eventType,
            eventsList[i].friendUserDocId,
            eventsList[i].callChannelId ?? "",
            eventsList[i].fromTime!,
            eventsList[i].toTime!,
            eventsList[i].isAllDay,
            eventsList[i].repeat,
            eventsList[i].monday,
            eventsList[i].tuesday,
            eventsList[i].wednesday,
            eventsList[i].thursday,
            eventsList[i].friday,
            eventsList[i].saturday,
            eventsList[i].sunday,
            eventsList[i].description,
            eventsList[i].recurrenceRule,
            null,
            commonLogicGetAvailabilityColor(eventsList[i].eventType),
            ""
        )

    );
  }
  return appointmentsList;
}

class UserInfoForTimeline{

  UserInfoForTimeline(
      this.name,
      this.photo
      );

  String name;
  Image? photo;

}
