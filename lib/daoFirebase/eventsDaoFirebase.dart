import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/daoFirebase/usersDaoFirebase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/userProvider.dart';

Future<String> insertEventData(
    {required WidgetRef ref,
    required String eventName,
    required String eventType,
    required String friendUserDocId,
    required String callChannelId,
    required DateTime fromTime,
    required DateTime toTime,
    required bool isAllDay,
    required String programId}) async {
  try {

    String friendName = "";

    if (friendUserDocId != "") {
      DocumentSnapshot friendUserData =
      await selectFirebaseUserByUserDocId(friendUserDocId);
      friendName = friendUserData.get("name");
    }
    String insertedDocId = "";
    await FirebaseFirestore.instance.collection('events').add(
      {
        'userDocId': ref.watch(userDataProvider).userData["userDocId"],
        'eventName': eventName,
        'eventType': eventType,
        'friendUserDocId': friendUserDocId,
        'friendUserName': friendName,
        'callChannelId': callChannelId,
        'fromTime': fromTime,
        'toTime': toTime,
        'isAllDay': isAllDay,
        'insertUserDocId': ref.watch(userDataProvider).userData["userDocId"],
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId': ref.watch(userDataProvider).userData["userDocId"],
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      },
    ).then((value) {
      insertedDocId = value.id;
    });

    return insertedDocId;
  } catch (e) {
    log(e.toString());
    return "";
  }
}



Future<void> updateEventData(
    {required WidgetRef ref,
      required String eventDocId,
      required String eventName,
      required String eventType,
      required String friendUserDocId,
      required String callChannelId,
      required DateTime fromTime,
      required DateTime toTime,
      required bool isAllDay,
      required String programId}) async {
  try {

    String friendName = "";

    if (friendUserDocId != "") {
      DocumentSnapshot friendUserData =
      await selectFirebaseUserByUserDocId(friendUserDocId);
      friendName = friendUserData.get("name");
    }

    await FirebaseFirestore.instance
        .collection('events')
        .doc(eventDocId)
        .update({
      'eventName': eventName,
      'eventType': eventType,
      'friendUserDocId': friendUserDocId,
      'friendUserName': friendName,
      'callChannelId': callChannelId,
      'fromTime': Timestamp.fromDate(fromTime),
      'toTime': Timestamp.fromDate(toTime),
      'isAllDay':isAllDay,
      'updateUserDocId': ref.watch(userDataProvider).userData["userDocId"],
      'updateProgramId': programId,
      'updateTime': FieldValue.serverTimestamp(),
    });
  } catch (e) {
    log(e.toString());
  }
}



Future<void> logicalDeleteEventData(String eventDocId,String userDocId,String programId) async {

  await FirebaseFirestore.instance
      .collection('events')
      .doc(eventDocId)
      .update({
    "deleteFlg": true,
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });

}