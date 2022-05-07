import 'package:convas/common/provider/masterProvider.dart';
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
  bool _repeat = false;

  DateTime? _editedDateTimeFrom ;
  DateTime? _editedDateTimeTo ;
  String _editedEventName = "";
  String _editedEventDocId = "";
  Map<String,bool> _repeatsMap = {
    'sunday':false,
    'monday':false,
    'tuesday':false,
    'wednesday':false,
    'thursday':false,
    'friday':false,
    'saturday':false,
  };
  String _editedEventType ="1";
  String _editedDescription ="";

  DateTime? get editedDateTimeFrom=> _editedDateTimeFrom;
  DateTime? get editedDateTimeTo=> _editedDateTimeTo;
  String get editedEventName=> _editedEventName;
  String get editedEventDocId=> _editedEventDocId;
  // Map<String,bool> get checkMap=> _checkMap;
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

  setRepeats(bool checkBool,String key){
    _repeatsMap[key]=checkBool;
    if(
    _repeatsMap["sunday"]==true||
        _repeatsMap["monday"]==true||
        _repeatsMap["tuesday"]==true||
        _repeatsMap["wednesday"]==true||
        _repeatsMap["thursday"]==true||
        _repeatsMap["friday"]==true||
        _repeatsMap["saturday"]==true
    ){
      _repeat=true;
    }else{
      _repeat=false;
    }
    notifyListeners();
  }
  getRepeats(String key){
    return _repeatsMap[key];
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
    notifyListeners();

  }

  setEditedDateTimeTo(DateTime dateTime){
    _editedDateTimeTo=dateTime;
    notifyListeners();
  }

  void initializeEditedEvent(DateTime selectedDateTime){

    _editedDateTimeFrom =selectedDateTime;
    _editedDateTimeTo =selectedDateTime.add(const Duration(hours: 1));
    // _editedEventName = "Available";
    _editedEventDocId="";
    _repeatsMap = {
      // 'repeat':false,
      'sunday':false,
      'monday':false,
      'tuesday':false,
      'wednesday':false,
      'thursday':false,
      'friday':false,
      'saturday':false,
    };
    _editedDescription ="";
    _editedEventType="2";
    _repeat = false;
  }


  void setEditedEventInfo(Appointment event){
    _editedDateTimeFrom =event.startTime;
    _editedDateTimeTo =event.endTime;
    _editedEventName = event.subject;
    _editedEventDocId=commonGetAppointmentNotesItemString(event, "eventDocId");
    _editedDescription =commonGetAppointmentNotesItemString(event, "description");
    _editedEventType =commonGetAppointmentNotesItemString(event, "eventType");
    _repeatsMap = {
      // 'repeat':parseBool(commonGetAppointmentNotesItemString(event, "repeat")),
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
      eventName:getMasterData("eventType", _editedEventType, ref).name,
      eventType:_editedEventType,
      friendUserDocId:"",
      callChannelId:"",
      fromTime:_editedDateTimeFrom!,
      toTime:_editedDateTimeTo!,
      isAllDay:false,
      repeat:_repeat!,
      monday:_repeatsMap["monday"]!,
      tuesday:_repeatsMap["tuesday"]!,
      wednesday:_repeatsMap["wednesday"]!,
      thursday:_repeatsMap["thursday"]!,
      friday:_repeatsMap["friday"]!,
      saturday:_repeatsMap["saturday"]!,
      sunday:_repeatsMap["sunday"]!,
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
      eventType:_editedEventType,
      friendUserDocId:"",
      callChannelId:"",
      fromTime:_editedDateTimeFrom!,
      toTime:_editedDateTimeTo!,
      isAllDay:false,
      repeat:_repeat!,
      monday:_repeatsMap["monday"]!,
      tuesday:_repeatsMap["tuesday"]!,
      wednesday:_repeatsMap["wednesday"]!,
      thursday:_repeatsMap["thursday"]!,
      friday:_repeatsMap["friday"]!,
      saturday:_repeatsMap["saturday"]!,
      sunday:_repeatsMap["sunday"]!,
      description:_editedDescription,
      programId: 'calendarEdit',
    );

  }

}

