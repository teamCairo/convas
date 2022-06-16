import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/otherClass/commonClassRequest.dart';
import 'package:convas/daoFirebase/requestsDaoFirebase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/otherClass/commonClassAppointment.dart';
import '../common/provider/userProvider.dart';

Future<List<CommonClassAppointment>> selectFirebaseAppointmentResultByUserDocId(
    String userDocId) async {
  List<CommonClassAppointment> returnList = [];

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('receiverUserDocId', isEqualTo: userDocId)
      .where('status', isEqualTo: "4")
      // .orderBy('insertTime', descending: true)
      // .limit(9999)
      .get();

  if (snapshot.size == 0) {
  } else {
    for (int i = 0; i < snapshot.size; i++) {
      returnList.add(CommonClassAppointment(
        snapshot.docs[i].id,
        snapshot.docs[i].get("senderUserDocId"),
        snapshot.docs[i].get("receiverUserDocId"),
        snapshot.docs[i].get("courseCode"),
        snapshot.docs[i].get("categoryCode"),
        snapshot.docs[i].get("fromTime").toDate(),
        snapshot.docs[i].get("toTime").toDate(),
        snapshot.docs[i].get("requestMessage"),
        snapshot.docs[i].get("message"),
        snapshot.docs[i].get("status"),
        snapshot.docs[i].get("senderJoinedStatus"),
        snapshot.docs[i].get("receiverJoinedStatus"),
        snapshot.docs[i].get("requestDocId"),
        snapshot.docs[i].get("startTime"),
        snapshot.docs[i].get("doneTime"),
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

  snapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('senderUserDocId', isEqualTo: userDocId)
      .where('status', isEqualTo: "4")
      // .orderBy('insertTime', descending: true)
      // .limit(9999)
      .get();

  if (snapshot.size == 0) {
  } else {
    for (int i = 0; i < snapshot.size; i++) {
      returnList.add(CommonClassAppointment(
        snapshot.docs[i].id,
        snapshot.docs[i].get("senderUserDocId"),
        snapshot.docs[i].get("receiverUserDocId"),
        snapshot.docs[i].get("courseCode"),
        snapshot.docs[i].get("categoryCode"),
        snapshot.docs[i].get("fromTime").toDate(),
        snapshot.docs[i].get("toTime").toDate(),
        snapshot.docs[i].get("requestMessage"),
        snapshot.docs[i].get("message"),
        snapshot.docs[i].get("status"),
        snapshot.docs[i].get("senderJoinedStatus"),
        snapshot.docs[i].get("receiverJoinedStatus"),
        snapshot.docs[i].get("requestDocId"),
        snapshot.docs[i].get("startTime"),
        snapshot.docs[i].get("doneTime"),
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
  returnList.sort((a, b) => a.insertTime.compareTo(b.insertTime));
  return returnList;
}

Future<List<CommonClassAppointment>> selectFirebaseAppointmentByUserDocIdPlan(
    String userDocId) async {
  List<CommonClassAppointment> returnList = [];

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('receiverUserDocId', isEqualTo: userDocId)
      .where('status', whereIn: ["1", "2", "3"])
      // .orderBy('insertTime',descending: true)
      // .limit(9999)
      .get();

  if (snapshot.size == 0) {
  } else {
    for (int i = 0; i < snapshot.size; i++) {
      returnList.add(CommonClassAppointment(
        snapshot.docs[i].id,
        snapshot.docs[i].get("senderUserDocId"),
        snapshot.docs[i].get("receiverUserDocId"),
        snapshot.docs[i].get("courseCode"),
        snapshot.docs[i].get("categoryCode"),
        snapshot.docs[i].get("fromTime").toDate(),
        snapshot.docs[i].get("toTime").toDate(),
        snapshot.docs[i].get("requestMessage"),
        snapshot.docs[i].get("message"),
        snapshot.docs[i].get("status"),
        snapshot.docs[i].get("senderJoinedStatus"),
        snapshot.docs[i].get("receiverJoinedStatus"),
        snapshot.docs[i].get("requestDocId"),
        snapshot.docs[i].get("startTime"),
        snapshot.docs[i].get("doneTime"),
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

  snapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('senderUserDocId', isEqualTo: userDocId)
      .where('status', whereIn: ["1", "2", "3"])
      // .orderBy('insertTime',descending: true)
      // .limit(9999)
      .get();

  if (snapshot.size == 0) {
  } else {
    for (int i = 0; i < snapshot.size; i++) {
      returnList.add(CommonClassAppointment(
        snapshot.docs[i].id,
        snapshot.docs[i].get("senderUserDocId"),
        snapshot.docs[i].get("receiverUserDocId"),
        snapshot.docs[i].get("courseCode"),
        snapshot.docs[i].get("categoryCode"),
        snapshot.docs[i].get("fromTime").toDate(),
        snapshot.docs[i].get("toTime").toDate(),
        snapshot.docs[i].get("requestMessage"),
        snapshot.docs[i].get("message"),
        snapshot.docs[i].get("status"),
        snapshot.docs[i].get("senderJoinedStatus"),
        snapshot.docs[i].get("receiverJoinedStatus"),
        snapshot.docs[i].get("requestDocId"),
        snapshot.docs[i].get("startTime"),
        snapshot.docs[i].get("doneTime"),
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

  returnList.sort((a, b) => a.insertTime.compareTo(b.insertTime));
  return returnList;
}

Future<CommonClassAppointment> selectFirebaseAppointmentByAppointmentDocId(
    String appointmentDocId) async {
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .doc(appointmentDocId)
      .get();

  return CommonClassAppointment(
      snapshot.id,
      snapshot.get('senderUserDocId'),
      snapshot.get('receiverUserDocId'),
      snapshot.get('courseCode'),
      snapshot.get('categoryCode'),
      snapshot.get('fromTime').toDate(),
      snapshot.get('toTime').toDate(),
      snapshot.get("requestMessage"),
      snapshot.get("message"),
      snapshot.get("status"),
      snapshot.get("senderJoinedStatus"),
      snapshot.get("receiverJoinedStatus"),
      snapshot.get("requestDocId"),
      snapshot.get("startTime"),
      snapshot.get("doneTime"),
      snapshot.get('insertUserDocId'),
      snapshot.get('insertProgramId'),
      snapshot.get('insertTime').toDate(),
      snapshot.get('updateUserDocId'),
      snapshot.get('updateProgramId'),
      snapshot.get('updateTime').toDate(),
      snapshot.get('readableFlg'),
      snapshot.get('deleteFlg'));
}

Future<String> insertFirebaseAppointmentsFromRequest(String requestDocId,
    String message, String userDocId, String programId) async {
  CommonClassRequest request = await selectFirebaseRequestById(requestDocId);

  String insertedDocId = "";
  await FirebaseFirestore.instance.collection('appointments').add({
    'senderUserDocId': userDocId,
    'receiverUserDocId': request.senderUserDocId,
    'courseCode': "",
    'categoryCode': "",
    'fromTime': Timestamp.fromDate(request.from),
    'toTime': Timestamp.fromDate(request.to),
    'requestMessage': request.message,
    'message': message,
    'status': "1",
    'senderJoinedStatus': "0",
    'receiverJoinedStatus': "0",
    'requestDocId': requestDocId,
    'startTime': null,
    'doneTime': null,
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

Future<void> updateAppointmentJoinedUser(
    WidgetRef ref, String appointmentDocId, String programId) async {
  String userDocId =
      ref.watch(userDataProvider.notifier).userData["userDocId"]!;

  CommonClassAppointment appointment =
      await selectFirebaseAppointmentByAppointmentDocId(appointmentDocId);

  Map<String, dynamic> updateMap = {
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  };

  if (appointment.senderUserDocId == userDocId) {
    if (appointment.receiverJoinedStatus == "1") {
      updateMap.addAll({
        "senderJoinedStatus": "1",
        "status": "3",
        'startTime': FieldValue.serverTimestamp(),
      });
    } else {
      updateMap.addAll({
        "senderJoinedStatus": "1",
        "status": "2",
      });
    }
  } else if (appointment.receiverUserDocId == userDocId) {
    if (appointment.senderJoinedStatus == "1") {
      updateMap.addAll({
        "receiverJoinedStatus": "1",
        "status": "3",
        'startTime': FieldValue.serverTimestamp(),
      });
    } else {
      updateMap.addAll({
        "receiverJoinedStatus": "1",
        "status": "2",
      });
    }
  }

  await FirebaseFirestore.instance
      .collection('appointments')
      .doc(appointmentDocId)
      .update(updateMap);
}

Future<void> updateAppointmentDoneCall(
    WidgetRef ref, String appointmentDocId, String programId) async {
  String userDocId =
      ref.watch(userDataProvider.notifier).userData["userDocId"]!;

  await FirebaseFirestore.instance
      .collection('appointments')
      .doc(appointmentDocId)
      .update({
    "status": "4",
    'doneTime': FieldValue.serverTimestamp(),
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
}
