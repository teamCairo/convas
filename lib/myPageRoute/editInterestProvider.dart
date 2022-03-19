import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/masterProvider.dart';
import '../entityIsar/masterEntityIsar.dart';



class EditInterestNotifier extends ChangeNotifier {

  Map<String,String> _categoryCdNameMap={};
  get categoryCdNameMap=>_categoryCdNameMap;

  Map<String,bool> _categoryCdBoolMap={};
  get categoryCdBoolMap=>_categoryCdBoolMap;

  void initialize(WidgetRef ref)async{
    _categoryCdNameMap={};
    _categoryCdBoolMap={};
    Map<String, Master> categoryMap=getMasterMap("category", ref);

    if(categoryMap.isEmpty){

    }else{
      categoryMap.forEach((key, value) {
        _categoryCdNameMap[value.code]=value.name;
        if(ref.watch(userDataProvider).userData["interestingCategories"].contains(value.code)){
          _categoryCdBoolMap[value.code]=true;
        }else{
          _categoryCdBoolMap[value.code]=false;
        }

      });
    }

  }

  void setBool(String key,bool value){
    _categoryCdBoolMap[key]=!value;
    notifyListeners();
  }
}

final editInterestProvider = ChangeNotifierProvider(
        (ref) => EditInterestNotifier());

