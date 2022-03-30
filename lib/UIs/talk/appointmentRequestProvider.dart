
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/daoFirebase/eventsDaoFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../common/logic/commonLogicList.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../entityIsar/eventEntityIsar.dart';

final appointRequestProvider = ChangeNotifierProvider(
      (ref) => AppointRequestNotifier(),
);
class AppointRequestNotifier extends ChangeNotifier {

  String _courseCodeListText = "";
  String get courseCodeListText => _courseCodeListText;

  String _categoryCodeListText = "";
  String get categoryCodeListText => _categoryCodeListText;

  String _message = "";
  String get message => _message;

  List<Appointment> _appointmentList = [];
  List<Appointment> get appointmentList => _appointmentList;

  String _chatHeaderDocId = "";
  String get chatHeaderDocId => _chatHeaderDocId;

  void initializeRequest(String mode,String requestDocId)async{
    if(mode=="1"){
      _courseCodeListText = "";
      _categoryCodeListText = "";
      _message = "";
      _chatHeaderDocId = "";

    }else{

      DocumentSnapshot request = await selectFirebaseRequestById(requestDocId);

      _courseCodeListText = request.get("courseCodeListText");
      _categoryCodeListText =request.get("categoryCodeListText");
      _message =request.get("message");
      _chatHeaderDocId = "";

      notifyListeners();
    }
  }

  Future<DocumentSnapshot> selectFirebaseRequestById(String requestDocId)async{
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('requests')
        .doc(requestDocId)
        .get();

    return snapshot;
  }

  void setChatHeaderDocId(String inputId){
    _chatHeaderDocId=inputId;

  }

  void setRequestMessage(String inputValue){
    _message=inputValue;
    notifyListeners();

  }

  //TODO 使っていないので使う必要あり
  Future<void> initializeAppointment(WidgetRef ref, DateTime from,DateTime to,String friendUserDocId,String friendUserName)async{

    List<Event> _firebaseEventList=await selectFirebaseEventsByDateTimeAndFriend(from, to, friendUserDocId);
    _appointmentList=[];

    for(int i=0;i<_firebaseEventList.length;i++){

      //選定したユーザのデータなら追加
        appointmentList.add(
            commonMakeAppointment(_firebaseEventList[i].eventDocId,
                _firebaseEventList[i].userDocId,
                friendUserName,
                _firebaseEventList[i].eventName,
                _firebaseEventList[i].eventType,
                _firebaseEventList[i].friendUserDocId,
                _firebaseEventList[i].callChannelId??"",
                _firebaseEventList[i].fromTime!,
                _firebaseEventList[i].toTime!,
                _firebaseEventList[i].isAllDay,
                _firebaseEventList[i].repeat,
                _firebaseEventList[i].monday,
                _firebaseEventList[i].tuesday,
                _firebaseEventList[i].wednesday,
                _firebaseEventList[i].thursday,
                _firebaseEventList[i].friday,
                _firebaseEventList[i].saturday,
                _firebaseEventList[i].sunday,
                _firebaseEventList[i].description,
                _firebaseEventList[i].recurrenceRule,
                null,
                Colors.orange,
                ""
            )
        );
    }

    notifyListeners();
  }

  void setInfoByMap(WidgetRef ref,String databaseItem,Map<String,bool> values){

    List<String> tmpList =[];
    values.forEach((k, v){
      if(v){
        tmpList.add(k);
      }
    });

    String value=fromListToTextDot(tmpList);
    setInfo(ref, databaseItem, value);
  }


  void setInfo(WidgetRef ref,String databaseItem,String value){
    switch(databaseItem){
      case "course":
        _courseCodeListText=value;
        break;

      case "category":
        _categoryCodeListText=value;
        break;
    }
    notifyListeners();
  }


}