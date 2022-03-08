import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

Future<void> insertFirebaseTopic(WidgetRef ref,String topicName,String categoryDocId,File file,String userDocId,String programId) async {

  String insertedDocId="";
  try {

    FirebaseStorage storage =FirebaseStorage.instance;
    String pathStr= file.path;

    var firebaseUserData = await FirebaseFirestore.instance
        .collection('categories')
        .doc(categoryDocId)
        .get();

    await FirebaseFirestore.instance.collection('topics').add(
      {'categoryDocId':categoryDocId ,
        'categoryName':firebaseUserData.get("categoryName"),
        'photoNameSuffix':pathStr.substring(pathStr.lastIndexOf('.')),
        'photoUpdateCnt':0,
        'topicName':topicName,
        'insertUserDocId':userDocId,
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': false,
        'deleteFlg': false,

      },
    ).then((value){
      insertedDocId=value.id;
    });

    await storage.ref("topics/" + insertedDocId + pathStr.substring(pathStr.lastIndexOf('.'),))
        .putFile(file);

    await FirebaseFirestore.instance
        .collection('topics')
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