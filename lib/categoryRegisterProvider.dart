import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/provider/userProvider.dart';

final categoryNameProvider = StateProvider.autoDispose((ref) {
  return '';
});

class CategoryImagePhotoFile extends ChangeNotifier {
  File? _categoryImagePhotoFile;
  get categoryImagePhotoFile => _categoryImagePhotoFile;

  void clearCategoryImagePhotoFile() {
    _categoryImagePhotoFile = null;
    notifyListeners();
  }

  void setCategoryImagePhotoFile(File? imageFile) {
    _categoryImagePhotoFile = imageFile;
    notifyListeners();
  }
}

final categoryImagePhotoFileProvider =
ChangeNotifierProvider((ref) => CategoryImagePhotoFile());
