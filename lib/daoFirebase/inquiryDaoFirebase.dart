import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/userProvider.dart';


Future<String> insertInquiryData(
    {required WidgetRef ref,
      required String inquiryType,
      required String inquiryCategory,
      required String freeText,
      required String reportedUserDocId,
      required String programId}) async {
  try {
    String insertedDocId = "";

    await FirebaseFirestore.instance.collection('inquiries').add(
      {
        'inquiryType':inquiryType,
        'inquiryCategory':inquiryCategory,
        'reportedUserDocId':reportedUserDocId,
        'freeText':freeText,
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