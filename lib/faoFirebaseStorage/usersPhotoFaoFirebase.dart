import 'dart:developer';
import 'package:convas/searchUsersProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> getUsersSmallPhoto(String userDocId, String profilePhotoNameSuffix,WidgetRef ref) async {

  FirebaseStorage storage = FirebaseStorage.instance;
  Image? image;
  if (profilePhotoNameSuffix != "") {
    try {
      Reference imageRef = storage
          .ref()
          .child("profile")
          .child(userDocId)
          .child("mainPhoto_small" + profilePhotoNameSuffix);
      String imageUrl =await imageRef.getDownloadURL();
        log("写真取れた");
        image= Image.network(imageUrl, width: 90);
    } catch (e) {

      log("写真あるはずなのになぜかエラーだった");
    }
  } else {
    log("写真設定されていない");
  }
  ref.read(searchUsersProvider.notifier).setImage(userDocId, image);
}