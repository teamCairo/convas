// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../common/provider/userProvider.dart';
// import '../../daoFirebase/chatDetailsDaoFirebase.dart';
// import '../../daoFirebase/friendsDaoFirebase.dart';
// import '../../daoFirebase/requestsDaoFirebase.dart';
// import '../../daoIsar/friendDaoIsar.dart';
// import '../../entityIsar/friendEntityIsar.dart';
// import '../talk/appointmentRequestProvider.dart';
//
// final lessonRequestProvider = ChangeNotifierProvider(
//       (ref) => LessonRequestNotifier(),
// );
// class LessonRequestNotifier extends ChangeNotifier {
//
//
//   DateTime? _selectedDateTimeFrom ;
//   DateTime? _selectedDateTimeTo ;
//   String _message="";
//
//   DateTime? get selectedDateTimeFrom=> _selectedDateTimeFrom;
//   DateTime? get selectedDateTimeTo=> _selectedDateTimeTo;
//   String? get message=> _message;
//
//   setSelectedDateTimeFrom(DateTime dateTime){
//     _selectedDateTimeTo =_selectedDateTimeTo!.add(dateTime.difference(_selectedDateTimeFrom!));
//     _selectedDateTimeFrom=dateTime;
//     notifyListeners();
//   }
//
//   initialize(DateTime dateTime){
//     _selectedDateTimeFrom=dateTime;
//     _selectedDateTimeTo=dateTime.add(const Duration(minutes:30));
//     _message="";
//   }
//
//   setMessage(String message){
//     _message=message;
//     notifyListeners();
//   }
//
//   setSelectedDateTimeTo(DateTime dateTime){
//     _selectedDateTimeTo=dateTime;
//     notifyListeners();
//   }
//
//
//   Future<void> sendRequest(String friendUserDocId,WidgetRef ref)async {
//
//     String chatHeaderDocId="";
//     //Friendかどうかをチェック
//     Friend? checkFriend = await selectIsarFriendById(friendUserDocId);
//     if(checkFriend==null){
//       chatHeaderDocId = await insertFriendsData(ref,friendUserDocId,"createRequest");
//     }else{
//       chatHeaderDocId = checkFriend.chatHeaderId;
//     }
//
//     // ref.read(appointRequestProvider).setChatHeaderDocId(chatHeaderDocId);
//
//     String requestDocId = await insertFirebaseRequests(
//         userDocId:ref.watch(userDataProvider).userData["userDocId"],
//         friendUserDocId:friendUserDocId,
//         courseCodeListText:"",
//         categoryCodeListText:"",
//         from:_selectedDateTimeFrom!,
//         to:_selectedDateTimeTo!,
//         message:_message,
//         programId:"createRequest"
//     );
//
//     await insertChatDetailsDataMessage(
//         ref:ref,
//         chatHeaderDocId:chatHeaderDocId,
//         friendUserDocId:friendUserDocId,
//         message:_message,
//         messageType:"3",
//         referDocId: requestDocId,
//         programId: "createRequest");
//   }
// }
//
