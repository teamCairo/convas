import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/provider/friendProvider.dart';
import 'package:convas/entityIsar/friendEntityIsar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/commonValues.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../entityIsar/eventEntityIsar.dart';
import '../../faoFirebaseStorage/usersPhotoFaoFirebase.dart';



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


  void refreshEventShow(WidgetRef ref, DateTime from,DateTime to)async{

    List<Event> _firebaseEventList=await selectFirebaseEventsByDateTimeOrderByFromLimitNum(from.add(const Duration(days:-1)),to,calendarTimelineMaxPeople);

    _userDocIdForShowList=[];
    List<String> userDocIdForSearchList=[];
    List<Appointment> appointmentList=[];


    //TODO　繰り返しのデータは日付に関係なく取得する？
    //TODO FROMの日付でみているため、過去1日分余裕を持ってとっている。そのため無駄なイベントも取得しているので、ユーザリストを作る処理の中でTOの時間で選別する
    //まずは表示するユーザを選定、データを整形
    for(int i=0;i<_firebaseEventList.length;i++){
      //過去のイベントもしくはもうすでにリストに加えたユーザなら何もしない
      if(_firebaseEventList[i].toTime!.isAfter(from)
          &&!_userDocIdForShowList.contains(_firebaseEventList[i].userDocId)
        ){
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
        Friend? tmpFriendData=await ref.watch(friendDataProvider).friendData[userDataSnapshot.docs[i].id];
        Image? photo;
        if(tmpFriendData==null){
          photo = await getUsersSmallPhoto(userDataSnapshot.docs[i].id, userDataSnapshot.docs[i].get("profilePhotoNameSuffix") );
        }else{
          if(tmpFriendData.profilePhoto!=null){
            photo = Image.memory(tmpFriendData.profilePhoto!);
          }else{
            photo =null;
          }
        }
        _userInfoMap[userDataSnapshot.docs[i].id]=UserInfoForTimeline(userDataSnapshot.docs[i].get("name"),photo);
      }
    }

    int userNo =-1;
    //データを整えていく
    for(int i=0;i<_firebaseEventList.length;i++){

      //選定したユーザのデータなら追加
      userNo=_userDocIdForShowList.indexOf(_firebaseEventList[i].userDocId);
      if(userNo>-1){
        appointmentList.add(
          commonMakeAppointment(_firebaseEventList[i].eventDocId,
              _firebaseEventList[i].userDocId,
            _userInfoMap[_firebaseEventList[i].userDocId]!.name,
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
            calendarTimelineColors[userNo],
            ""
          )
        );
      }
    }
    _eventDataSource=EventDataSource(appointmentList);

    notifyListeners();
  }
}

