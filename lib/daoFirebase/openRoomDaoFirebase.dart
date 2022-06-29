import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/userProvider.dart';


Future<String> insertOpenRoom(
    {required WidgetRef ref,
      required String roomName,
      required String categoryDocId,
      required String topicDocId,
      required String description,
      required DateTime? endDateTime,
      required String programId}) async {
  try {
    String insertedDocId = "";

    await FirebaseFirestore.instance.collection('openRooms').add(
      {
        'createUserDocId':ref.watch(userDataProvider).userData["userDocId"],
        'roomName':roomName,
        'categoryDocId':categoryDocId,
        'topicDocId':topicDocId,
        'description':description,
        'startDateTime':FieldValue.serverTimestamp(),
        'endDateTime':endDateTime,
        'joinUserNumber':0,
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

Future<QuerySnapshot> selectFirebaseOpenRoomSortByCreateDate()async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('openRooms')
      .orderBy('startDateTime')
      .get();

  return snapshot;
}