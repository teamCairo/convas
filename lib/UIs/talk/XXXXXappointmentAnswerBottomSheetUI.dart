// import 'dart:developer';
//
// import 'package:convas/common/provider/masterProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// import '../../common/UI/commonButtonUI.dart';
// import '../../common/UI/commonTextUI.dart';
// import '../../common/logic/commonLogicDate.dart';
// import 'XXXXXappointmentAnswerLogic.dart';
// import 'XXXXXappointmentAnswerProvider.dart';
// import 'XXXXXappointmentAnswerTypeDialog.dart';
//
// void appointmentAnswerBottomSheet(
//     BuildContext context, CalendarTapDetails? calendarDetails, WidgetRef ref,String mode,String friendUserDocId,String? requestDocId, String? appointmentDocId) {
//   //mode:"1":登録、"2":修正・削除、"3":参照、
//   showModalBottomSheet(
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(0)),
//     ),
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, StateSetter setState) {
//           ref.read(appointmentAnswerProvider.notifier).initializeProvider( mode, requestDocId, calendarDetails, appointmentDocId,setState);
//           return
//             SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   commonButtonCloseForModal(context),
//                   ref.watch(appointmentAnswerProvider).editedDateTimeFrom==null?const SizedBox():dateTimeRow(ref, context, "from", setState),
//                   ref.watch(appointmentAnswerProvider).editedDateTimeTo==null?const SizedBox():dateTimeRow(ref, context, "to", setState),
//                   GestureDetector(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 36.0, right: 36, top:20,bottom:10),
//                         child: commonText16GrayLeft(getMasterName("course", ref.watch(appointmentAnswerProvider).courseCode, ref)
//                         ),
//                       ),
//                       onTap:()async{
//                         await Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) {
//                             return AppointmentAnswerTypeDialog();
//                           }),
//                         );
//                         setState(() {
//                         });
//                       }),
//                   GestureDetector(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 36.0, right: 36, top:20,bottom:10),
//                         child: commonText16GrayLeft(getMasterName("category", ref.watch(appointmentAnswerProvider).categoryCode, ref)
//                         ),
//                       ),
//                       onTap:()async{
//                         await Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) {
//                             return AppointmentAnswerTypeDialog();
//                           }),
//                         );
//                         setState(() {
//                         });
//                       }),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 14.0),
//                     child: commonButtonOrangeRound(
//                         text: mode == "1"
//                             ? "Send"
//                             : "Update",
//                         onPressed: () async {
//                           bool checkBool=await checkAppointmentData( context,  ref);
//                           if(checkBool){
//                             if (mode == "1") {
//                               await insertAppointment(ref, friendUserDocId);
//                             } else {
//                               // await updateAppointment(ref);
//                             }
//                             Navigator.of(context).pop();
//                           }
//                         }),
//                   )
//                 ],
//                 // ),
//               ),
//             );
//         },
//       );
//     },
//   );
// }
//
// Widget dateTimeRow(
//     WidgetRef ref, BuildContext context, String fromTo, StateSetter setState) {
//
//   DateTime dateTime = (fromTo == "from"
//       ? ref.watch(appointmentAnswerProvider).editedDateTimeFrom!
//       : ref.watch(appointmentAnswerProvider).editedDateTimeTo!);
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       GestureDetector(
//           child: commonText16GrayLeft(
//             fromDateToYearMonthDayText(dateTime),
//           ),
//           onTap: () async {
//             log("XXXXXXXタップした　日付");
//             final DateTime? d = await showDatePicker(
//               context: context,
//               initialDate: dateTime,
//               firstDate: DateTime(
//                   dateTime.add(const Duration(days: -30)).year,
//                   dateTime.add(const Duration(days: -30)).month,
//                   dateTime.add(const Duration(days: -30)).day),
//               lastDate: DateTime(
//                   dateTime.add(const Duration(days: 30)).year,
//                   dateTime.add(const Duration(days: 30)).month,
//                   dateTime.add(const Duration(days: 30)).day),
//             );
//             if (d != null) {
//               setState(() {
//                 if (fromTo == "from") {
//                   ref.read(appointmentAnswerProvider.notifier).setEditedDateTimeFrom(
//                       DateTime(d.year, d.month, d.day, dateTime.hour,
//                           dateTime.minute));
//                 } else {
//                   ref.read(appointmentAnswerProvider.notifier).setEditedDateTimeTo(
//                       DateTime(d.year, d.month, d.day, dateTime.hour,
//                           dateTime.minute));
//                 }
//               });
//             }
//           }),
//       GestureDetector(
//           child: commonText16GrayLeft(
//             fromDateToHourMinuteText(dateTime),
//           ),
//           onTap: () async {
//             log("XXXXXXXタップした　時間");
//             final TimeOfDay? t = await showTimePicker(
//               context: context,
//               initialTime:
//               TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
//             );
//             if (t != null) {
//               setState(() {
//                 if (fromTo == "from") {
//                   log("XXXXXXXFrom時間修正");
//                   ref.read(appointmentAnswerProvider.notifier).setEditedDateTimeFrom(
//                       DateTime(dateTime.year, dateTime.month, dateTime.day,
//                           t.hour, t.minute));
//                 } else {
//                   ref.read(appointmentAnswerProvider.notifier).setEditedDateTimeTo(
//                       DateTime(dateTime.year, dateTime.month, dateTime.day,
//                           t.hour, t.minute));
//                 }
//               });
//             }
//           }),
//     ]),
//   );
// }
