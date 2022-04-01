import 'package:cloud_firestore/cloud_firestore.dart';

import '../common/otherClass/commonClassAppointment.dart';

Future<CommonAppointment> selectFirebaseAppointmentByAppointmentDocId(
    String appointmentDocId) async {
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .doc(appointmentDocId)
      .get();

  return CommonAppointment(
      snapshot.id,
      snapshot.get('senderUserDocId'),
      snapshot.get('receiverUserDocId'),
      snapshot.get('courseCode'),
      snapshot.get('categoryCode'),
      snapshot.get('fromTime').toDate(),
      snapshot.get('toTime').toDate(),
      snapshot.get('message'),
      snapshot.get('insertUserDocId'),
      snapshot.get('insertProgramId'),
      snapshot.get('insertTime').toDate(),
      snapshot.get('updateUserDocId'),
      snapshot.get('updateProgramId'),
      snapshot.get('updateTime').toDate(),
      snapshot.get('readableFlg'),
      snapshot.get('deleteFlg'));
}

Future<String> insertFirebaseAppointments(
    {required String userDocId,
    required String friendUserDocId,
    required String courseCode,
    required String categoryCode,
    required DateTime fromTime,
    required DateTime toTime,
    required String message,
    required String programId}) async {
  String insertedDocId = "";
  await FirebaseFirestore.instance.collection('appointments').add({
    'senderUserDocId': userDocId,
    'receiverUserDocId': friendUserDocId,
    'courseCode': courseCode,
    'categoryCode': categoryCode,
    'fromTime':fromTime,
    'toTime':toTime,
    'message': message,
    'insertUserDocId': userDocId,
    'insertProgramId': programId,
    'insertTime': FieldValue.serverTimestamp(),
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
    'readableFlg': true,
    'deleteFlg': false,
  }).then((value) {
    insertedDocId = value.id;
  });

  return insertedDocId;
}

Future<void> updateFirebaseAppointments(
    {required String requestDocId,
    required String userDocId,
    required String friendUserDocId,
    required String courseCode,
    required String categoryCode,
      required DateTime fromTime,
      required DateTime toTime,
    required String message,
    required String programId}) async {
  await FirebaseFirestore.instance
      .collection('appointments')
      .doc(requestDocId)
      .update({
    'senderUserDocId': userDocId,
    'receiverUserDocId': friendUserDocId,
    'courseCode': courseCode,
    'categoryCode': categoryCode,
    'fromTime':fromTime,
    'toTime':toTime,
    'message': message,
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
    'readableFlg': true,
    'deleteFlg': false,
  });
}
