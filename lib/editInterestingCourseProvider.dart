import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'daoIsar/courseDaoIsar.dart';
import 'entityIsar/courseEntityIsar.dart';


class EditInterestingCourseNotifier extends ChangeNotifier {

  Map<String,String> _courseDocIdNameMap={};
  get courseDocIdNameMap=>_courseDocIdNameMap;

  Map<String,bool> _courseDocIdboolMap={};
  get courseDocIdboolMap=>_courseDocIdboolMap;

  Future<void> initialize(WidgetRef ref)async{
    _courseDocIdNameMap={};
    _courseDocIdboolMap={};
    List<Course>? courseList=await selectIsarCourseAll();

    if(courseList!.isEmpty){

    }else{
      for(int i=0;i<courseList.length;i++){
        _courseDocIdNameMap[courseList[i].courseDocId]=courseList[i].courseName;
        if(ref.watch(userDataProvider).userData["interestingCourses"].contains(courseList[i].courseDocId)){
          _courseDocIdboolMap[courseList[i].courseDocId]=true;
        }else{
          _courseDocIdboolMap[courseList[i].courseDocId]=false;
        }
      }
    }

    notifyListeners();
  }

  void setBool(String key,bool value){
    _courseDocIdboolMap[key]=!value;
    notifyListeners();
  }
}

final editInterestingCourseProvider = ChangeNotifierProvider(
        (ref) => EditInterestingCourseNotifier());

