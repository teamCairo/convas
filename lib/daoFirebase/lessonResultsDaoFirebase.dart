// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../common/otherClass/commonClassAppointment.dart';
// import '../common/provider/userProvider.dart';
// import 'appointmentsDaoFirebase.dart';
//
// Future<DocumentSnapshot?> selectFirebaseCallResultByUserDocIdAndDate(
//     WidgetRef ref, DateTime startTime) async {
//   QuerySnapshot snapshot = await FirebaseFirestore.instance
//       .collection('lessonResults')
//       .where('userDocId', isEqualTo: ref.watch(userDataProvider).userData["userDocId"])
//       .where('startDate', isEqualTo:Timestamp.fromDate(DateTime(startTime.year,startTime.month,startTime.day)))
//       .get();
//
//   if(snapshot.size>0){
//     return snapshot.docs[0];
//
//   }else{
//     return null;
//
//   }
// }
//
// Future<void> InsertOrupdateCallResult(
//     WidgetRef ref, String appointmentDocId, String programId) async {
//   String userDocId =
//   ref.watch(userDataProvider.notifier).userData["userDocId"]!;
//
//   CommonClassAppointment appointment =
//   await selectFirebaseAppointmentByAppointmentDocId(appointmentDocId);
//
//   DateTime startDate =DateTime(appointment.startTime.year,appointment.startTime.month,appointment.startTime.day);
//   DocumentSnapshot? lessonResult =await selectFirebaseCallResultByUserDocIdAndDate(ref,startDate);
//
//   if(lessonResult==null){
//     //insert処理
//   }else{
//     //update
//   }
// }
//
// Future<void> updateLessonResult(
//     WidgetRef ref, String appointmentDocId, String programId) async {
//   String userDocId =
//   ref.watch(userDataProvider.notifier).userData["userDocId"]!;
//
//   await FirebaseFirestore.instance
//       .collection('appointments')
//       .doc(appointmentDocId)
//       .update({
//     "status": "4",
//     'doneTime': FieldValue.serverTimestamp(),
//     'updateUserDocId': userDocId,
//     'updateProgramId': programId,
//     'updateTime': FieldValue.serverTimestamp(),
//   });
// }
