
import 'package:cloud_firestore/cloud_firestore.dart';

import '../common/otherClass/commonClassRequest.dart';

Future<CommonClassRequest> selectFirebaseRequestById(String requestDocId)async{
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('requests')
      .doc(requestDocId)
      .get();

  return CommonClassRequest(
    snapshot.id,
    snapshot.get("senderUserDocId"),
    snapshot.get("receiverUserDocId"),
    snapshot.get("courseCodeListText"),
    snapshot.get("categoryCodeListText"),
    snapshot.get("from").toDate(),
    snapshot.get("to").toDate(),
    snapshot.get("status"),
    snapshot.get("message"),
    snapshot.get("insertUserDocId"),
    snapshot.get("insertProgramId"),
    snapshot.get("insertTime").toDate(),
    snapshot.get("updateUserDocId"),
    snapshot.get("updateProgramId"),
    snapshot.get("updateTime").toDate(),
    snapshot.get("readableFlg"),
    snapshot.get("deleteFlg"),
  );
}


Future<List<CommonClassRequest>> selectFirebaseRequestByUserDocIdStatus(String userDocId, String status)async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('requests')
      .where('receiverUserDocId', isEqualTo: userDocId)
      .where('status', isEqualTo: status)
      .orderBy('insertTime',descending: true)
      // .limit(9999)
      .get();

  List<CommonClassRequest> returnList=[];

  if(snapshot.size==0){
    return returnList;
  }else{
    for(int i =0;i<snapshot.size;i++){
      returnList.add(CommonClassRequest(
        snapshot.docs[i].id,
        snapshot.docs[i].get("senderUserDocId"),
        snapshot.docs[i].get("receiverUserDocId"),
        snapshot.docs[i].get("courseCodeListText"),
        snapshot.docs[i].get("categoryCodeListText"),
        snapshot.docs[i].get("from").toDate(),
        snapshot.docs[i].get("to").toDate(),
        snapshot.docs[i].get("status"),
        snapshot.docs[i].get("message"),
        snapshot.docs[i].get("insertUserDocId"),
        snapshot.docs[i].get("insertProgramId"),
        snapshot.docs[i].get("insertTime").toDate(),
        snapshot.docs[i].get("updateUserDocId"),
        snapshot.docs[i].get("updateProgramId"),
        snapshot.docs[i].get("updateTime").toDate(),
        snapshot.docs[i].get("readableFlg"),
        snapshot.docs[i].get("deleteFlg"),
      ));
    }
  }

  return returnList;
}


Future<String> insertFirebaseRequests({
  required String userDocId,
  required String friendUserDocId,
  required String courseCodeListText,
  required String categoryCodeListText,
  required DateTime from,
  required DateTime to,
  required String message,
  required String programId
}) async {

  String insertedDocId="";
  await FirebaseFirestore.instance.collection('requests').add(
      {
        'senderUserDocId':userDocId,
        'receiverUserDocId':friendUserDocId,
        'courseCodeListText':courseCodeListText,
        'categoryCodeListText':categoryCodeListText,
        'from':Timestamp.fromDate(from),
        'to':Timestamp.fromDate(to),
        'status':"1",
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

Future<void> updateFirebaseRequestsStatus(
  String requestDocId,
  String status,
  String programId
) async {
  await FirebaseFirestore.instance.collection('requests').
  doc(requestDocId).
  update({
    'status':status,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
    'readableFlg': true,
    'deleteFlg': false,
  });
}

Future<void> updateFirebaseRequests({
  required String requestDocId,
  required String userDocId,
  required String friendUserDocId,
  required String courseCodeListText,
  required String categoryCodeListText,
  required DateTime from,
  required DateTime to,
  required String message,
  required String programId
}) async {
  await FirebaseFirestore.instance.collection('requests').
  doc(requestDocId).
  update({
        'senderUserDocId':userDocId,
        'receiverUserDocId':friendUserDocId,
        'courseCodeListText':courseCodeListText,
        'categoryCodeListText':categoryCodeListText,
        'from':Timestamp.fromDate(from),
        'to':Timestamp.fromDate(to),
        'message':message,
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      });

}