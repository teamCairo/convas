import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/provider/masterProvider.dart';
import '../../entityIsar/masterEntityIsar.dart';

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


  Future<void> initialize(WidgetRef ref)async{
    _topicImagePhotoFile=null;
    _categoryItemDocId="";
    _topicName="";
    _categoryItemName="Please select category";
    _categoryMap={};
    Map<String, Master> categoryMap=getMasterMap("category", ref);

    if(categoryMap.isEmpty){

    }else{
      categoryMap.forEach((key, value) {
        _categoryMap[value.code]=value.name;
      });
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

