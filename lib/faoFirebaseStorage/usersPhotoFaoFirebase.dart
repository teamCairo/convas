import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../UIs/register/registerProvider.dart';

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


Future<void> uploadAndInsertPhotoWhenRegister( WidgetRef ref,String userDocId) async {

  if(ref.watch(registerProvider).photo==null){
  }else{

    String pathStr = ref.watch(registerProvider).photo!.path;
    String pathStrEx = pathStr.substring(
      pathStr.lastIndexOf('.'),
    );
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      await storage
          .ref("profile/" + userDocId + "/mainPhoto" + pathStrEx)
          .putFile(ref.watch(registerProvider).photo!);
      //ローカルに保存
      Directory appDocDir = await getApplicationDocumentsDirectory();
      File downloadToFile =
      File("${appDocDir.path}/media/mainPhoto" + pathStrEx);
      await downloadToFile.writeAsBytes(await ref.watch(registerProvider).photo!.readAsBytes());

      await FlutterImageCompress.compressAndGetFile(
        "${appDocDir.path}/media/mainPhoto" + pathStrEx,
        "${appDocDir.path}/media/mainPhoto_small" + pathStrEx,
        quality: 20,
      );

      File localSmallFile =
      File("${appDocDir.path}/media/mainPhoto_small" + pathStrEx);
      await storage
          .ref("profile/" +
          userDocId +
          "/mainPhoto_small" +
          pathStrEx)
          .putFile(localSmallFile);
    } catch (e) {
      log(e.toString());
    }
  }
}