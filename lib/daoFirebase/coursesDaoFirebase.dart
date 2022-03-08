
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

Future<void> insertCourseData(WidgetRef ref, String courseName,File imageFile,String programId,String userDocId) async {

  try {
    String insertedDocId = "";
    String pathStr= imageFile.path;

    FirebaseStorage storage = FirebaseStorage.instance;
    await FirebaseFirestore.instance.collection('courses').add(
      {
        'courseName': courseName,
        'photoNameSuffix':pathStr.substring(pathStr.lastIndexOf('.')),
        'photoUpdateCnt':0,
        'insertUserDocId':userDocId,
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': false,
        'deleteFlg': false,
      },
    ).then((value) {
      insertedDocId = value.id;
    });

    await storage
        .ref("courses/" +
        insertedDocId +
        pathStr.substring(
          pathStr.lastIndexOf('.'),
        ))
        .putFile(imageFile);

    await FirebaseFirestore.instance
        .collection('courses')
        .doc(insertedDocId)
        .update({
      'readableFlg': true,
      'photoUpdateCnt':1,
      'updateUserDocId':userDocId,
      'updateProgramId': programId,
      'updateTime': FieldValue.serverTimestamp(),
    });

  } catch (e) {
    log(e.toString());
  }
}
