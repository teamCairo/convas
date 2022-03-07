
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../common/provider/userProvider.dart';

Future<void> insertCategoryData(WidgetRef ref, String categoryName,File imageFile) async {
  String insertedDocId = "";

  try {
    await FirebaseFirestore.instance.collection('categories').add(
      {
        'categoryName': categoryName,
        'photoPath': '',
        'photoUpdateCnt': '0',
        'insertUserDocId':
        ref.watch(userDataProvider.notifier).userData["userDocId"],
        'insertProgramId': "CategoryRegister",
        'insertTime': DateTime.now().toString(),
      },
    ).then((value) {
      insertedDocId = value.id;
    });

    FirebaseStorage storage = FirebaseStorage.instance;
    String pathStr = imageFile
        .path;
    await storage
        .ref("categories/" +
        insertedDocId +
        pathStr.substring(
          pathStr.lastIndexOf('.'),
        ))
        .putFile(imageFile);

    await FirebaseFirestore.instance
        .collection('categories')
        .doc(insertedDocId)
        .update({
      "photoUpdateCnt": "1",
      "photoPath": "categories/" +
          insertedDocId +
          pathStr.substring(
            pathStr.lastIndexOf('.'),
          ),
      'updateUserDocId':
      ref.watch(userDataProvider.notifier).userData["userDocId"],
      'updateProgramId': "CategoryRegister",
      'updateTime': DateTime.now().toString(),
    });

  } catch (e) {
    log(e.toString());
  }
}
