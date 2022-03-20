import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> insertFirebaseChatHeader(
  String userDocId,
  String  programId
) async {

  String insertedDocId="";
  await FirebaseFirestore.instance.collection('chatHeaders').add(
      {
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