// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../daoIsar/chatDetailDaoIsar.dart';
// import '../../entityIsar/chatDetailEntityIsar.dart';
//
// class ChatPageNotifier extends ChangeNotifier {
//
//   List<ChatDetail> _chatDetailsList=[];
//   List<ChatDetail> get chatDetailsList=>_chatDetailsList;
//
//   Future<void> initialize(WidgetRef ref,String chatHeaderDocId)async{
//     _chatDetailsList=[];
//     List<ChatDetail>? tmpList = await selectIsarChatDetailByChatHeaderDocId(chatHeaderDocId);
//     if(tmpList==null){
//
//     }else{
//       _chatDetailsList.addAll(tmpList);
//     }
//     notifyListeners();
//   }
//
// }
//
// final chatPageProvider = ChangeNotifierProvider(
//         (ref) => ChatPageNotifier());
//
