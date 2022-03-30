
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> insertFirebaseRequests({
  required String userDocId,
  required String friendUserDocId,
  required String courseCodeListText,
  required String categoryCodeListText,
  required String message,
  required String programId
}) async {

  String insertedDocId="";
  await FirebaseFirestore.instance.collection('requests').add(
      {
        'senderDocId':userDocId,
        'receiverUserDocId':friendUserDocId,
        'courseCodeListText':courseCodeListText,
        'categoryCodeListText':categoryCodeListText,
        'message':message,
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

Future<void> updateFirebaseRequests({
  required String requestDocId,
  required String userDocId,
  required String friendUserDocId,
  required String courseCodeListText,
  required String categoryCodeListText,
  required String message,
  required String programId
}) async {
  await FirebaseFirestore.instance.collection('requests').
  doc(requestDocId).
  update({
        'senderDocId':userDocId,
        'receiverUserDocId':friendUserDocId,
        'courseCodeListText':courseCodeListText,
        'categoryCodeListText':categoryCodeListText,
        'message':message,
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      });

}