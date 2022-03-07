import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topicNameProvider = StateProvider.autoDispose((ref) {
  return '';
});

class CategoryItemsNotifier extends ChangeNotifier {
  List<DropdownMenuItem<String>> _categoryItems=[];
  get categoryItems => _categoryItems ;

  String _selectedCategoryItem="";
  get selectedCategoryItem=>_selectedCategoryItem;

  CategoryItemsNotifier()  {
    setCategoryItemsProvider();
  }

  void clearCategoryItemsNotifier()  {
    _selectedCategoryItem = _categoryItems[0].value!;
    notifyListeners();
  }

  void setCategoryItemId(String id){

    _selectedCategoryItem = id;
    notifyListeners();
  }

  Future<void> setCategoryItemsProvider() async {

    //マスタデータをFirebaseからHiveへ
    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot snapshot) async {
      snapshot.docs.forEach((doc) async {

        _categoryItems
          .add(DropdownMenuItem(
            child: Text(
              doc.get('categoryName'),
              style: TextStyle(fontSize: 16.0),
            ),
            value: doc.id,
          ));
      });

      // await boxMaster.close();
    });
    _selectedCategoryItem = _categoryItems[0].value!;

    notifyListeners();
  }


}

final categoryItemsProvider = ChangeNotifierProvider(
        (ref) => CategoryItemsNotifier());


class TopicImagePhotoFile extends ChangeNotifier {
  File? _topicImagePhotoFile;
  get topicImagePhotoFile => _topicImagePhotoFile ;


  void clearTopicImagePhotoFile() {
    _topicImagePhotoFile=null;
    notifyListeners();
  }

  void setTopicImagePhotoFile(File? imageFile) {
    _topicImagePhotoFile=imageFile;
    notifyListeners();
  }
}

final topicImagePhotoFileProvider = ChangeNotifierProvider(
        (ref) => TopicImagePhotoFile());

