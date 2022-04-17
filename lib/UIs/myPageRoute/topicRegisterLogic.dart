import 'dart:io';

import 'package:convas/UIs/myPageRoute/topicRegisterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/UI/commonOthersUI.dart';

Future<void> setTopicImage(WidgetRef ref) async {
  XFile? pickerFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
      imageQuality: 40);
  if (pickerFile != null) {
    ref
        .watch(topicRegisterProvider.notifier)
        .setTopicImagePhotoFile(File(pickerFile.path));
    //TODO 圧縮率などは調整
  }
}


Future<bool> checkTopicData(BuildContext context, WidgetRef ref,String topicName) async{

  //画像NULLチェック
  if(ref.watch(topicRegisterProvider).topicImagePhotoFile == null){
    await commonShowOkWarningDialog(context,"Please select image");
    return false;

  }else if(topicName==""){
    await commonShowOkWarningDialog(context,"Please input name");
    return false;

  }else{
    return true;
  }

}