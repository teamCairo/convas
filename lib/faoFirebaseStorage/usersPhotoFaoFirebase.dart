import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Image?> getUsersSmallPhoto(String userDocId, String profilePhotoNameSuffix) async {

  String tmp ="mainPhoto_small";
  return await getUsersPhoto( userDocId,  profilePhotoNameSuffix, tmp);
}

Future<Image?> getUsersBigPhoto(String userDocId, String profilePhotoNameSuffix) async {

  String tmp ="mainPhoto";
  return await getUsersPhoto( userDocId,  profilePhotoNameSuffix,tmp);
}

Future<Image?> getUsersPhoto(String userDocId,
    String profilePhotoNameSuffix,
    String profilePhotoNamePrefix) async {

  FirebaseStorage storage = FirebaseStorage.instance;
  Image? image;
  if (profilePhotoNameSuffix != "") {
    try {
      Reference imageRef = storage
          .ref()
          .child("profile")
          .child(userDocId)
          .child(profilePhotoNamePrefix + profilePhotoNameSuffix);
      String imageUrl =await imageRef.getDownloadURL();
      log("写真取れた");
      image= Image.network(imageUrl, width: 90);
    } catch (e) {

      log("写真あるはずなのになぜかエラーだった");
    }
  } else {
    log("写真設定されていない");
  }

  return image;
}