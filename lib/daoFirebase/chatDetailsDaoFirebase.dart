import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<String> insertChatDetailsDataMessage(
    {required WidgetRef ref,
    required String chatHeaderDocId,
    required String friendUserDocId,
    required String message,
    required String programId}) async{

  //相手側データ
  await insertFirebaseChatDetails(
      chatHeaderDocId:chatHeaderDocId,
      senderDocId:ref.watch(userDataProvider).userData["userDocId"],
      receiverDocId:friendUserDocId,
      ownerUserDocId:friendUserDocId,
      messageType:"2",
      fileNameSuffix:"",
      referDocId:"",
      message:message,
      userDocId:ref.watch(userDataProvider).userData["userDocId"],
      programId:programId
  );

  //自分側データ
  return await insertFirebaseChatDetails(
      chatHeaderDocId:chatHeaderDocId,
      senderDocId:ref.watch(userDataProvider).userData["userDocId"],
      receiverDocId:friendUserDocId,
      ownerUserDocId:ref.watch(userDataProvider).userData["userDocId"],
      messageType:"2",
      fileNameSuffix:"",
      referDocId:"",
      message:message,
      userDocId:ref.watch(userDataProvider).userData["userDocId"],
      programId:programId
  );

  //TODO 通知処理

}
Future<String> insertFirebaseChatDetails({
  required String chatHeaderDocId,
  required String senderDocId,
  required String receiverDocId,
  required String ownerUserDocId,
  required String messageType,
  required String fileNameSuffix,
  required String referDocId,
  required String message,
  required String userDocId,
  required String programId
}) async {

  String insertedDocId="";
  await FirebaseFirestore.instance.collection('chatDetails').add(
      {
        'chatHeaderDocId':chatHeaderDocId,
        'senderUserDocId':senderDocId,
        'receiverUserDocId':receiverDocId,
        'userDocId':ownerUserDocId,
        'messageType':messageType,
        'fileNameSuffix':fileNameSuffix,
        'referDocId':referDocId,
        'message':message,
        'sendTime': FieldValue.serverTimestamp(),
        'insertUserDocId':userDocId,
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      }).then((value){
    insertedDocId=value.id;
  });

  return insertedDocId;
}