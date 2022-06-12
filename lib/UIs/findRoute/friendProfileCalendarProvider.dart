import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/logic/commonLogicOthers.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';
import '../../entityIsar/eventEntityIsar.dart';

final friendProfileCalendarProvider = ChangeNotifierProvider(
      (ref) => FriendProfileCalendarNotifier(),
);
class FriendProfileCalendarNotifier extends ChangeNotifier {

  EventDataSource? _eventDataSource;
  EventDataSource? get eventDataSource =>_eventDataSource;

  void initialize()async{
    _eventDataSource=null;
    // _selectedCalendarTapDetails=null;
  }

  void calendarRefreshShow(WidgetRef ref, DateTime from,DateTime to, String friendUserDocId, String friendUserName)async{

    List<Event> _firebaseEventList=await selectFirebaseEventsNotRepeatByDateTimeAndFriend(from,to,friendUserDocId);
    _firebaseEventList.addAll(await selectRepeatingEventDateByDateTimeAndFriend(to,friendUserDocId));
    List<Appointment> appointmentList=[];

    for(int i=0;i<_firebaseEventList.length;i++){
        appointmentList.add(
            commonMakeAppointment(_firebaseEventList[i].eventDocId,
                friendUserDocId,
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
                commonLogicGetAvailabilityColor(_firebaseEventList[i].eventType),
                ""
            )
        );
    }
    _eventDataSource=EventDataSource(appointmentList);
    notifyListeners();
  }
}

