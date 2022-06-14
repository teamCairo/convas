// import 'package:convas/common/commonValues.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// import '../../common/UI/commonButtonUI.dart';
// import '../../common/UI/commonOthersUI.dart';
// import '../../common/UI/commonTextFormUI.dart';
// import '../../common/UI/commonTextUI.dart';
// import '../../common/logic/commonLogicDate.dart';
// import 'friendProfileProvider.dart';
// import 'XXXXlessonRequestProvider.dart';
//
// class FriendProfileLessonRequest extends ConsumerWidget {
//   FriendProfileLessonRequest({
//     required this.argumentFriendUserDocId,
//     required this.argumentFriendUserName,
//     required this.calendarDetails,
//     Key? key,
//   }) : super(key: key);
//   final String argumentFriendUserDocId;
//   final String argumentFriendUserName;
//   final CalendarTapDetails calendarDetails;
//   bool initialProcessFlg = true;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     if (initialProcessFlg) {
//       initialProcessFlg = false;
//       ref
//           .read(lessonRequestProvider.notifier)
//           .initialize(calendarDetails.date!);
//     }
//     return commonScaffoldScroll(context, ref, MainAxisAlignment.start, [
//       Row(
//         mainAxisAlignment:MainAxisAlignment.spaceEvenly,
//         children: [
//           commonCircleAvatarImage(
//               radius: 70,
//               image: ref
//                   .watch(friendProfileDataProvider)
//                   .friendProfilePhotoData,
//               name:argumentFriendUserName),
//           commonText24BlackBoldLeft(argumentFriendUserName),
//         ],
//       ),
//       const SizedBox(height:20),
//
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(width:65,
//     child: Icon(Icons.access_time_outlined, color:  commonColorSecondary)),
//           Column(
//             children: [
//               requestDateTimeRow(ref, context, "from"),
//               commonVerticalGap(),
//               requestDateTimeRow(ref, context, "to"),
//             ],
//           ),
//         ],
//       ),
//       const SizedBox(height:20),
//       // commonText24BlackBoldLeft("Request message"),
//       // commonVerticalGap(),
//
//       commonTextBoxBordered(
//         text: "Request message",
//         initialValue: ref.watch(lessonRequestProvider).message,
//         onChanged: (String value) {
//           ref.read(lessonRequestProvider.notifier).setMessage(value);
//         },
//         maxLines: 20,
//         minLines: 7,
//       ),
//
//       commonVerticalGap(),
//       commonButtonSecondaryColorRound(
//           text: "Send Request",
//           onPressed: () async {
//             await ref
//                 .read(lessonRequestProvider.notifier)
//                 .sendRequest(argumentFriendUserDocId, ref);
//             await commonShowOkInfoDialog(context, "Please wait for a while","Request has been sent!!\nTeacher will respond!!");
//             Navigator.of(context).pop();
//           },),
//     ],
//         appBar:commonAppbar("Lesson request",helpTitle:"Tap times and adjust to time when you like",helpText: "You can set available time then learners find you",contextForHelp: context));
//   }
// }
//
// Widget requestDateTimeRow(WidgetRef ref, BuildContext context, String fromTo) {
//   DateTime dateTime = (fromTo == "from"
//       ? ref.watch(lessonRequestProvider).selectedDateTimeFrom!
//       : ref.watch(lessonRequestProvider).selectedDateTimeTo!);
//   return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//     GestureDetector(
//         child: commonText16BlackLeft(
//           fromDateToYearMonthDayText(dateTime),
//         ),
//         onTap: () async {
//           final DateTime? d = await showDatePicker(
//             context: context,
//             initialDate: dateTime,
//             firstDate: DateTime(
//                 dateTime.add(const Duration(days: -30)).year,
//                 dateTime.add(const Duration(days: -30)).month,
//                 dateTime.add(const Duration(days: -30)).day),
//             lastDate: DateTime(
//                 dateTime.add(const Duration(days: 30)).year,
//                 dateTime.add(const Duration(days: 30)).month,
//                 dateTime.add(const Duration(days: 30)).day),
//           );
//           if (d != null) {
//             if (fromTo == "from") {
//               ref.read(lessonRequestProvider.notifier).setSelectedDateTimeFrom(
//                   DateTime(d.year, d.month, d.day, dateTime.hour,
//                       dateTime.minute));
//             } else {
//               ref.read(lessonRequestProvider.notifier).setSelectedDateTimeTo(
//                   DateTime(d.year, d.month, d.day, dateTime.hour,
//                       dateTime.minute));
//             }
//           }
//         }),
//     const SizedBox(width: 60),
//     GestureDetector(
//         child: commonText16BlackLeft(
//           fromDateToHourMinuteText(dateTime),
//         ),
//         onTap: () async {
//           final TimeOfDay? t = await showTimePicker(
//             context: context,
//             initialTime:
//                 TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
//           );
//
//           if (t != null) {
//             if (fromTo == "from") {
//               ref.read(lessonRequestProvider.notifier).setSelectedDateTimeFrom(
//                           DateTime(dateTime.year, dateTime.month, dateTime.day,
//                               t.hour, t.minute));
//             } else {
//               ref.read(lessonRequestProvider.notifier).setSelectedDateTimeTo(
//                           DateTime(dateTime.year, dateTime.month, dateTime.day,
//                               t.hour, t.minute));
//             }
//           }
//         }),
//   ]);
// }
