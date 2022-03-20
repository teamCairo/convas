import 'dart:developer';
import 'dart:typed_data';
import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../common/logic/commonLogicFile.dart';

Future<Uint8List?> readMasterImageFromFirebase(
     String masterGroupCode,String code,String fileNameSuffix,int no) async {

  if (fileNameSuffix == "" ) {
    return null;
  }else{

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference imageRef = storage.ref("masters/" + masterGroupCode+"/" +code+(no==1?"_1":"_2")+ fileNameSuffix);
    String imageUrl = await imageRef.getDownloadURL();
    File imgFile=await urlToFile(imageUrl);

      Uint8List? bytes;
      await imgFile.readAsBytes().then((value) {
        bytes = Uint8List.fromList(value);
        log('reading of bytes is completed');
      }).catchError((onError) {
        log('Exception Error while reading audio from path:' +
            onError.toString());
      });
      return bytes;
  }
}