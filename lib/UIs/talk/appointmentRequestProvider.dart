import 'package:convas/common/otherClass/commonClassAppointment.dart';
import 'package:convas/common/otherClass/commonClassRequest.dart';
import 'package:convas/common/provider/friendProvider.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../daoFirebase/appointmentsDaoFirebase.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../daoFirebase/requestsDaoFirebase.dart';

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

  String get requestDocId => _requestDocId;

  String get appointmentDocId => _appointmentDocId;

  String get requestMessage => _requestMessage;

  String get status => _status;

  DateTime? get from => _from;

  DateTime? get to => _to;

  String get message => _message;

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

  Future<void> initialize(String mode, String appointmentDocId,
      String requestDocId, String friendUserDocId) async {
    if (mode == "1") {
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
      notifyListeners();
    }
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

// void setChatHeaderDocId(String inputId){
//   _chatHeaderDocId=inputId;
//
// }
//
// void setRequestMessage(String inputValue){
//   _message=inputValue;
//   notifyListeners();
//
// }

// void setInfoByMap(WidgetRef ref,String databaseItem,Map<String,bool> values){
//
//   List<String> tmpList =[];
//   values.forEach((k, v){
//     if(v){
//       tmpList.add(k);
//     }
//   });
//
//   String value=fromListToTextDot(tmpList);
//   setInfo(ref, databaseItem, value);
// }
//
//
// void setInfo(WidgetRef ref,String databaseItem,String value){
//   switch(databaseItem){
//     case "course":
//       _courseCodeListText=value;
//       break;
//
//     case "category":
//       _categoryCodeListText=value;
//       break;
//   }
//   notifyListeners();
// }
//

}