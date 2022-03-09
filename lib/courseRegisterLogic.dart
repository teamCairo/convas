import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'courseRegisterProvider.dart';
import 'common/UI/commonOthersUI.dart';

Future<void> setCourseImage(WidgetRef ref) async {
  XFile? pickerFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
      imageQuality: 40);
  if (pickerFile != null) {
    ref.watch(courseImagePhotoFileProvider.notifier)
        .setCourseImagePhotoFile(File(pickerFile.path));
    //TODO 圧縮率などは調整
  }
}

Future<bool> checkCourseData(BuildContext context, WidgetRef ref,String courseName) async{

  if(ref.watch(courseImagePhotoFileProvider).courseImagePhotoFile == null){

    await showOkWarningDialog(context,"Please select image");
    return false;
  }else if(courseName==""){

    await showOkWarningDialog(context,"Please input name");
    return false;

  }else{
    return true;
  }

}