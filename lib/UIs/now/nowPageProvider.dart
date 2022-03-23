import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/commonValues.dart';
import '../../common/otherClass/calendar/commonClassCalendarEvent.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../entityIsar/eventEntityIsar.dart';

final nowPageProvider = ChangeNotifierProvider(
      (ref) => NowPageNotifier(),
);
class NowPageNotifier extends ChangeNotifier {


  List<Event> _firebaseEventList =[];
  List<Event> get firebaseEventList => _firebaseEventList;

  EventDataSource? _eventDataSource =null;
  EventDataSource? get eventDataSource =>_eventDataSource;


  void initializeEditedEvent(DateTime from,DateTime to)async{
    _firebaseEventList=await selectFirebaseEventsByDateTimeOrderByFrom(from,to);

    List<String> userDocIdList=[];
    List<CalendarEvent> calendarEventList=[];

    //まずは表示するユーザを選定
    for(int i=0;i<_firebaseEventList.length&&userDocIdList.length<calendarTimelineMaxPeople;i++){
      //過去のイベントもしくはもうすでにリストに加えたユーザなら何もしない
      if(_firebaseEventList[i].toTime!.isAfter(DateTime.now())&&!userDocIdList.contains(_firebaseEventList[i].userDocId)){
        userDocIdList.add(_firebaseEventList[i].userDocId);
      }
    }

    //ユーザ名の取得処理
    Map<String,dynamic> userDataMap = await selectFirebaseByUserDocIdList(userDocIdList);

    int userNo =-1;
    //データを整えていく
    for(int i=0;i<_firebaseEventList.length;i++){

      //選定したユーザのデータなら追加
      userNo=userDocIdList.indexOf(_firebaseEventList[i].userDocId);
      if(userNo>-1){
        calendarEventList.add(
          CalendarEvent(_firebaseEventList[i].eventDocId,
              _firebaseEventList[i].userDocId,
              userDataMap[_firebaseEventList[i].userDocId].get("name"),
            _firebaseEventList[i].eventName,
            _firebaseEventList[i].eventType,
            _firebaseEventList[i].friendUserDocId,
            _firebaseEventList[i].callChannelId,
            _firebaseEventList[i].fromTime,
            _firebaseEventList[i].toTime,
            _firebaseEventList[i].isAllDay,
              calendarTimelineColors[userNo]
          )
        );
      }
    }


    _eventDataSource=EventDataSource(calendarEventList);

    notifyListeners();
  }
}

