import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseNameProvider = StateProvider.autoDispose((ref) {
  return '';
});

class CourseImagePhotoFile extends ChangeNotifier {
  File? _courseImagePhotoFile;
  get courseImagePhotoFile => _courseImagePhotoFile;

  void clearCourseImagePhotoFile() {
    _courseImagePhotoFile = null;
    notifyListeners();
  }

  void setCourseImagePhotoFile(File? imageFile) {
    _courseImagePhotoFile = imageFile;
    notifyListeners();
  }
}

final courseImagePhotoFileProvider =
ChangeNotifierProvider((ref) => CourseImagePhotoFile());
