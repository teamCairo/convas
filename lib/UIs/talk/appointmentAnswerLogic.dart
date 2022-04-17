import 'package:convas/UIs/talk/appointmentAnswerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/commonValues.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/appointmentsDaoFirebase.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';
import '../../daoIsar/friendDaoIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';

Future<bool> checkAppointmentData(BuildContext context, WidgetRef ref) async{

if(ref.watch(appointmentAnswerProvider).editedDateTimeFrom!.isAfter(ref.watch(appointmentAnswerProvider).editedDateTimeTo!)) {
  await commonShowOkWarningDialog(context, "End time is earlier than start time");
  return false;
}
  return true;

}


Future<void> updateAppointment(WidgetRef ref, String friendUserDocId) async {
}

Future<void> insertAppointment(WidgetRef ref, String friendUserDocId) async {
  String appointmentDocId= await insertFirebaseAppointments(
    userDocId:ref.watch(userDataProvider).userData["userDocId"],
    friendUserDocId:friendUserDocId,
    courseCode:ref.watch(appointmentAnswerProvider).courseCode,
    categoryCode:ref.watch(appointmentAnswerProvider).categoryCode,
    fromTime: ref.watch(appointmentAnswerProvider).editedDateTimeFrom!,
    toTime: ref.watch(appointmentAnswerProvider).editedDateTimeTo!,
    message:ref.watch(appointmentAnswerProvider).message,
    programId:"appointmentAnswer"
  );

  await insertEventData(ref:ref,
        userDocId:ref.watch(userDataProvider).userData["userDocId"],
        eventName:eventNameForAppointment,
        eventType:"5",
        friendUserDocId:friendUserDocId,
        callChannelId:appointmentDocId,
        fromTime:ref.watch(appointmentAnswerProvider).editedDateTimeFrom!,
        toTime:ref.watch(appointmentAnswerProvider).editedDateTimeTo!,
        description:"",
        programId:"appointmentAnswer");


  await insertEventData(ref:ref,
      userDocId:friendUserDocId,
      eventName:eventNameForAppointment,
      eventType:"6",
      friendUserDocId:ref.watch(userDataProvider).userData["userDocId"],
      callChannelId:appointmentDocId,
      fromTime:ref.watch(appointmentAnswerProvider).editedDateTimeFrom!,
      toTime:ref.watch(appointmentAnswerProvider).editedDateTimeTo!,
      description:"",
      programId:"appointmentAnswer");

  Friend friendTmp=(await selectIsarFriendById(friendUserDocId))!;

  await insertChatDetailsDataMessage(
      ref:ref,
      chatHeaderDocId:friendTmp.chatHeaderId,
      friendUserDocId:friendUserDocId,
      message:ref.watch(appointmentAnswerProvider).message,
      messageType:"4",
      referDocId: appointmentDocId,
      programId: "appointmentAnswer");

}