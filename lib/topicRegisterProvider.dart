import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daoIsar/categoryDaoIsar.dart';
import 'entityIsar/categoryEntityIsar.dart';


class TopicRegisterNotifier extends ChangeNotifier {

  File? _topicImagePhotoFile;
  get topicImagePhotoFile => _topicImagePhotoFile ;

  String _topicName="";
  get topicName=>_topicName;

  String _categoryItemDocId="";
  get categoryItemDocId=>_categoryItemDocId;

  String _categoryItemName="";
  get categoryItemName=>_categoryItemName;

  Map<String,String> _categoryMap={};
  get categoryMap=>_categoryMap;


  void setTopicImagePhotoFile(File? imageFile) {
    _topicImagePhotoFile=imageFile;
    notifyListeners();
  }


  Future<void> initialize()async{
    _topicImagePhotoFile=null;
    _categoryItemDocId="";
    _topicName="";
    _categoryItemName="Please select category";
    _categoryMap={};
    List<Category>? categoryList=await selectIsarCategoryAll();

    if(categoryList!.isEmpty){

    }else{
      for(int i=0;i<categoryList.length;i++){
        _categoryMap[categoryList[i].categoryDocId]=categoryList[i].categoryName;
      }
    }

      notifyListeners();
  }

  void setTopicName(String topicName){
    _topicName = topicName;
    notifyListeners();
  }

  void setCategoryItemDocId(String id,String name){
    _categoryItemDocId = id;
    _categoryItemName = name;
    notifyListeners();
  }
}

final topicRegisterProvider = ChangeNotifierProvider(
        (ref) => TopicRegisterNotifier());

