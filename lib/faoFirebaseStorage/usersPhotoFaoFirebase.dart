import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

Future<Image?> getUsersSmallPhoto(String userDocId, String profilePhotoNameSuffix) async {

  FirebaseStorage storage = FirebaseStorage.instance;

  if (profilePhotoNameSuffix != "") {
    try {
      Reference imageRef = storage
          .ref()
          .child("profile")
          .child(userDocId)
          .child("mainPhoto_small" + profilePhotoNameSuffix);
      await imageRef.getDownloadURL().then((imageUrl) {
       return Image.network(imageUrl, width: 90);
      });
    } catch (e) {

      log("写真あるはずなのになぜかエラーだった");
    }
  } else {
    // log("写真登録されていない");
  }
  return null;
}