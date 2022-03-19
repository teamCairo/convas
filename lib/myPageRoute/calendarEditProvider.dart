import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../daoFirebase/eventsDaoFirebase.dart';
import '../entityIsar/eventEntityIsar.dart';

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

  get editedDateTimeFrom=> _editedDateTimeFrom;
  get editedDateTimeTo=> _editedDateTimeTo;
  get editedEventName=> _editedEventName;
  get editedEventDocId=> _editedEventDocId;

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
  }


  void setEditedEventInfo(Event event){
    _editedDateTimeFrom =event.fromTime;
    _editedDateTimeTo =event.toTime;
    _editedEventName = event.eventName;
    _editedEventDocId=event.eventDocId;
  }


  Future<void> insertEditedEvent(WidgetRef ref)async {

    await insertEventData(
      ref: ref,
      eventName:_editedEventName,
      eventType:"1",
      friendUserDocId:"",
      callChannelId:"",
      fromTime:_editedDateTimeFrom!,
      toTime:_editedDateTimeTo!,
      isAllDay:false,
      programId: 'calendarEdit',
    );

  }

  Future<void> updateEditedEvent(WidgetRef ref)async {

    await updateEventData(
      ref: ref,
      eventDocId: _editedEventDocId,
      eventName:_editedEventName,
      eventType:"1",
      friendUserDocId:"",
      callChannelId:"",
      fromTime:_editedDateTimeFrom!,
      toTime:_editedDateTimeTo!,
      isAllDay:false,
      programId: 'calendarEdit',
    );

  }

}

