import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../daoFirebase/friendsDaoFirebase.dart';
import '../../daoFirebase/requestsDaoFirebase.dart';
import '../../daoIsar/friendDaoIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../talk/appointmentRequestProvider.dart';

final friendProfileCalendarDetailBottomSheetProvider = ChangeNotifierProvider(
      (ref) => FriendProfileCalendarDetailBottomSheetNotifier(),
);
class FriendProfileCalendarDetailBottomSheetNotifier extends ChangeNotifier {


  DateTime? _selectedDateTimeFrom ;
  DateTime? _selectedDateTimeTo ;

  DateTime? get selectedDateTimeFrom=> _selectedDateTimeFrom;
  DateTime? get selectedDateTimeTo=> _selectedDateTimeTo;

  setSelectedDateTimeFrom(DateTime dateTime){
    _selectedDateTimeTo =_selectedDateTimeTo!.add(dateTime.difference(_selectedDateTimeFrom!));
    _selectedDateTimeFrom=dateTime;

  }

  initialize(DateTime dateTime){
    setSelectedDateTimeTo(dateTime);
  }

  setSelectedDateTimeTo(DateTime dateTime){
    _selectedDateTimeTo=dateTime;
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

    ref.read(appointRequestProvider).setChatHeaderDocId(chatHeaderDocId);

    String requestDocId = await insertFirebaseRequests(
        userDocId:ref.watch(userDataProvider).userData["userDocId"],
        friendUserDocId:friendUserDocId,
        courseCodeListText:ref.watch(appointRequestProvider).courseCodeListText,
        categoryCodeListText:ref.watch(appointRequestProvider).categoryCodeListText,
        message:ref.watch(appointRequestProvider).message,
        programId:"createRequest"
    );

    await insertChatDetailsDataMessage(
        ref:ref,
        chatHeaderDocId:chatHeaderDocId,
        friendUserDocId:friendUserDocId,
        message:ref.watch(appointRequestProvider).message,
        messageType:"3",
        referDocId: requestDocId,
        programId: "createRequest");
  }
}

