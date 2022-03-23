import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/commonValues.dart';
import '../../common/otherClass/calendar/commonClassCalendarEvent.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../entityIsar/eventEntityIsar.dart';
import '../../faoFirebaseStorage/usersPhotoFaoFirebase.dart';

class UserInfoForTimeline{

  UserInfoForTimeline(
    this.name,
    this.photo
  );

  String name;
  Image? photo;

}

final nowPageProvider = ChangeNotifierProvider(
      (ref) => NowPageNotifier(),
);
class NowPageNotifier extends ChangeNotifier {

  List<String> _userDocIdForShowList=[];
  List<String> get userDocIdForShowList=>_userDocIdForShowList;

  CalendarTapDetails? _selectedCalendarTapDetails;
  CalendarTapDetails? get selectedCalendarTapDetails=>_selectedCalendarTapDetails;

  setCalendarTapDetails(CalendarTapDetails? calendarTapDetails){

    _selectedCalendarTapDetails=calendarTapDetails;
    notifyListeners();

  }


  EventDataSource? _eventDataSource;
  EventDataSource? get eventDataSource =>_eventDataSource;

  Map<String,UserInfoForTimeline> _userInfoMap ={};//写真だけは重いので持っておく
  Map<String,UserInfoForTimeline> get userInfoMap => _userInfoMap;


  void initializeEditedEvent()async{

    _eventDataSource=null;
    _selectedCalendarTapDetails=null;
    _userInfoMap={};
    _userDocIdForShowList=[];
  }


  void refleshEventShow(DateTime from,DateTime to)async{

    List<Event> _firebaseEventList=await selectFirebaseEventsByDateTimeOrderByFromLimitNum(from,to,calendarTimelineMaxPeople);

    _userDocIdForShowList=[];
    List<String> userDocIdForSearchList=[];
    List<CalendarEvent> calendarEventList=[];

    //まずは表示するユーザを選定、データを整形
    for(int i=0;i<_firebaseEventList.length;i++){
      //過去のイベントもしくはもうすでにリストに加えたユーザなら何もしない
      if(_firebaseEventList[i].toTime!.isAfter(DateTime.now())&&!_userDocIdForShowList.contains(_firebaseEventList[i].userDocId)){
        _userDocIdForShowList.add(_firebaseEventList[i].userDocId);

        //_userInfoMapにある情報はわざわざ取得しない
        if(_userInfoMap[_firebaseEventList[i].userDocId]==null){
          userDocIdForSearchList.add(_firebaseEventList[i].userDocId);
        }
      }
    }
    if(userDocIdForSearchList.isNotEmpty){
      QuerySnapshot userDataSnapshot = await selectFirebaseByUserDocIdList(userDocIdForSearchList);
      for(int i=0;i<userDataSnapshot.size;i++){
        Image? photo = await getUsersSmallPhoto(userDataSnapshot.docs[i].id, userDataSnapshot.docs[i].get("profilePhotoNameSuffix") );
        _userInfoMap[userDataSnapshot.docs[i].id]=UserInfoForTimeline(userDataSnapshot.docs[i].get("name"),photo);
      }
    }

    int userNo =-1;
    //データを整えていく
    for(int i=0;i<_firebaseEventList.length;i++){

      //選定したユーザのデータなら追加
      userNo=_userDocIdForShowList.indexOf(_firebaseEventList[i].userDocId);
      if(userNo>-1){
        calendarEventList.add(
          CalendarEvent(_firebaseEventList[i].eventDocId,
              _firebaseEventList[i].userDocId,
            _userInfoMap[_firebaseEventList[i].userDocId]!.name,
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

