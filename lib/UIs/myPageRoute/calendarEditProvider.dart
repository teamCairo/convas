import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';

final calendarEditProvider = ChangeNotifierProvider(
      (ref) => CalendarEditNotifier(),
);
class CalendarEditNotifier extends ChangeNotifier {

  String _editMode ="";
  get editMode=> _editMode;

  DateTime? _editedDateTimeFrom ;
  DateTime? _editedDateTimeTo ;
  String _editedEventName = "";
  String _editedEventDocId = "";
  Map<String,bool> _checkMap = {
    'repeat':false,
    'monday':false,
    'tuesday':false,
    'wednesday':false,
    'thursday':false,
    'friday':false,
    'saturday':false,
    'sunday':false,
  };
  String _editedEventType ="1";
  String _editedDescription ="";

  DateTime? get editedDateTimeFrom=> _editedDateTimeFrom;
  DateTime? get editedDateTimeTo=> _editedDateTimeTo;
  String get editedEventName=> _editedEventName;
  String get editedEventDocId=> _editedEventDocId;
  Map<String,bool> get checkMap=> _checkMap;
  String get editedEventType=> _editedEventType;
  String get description=> _editedDescription;

  setEventType(String eventType){
    _editedEventType=eventType;
    notifyListeners();
  }

  setDescription(String description){
    _editedDescription=description;
    notifyListeners();
  }

  setCheck(bool checkBool,String key){
    _checkMap[key]=checkBool;
  }

  setEditMode(String editMode){
    _editMode=editMode;
  }

  setEditedEventName(String eventName){
    _editedEventName=eventName;
  }
  setEditedDateTimeFrom(DateTime dateTime){
    _editedDateTimeTo =_editedDateTimeTo!.add(dateTime.difference(_editedDateTimeFrom!));
    _editedDateTimeFrom=dateTime;

  }

  setEditedDateTimeTo(DateTime dateTime){
    _editedDateTimeTo=dateTime;
  }

  void initializeEditedEvent(DateTime selectedDateTime){

    _editedDateTimeFrom =selectedDateTime;
    _editedDateTimeTo =selectedDateTime.add(const Duration(hours: 1));
    _editedEventName = "Available time";
    _editedEventDocId="";
    _checkMap = {
      'repeat':false,
      'monday':false,
      'tuesday':false,
      'wednesday':false,
      'thursday':false,
      'friday':false,
      'saturday':false,
      'sunday':false,
    };
    _editedDescription ="";
    _editedEventType="1";
  }


  void setEditedEventInfo(Appointment event){
    _editedDateTimeFrom =event.startTime;
    _editedDateTimeTo =event.endTime;
    _editedEventName = event.subject;
    _editedEventDocId=commonGetAppointmentNotesItemString(event, "eventDocId");
    _editedDescription =commonGetAppointmentNotesItemString(event, "description");
    _editedEventType =commonGetAppointmentNotesItemString(event, "eventType");
    _checkMap = {
      'repeat':parseBool(commonGetAppointmentNotesItemString(event, "repeat")),
      'monday':parseBool(commonGetAppointmentNotesItemString(event, "monday")),
      'tuesday':parseBool(commonGetAppointmentNotesItemString(event, "tuesday")),
      'wednesday':parseBool(commonGetAppointmentNotesItemString(event, "wednesday")),
      'thursday':parseBool(commonGetAppointmentNotesItemString(event, "thursday")),
      'friday':parseBool(commonGetAppointmentNotesItemString(event, "friday")),
      'saturday':parseBool(commonGetAppointmentNotesItemString(event, "saturday")),
      'sunday':parseBool(commonGetAppointmentNotesItemString(event, "sunday")),
    };
  }


  Future<void> insertEditedEvent(WidgetRef ref)async {

    await insertEventData(
      ref: ref,
      userDocId:ref.watch(userDataProvider).userData["userDocId"],
      eventName:_editedEventName,
      eventType:"1",
      friendUserDocId:"",
      callChannelId:"",
      fromTime:_editedDateTimeFrom!,
      toTime:_editedDateTimeTo!,
      isAllDay:false,
      repeat:_checkMap["repeat"]!,
      monday:_checkMap["monday"]!,
      tuesday:_checkMap["tuesday"]!,
      wednesday:_checkMap["wednesday"]!,
      thursday:_checkMap["thursday"]!,
      friday:_checkMap["friday"]!,
      saturday:_checkMap["saturday"]!,
      sunday:_checkMap["sunday"]!,
      description:"",
      programId: 'calendarEdit',
    );

  }

  Future<void> updateEditedEvent(WidgetRef ref)async {

    await updateEventData(
      ref: ref,
      userDocId: ref.watch(userDataProvider).userData["userDocId"],
      eventDocId: _editedEventDocId,
      eventName:_editedEventName,
      eventType:"1",
      friendUserDocId:"",
      callChannelId:"",
      fromTime:_editedDateTimeFrom!,
      toTime:_editedDateTimeTo!,
      isAllDay:false,
      repeat:_checkMap["repeat"]!,
      monday:_checkMap["monday"]!,
      tuesday:_checkMap["tuesday"]!,
      wednesday:_checkMap["wednesday"]!,
      thursday:_checkMap["thursday"]!,
      friday:_checkMap["friday"]!,
      saturday:_checkMap["saturday"]!,
      sunday:_checkMap["sunday"]!,
      description:_editedDescription,
      programId: 'calendarEdit',
    );

  }

}

