import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'daoFirebase/eventsDaoFirebase.dart';

final calendarEditProvider = ChangeNotifierProvider(
      (ref) => CalendarEditNotifier(),
);
class CalendarEditNotifier extends ChangeNotifier {

  DateTime? _editedDateTimeFrom ;
  DateTime? _editedDateTimeTo ;
  String _editedEventName = "";

  get editedDateTimeFrom=> _editedDateTimeFrom;
  get editedDateTimeTo=> _editedDateTimeTo;
  get editedEventName=> _editedEventName;

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

}

