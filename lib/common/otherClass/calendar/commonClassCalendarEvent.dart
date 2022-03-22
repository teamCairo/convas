import 'dart:ui';

class CalendarEvent {
  CalendarEvent(this.eventDocId,
      this.userDocId,
      this.userName,
      this.eventName,
      this.eventType,
      this.friendUserDocId,
      this.callChannelId,
      this.fromTime,
      this.toTime,
      this.isAllDay,
      this.color
      );

  late String eventDocId;
  late String userDocId;
  late String userName;
  late String eventName;
  late String eventType;
  late String friendUserDocId;
  String? callChannelId;
  DateTime? fromTime;
  DateTime? toTime;
  late bool isAllDay;
  Color color;
}