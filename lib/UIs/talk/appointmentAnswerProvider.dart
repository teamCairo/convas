
import 'package:convas/common/otherClass/commonClassAppointment.dart';
import 'package:convas/daoFirebase/appointmentsDaoFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final appointmentAnswerProvider = ChangeNotifierProvider(
      (ref) => AppointmentAnswerNotifier(),
);
class AppointmentAnswerNotifier extends ChangeNotifier {

  String _courseCode = "";
  String get courseCode => _courseCode;

  String _categoryCode = "";
  String get categoryCode => _categoryCode;

  String _requestDocId = "";
  String get requestDocId => _requestDocId;

  String _message = "";
  String get message => _message;

  DateTime? _editedDateTimeFrom;
  DateTime? get editedDateTimeFrom => _editedDateTimeFrom;
  DateTime? _editedDateTimeTo;
  DateTime? get editedDateTimeTo => _editedDateTimeTo;

  void initializeProvider(String mode,String? requestDocId,CalendarTapDetails? calendarDetails, String? appointmentDocId,StateSetter setState)async{
    if(mode=="1"){
      _courseCode = "";
      _categoryCode = "";
      _requestDocId=requestDocId!;
      _editedDateTimeFrom =calendarDetails!.date;
      _editedDateTimeTo =_editedDateTimeFrom!.add(const Duration(hours: 1));
      _message="";

    }else{
      CommonAppointment appointment = await selectFirebaseAppointmentByAppointmentDocId(appointmentDocId!);

      _courseCode = appointment.courseCode;
      _categoryCode = appointment.categoryCode;
      _requestDocId=requestDocId??"";
      _editedDateTimeFrom =appointment.fromTime;
      _editedDateTimeTo =appointment.toTime;
      _message="";
    }

    setState(() {
    });
  }

  setEditedDateTimeFrom(DateTime dateTime){
    _editedDateTimeTo =_editedDateTimeTo!.add(dateTime.difference(_editedDateTimeFrom!));
    _editedDateTimeFrom=dateTime;

  }


  setMessage(String message){
    _message=message;
  }

  setEditedDateTimeTo(DateTime dateTime){
    _editedDateTimeTo=dateTime;
  }


}