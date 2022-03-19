import 'package:convas/common/provider/masterProvider.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entityIsar/masterEntityIsar.dart';


class EditInterestingCourseNotifier extends ChangeNotifier {

  Map<String,String> _courseCdNameMap={};
  get courseCdNameMap=>_courseCdNameMap;

  Map<String,bool> _courseCdBoolMap={};
  get courseCdBoolMap=>_courseCdBoolMap;

  void initialize(WidgetRef ref)async{
    _courseCdNameMap={};
    _courseCdBoolMap={};
    Map<String, Master> courseMap=getMasterMap("course", ref);

    if(courseMap.isEmpty){

    }else{
      courseMap.forEach((key, value) {
        _courseCdNameMap[value.code]=value.name;
        if(ref.watch(userDataProvider).userData["interestingCourses"].contains(value.code)){
          _courseCdBoolMap[value.code]=true;
        }else{
          _courseCdBoolMap[value.code]=false;
        }

      });
    }

  }

  void setBool(String key,bool value){
    _courseCdBoolMap[key]=!value;
    notifyListeners();
  }
}

final editInterestingCourseProvider = ChangeNotifierProvider(
        (ref) => EditInterestingCourseNotifier());

