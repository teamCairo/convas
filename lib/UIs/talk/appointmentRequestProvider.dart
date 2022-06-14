import 'dart:async';

import 'package:convas/common/otherClass/commonClassAppointment.dart';
import 'package:convas/common/otherClass/commonClassRequest.dart';
import 'package:convas/common/provider/friendProvider.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../daoFirebase/appointmentsDaoFirebase.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../daoFirebase/friendsDaoFirebase.dart';
import '../../daoFirebase/requestsDaoFirebase.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../daoIsar/friendDaoIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../../faoFirebaseStorage/usersPhotoFaoFirebase.dart';

final appointRequestProvider = ChangeNotifierProvider(
  (ref) => AppointRequestNotifier(),
);

class AppointRequestNotifier extends ChangeNotifier {
  String _requestDocId = "";
  String _requestMessage = "";
  String _friendUserDocId = "";
  String _appointmentDocId = "";
  String _status = "";
  DateTime? _from;
  DateTime? _to;
  String _message = "";
  Image? _friendPhoto =null;

  String get requestDocId => _requestDocId;

  String get appointmentDocId => _appointmentDocId;

  String get requestMessage => _requestMessage;

  String get status => _status;

  DateTime? get from => _from;

  DateTime? get to => _to;

  String get message => _message;

  Image? get friendPhoto => _friendPhoto;

  setFrom(DateTime dateTime){
    _to =_to!.add(dateTime.difference(_from!));
    _from=dateTime;
    notifyListeners();

  }

  setTo(DateTime dateTime){
    _to=dateTime;
    notifyListeners();
  }

  String getStringFrom() {
    return fromDateToYearMonthDayHourMin(_from);
  }

  String getStringTo() {
    return fromDateToYearMonthDayHourMin(_to);
  }

  void setMessage(String message) async {
    _message = message;
    notifyListeners();
  }
  
  void clear(){
    _requestDocId = "";
    _requestMessage = "";
    _friendUserDocId = "";
    _appointmentDocId = "";
    _status = "";
    _from=null;
    _to=null;
    _message = "";
    _friendPhoto =null;
  }

  Future<void> initialize(String mode, String appointmentDocId,
      String requestDocId, String friendUserDocId,CalendarTapDetails? calendarDetails) async {

    _friendPhoto = await getUsersBigPhoto(friendUserDocId, (await selectFirebaseUserByUserDocId(friendUserDocId)).get("profilePhotoNameSuffix"));

    if(mode == "1"){
      _from=calendarDetails!.date;
      _to=calendarDetails.date!.add(const Duration(minutes:30));
      _message="";
    }else if (mode == "2") {
      _requestDocId = requestDocId;
      _friendUserDocId = friendUserDocId;

      CommonClassRequest request =
      await selectFirebaseRequestById(_requestDocId);

      _from = request.from;
      _to = request.to;
      _status = request.status;
      _requestMessage = request.message;
    } else {
      {
        _appointmentDocId = appointmentDocId;
        _friendUserDocId = friendUserDocId;

        CommonClassAppointment appointment =
        await selectFirebaseAppointmentByAppointmentDocId(_appointmentDocId);

        _from = appointment.fromTime;
        _to = appointment.toTime;
        _status = appointment.status;
        _message = appointment.message;
        _requestMessage = appointment.requestMessage;
      }
    }
    notifyListeners();
  }



    Future<String> acceptLessonRequest(WidgetRef ref) async {
      await updateFirebaseRequestsStatus(
          _requestDocId, "2", "appointmentRequestProvider");
      String appointmentDocId = await insertFirebaseAppointmentsFromRequest(
          requestDocId,
          message,
          ref
              .watch(userDataProvider)
              .userData["userDocId"],
          "appointmentRequestProvider");

      await insertChatDetailsDataMessage(
          ref: ref,
          chatHeaderDocId: ref
              .watch(friendDataProvider)
              .friendData[_friendUserDocId]!.chatHeaderId,
          friendUserDocId: _friendUserDocId,
          message: message,
          messageType: "4",
          referDocId: appointmentDocId,
          programId: "appointmentRequestProvider");

      return appointmentDocId;
    }

    Future<void> denyLessonRequest(WidgetRef ref) async {
      await updateFirebaseRequestsStatus(
          _requestDocId, "3", "appointmentRequestProvider");

      await insertChatDetailsDataMessage(
          ref: ref,
          chatHeaderDocId: ref
              .watch(friendDataProvider)
              .friendData[_friendUserDocId]!.chatHeaderId,
          friendUserDocId: _friendUserDocId,
          message: message,
          messageType: "2",
          referDocId: "",
          programId: "appointmentRequestProvider");
    }

  Future<void> sendRequest(String friendUserDocId,WidgetRef ref)async {

    String chatHeaderDocId="";
    //Friendかどうかをチェック
    Friend? checkFriend = await selectIsarFriendById(friendUserDocId);
    if(checkFriend==null){
      chatHeaderDocId = await insertFriendsData(ref,friendUserDocId,"createRequest");
    }else{
      chatHeaderDocId = checkFriend.chatHeaderId;
    }


    String requestDocId = await insertFirebaseRequests(
        userDocId:ref.watch(userDataProvider).userData["userDocId"],
        friendUserDocId:friendUserDocId,
        courseCodeListText:"",
        categoryCodeListText:"",
        from:_from!,
        to:_to!,
        message:_message,
        programId:"createRequest"
    );

    await insertChatDetailsDataMessage(
        ref:ref,
        chatHeaderDocId:chatHeaderDocId,
        friendUserDocId:friendUserDocId,
        message:_message,
        messageType:"3",
        referDocId: requestDocId,
        programId: "createRequest");
  }

}