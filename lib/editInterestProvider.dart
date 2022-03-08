import 'dart:io';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daoIsar/categoryDaoIsar.dart';
import 'entityIsar/categoryEntityIsar.dart';


class EditInterestNotifier extends ChangeNotifier {

  Map<String,String> _categoryDocIdNameMap={};
  get categoryDocIdNameMap=>_categoryDocIdNameMap;

  Map<String,bool> _categoryDocIdboolMap={};
  get categoryDocIdboolMap=>_categoryDocIdboolMap;

  Future<void> initialize(WidgetRef ref)async{
    _categoryDocIdNameMap={};
    _categoryDocIdboolMap={};
    List<Category>? categoryList=await selectIsarCategoryAll();

    if(categoryList!.isEmpty){

    }else{
      for(int i=0;i<categoryList.length;i++){
        _categoryDocIdNameMap[categoryList[i].categoryDocId]=categoryList[i].categoryName;
        if(ref.watch(userDataProvider).userData["interestingCategories"].contains(categoryList[i].categoryDocId)){
          _categoryDocIdboolMap[categoryList[i].categoryDocId]=true;
        }else{
          _categoryDocIdboolMap[categoryList[i].categoryDocId]=false;
        }
      }
    }

    notifyListeners();
  }

  void setBool(String key,bool value){
    _categoryDocIdboolMap[key]=!value;
    notifyListeners();
  }
}

final editInterestProvider = ChangeNotifierProvider(
        (ref) => EditInterestNotifier());

