import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entityIsar/masterEntityIsar.dart';

class SearchUsersConditionEditTypeNotifier extends ChangeNotifier {
  Map<String, Master> _masterMap = {};
  Map<String, Master> get masterMap => _masterMap;

  Map<String, bool> _masterBoolMap = {};
  get masterBoolMap => _masterBoolMap;

  bool _doesntMatterCheck =false;
  get doesntMatterCheck=>_doesntMatterCheck;

  void setDoesntMatterCheck() {
    bool allFalseCheckBool= true;
    _masterBoolMap.forEach((key, value) {
      if(value == true){
        allFalseCheckBool=false;
      }
    });

    _doesntMatterCheck=allFalseCheckBool;
  }

  Future<void> initialize(
      WidgetRef ref, String databaseItem, String inputValue) async {
    _masterBoolMap = {};

    switch (databaseItem) {
      case "searchConditionLevel":
        _masterMap = getMasterMap("level", ref);
        break;
      case "searchConditionMotherTongue":
        _masterMap = getMasterMap("language", ref);
        break;
      case "searchConditionCountry":
        _masterMap = getMasterMap("country", ref);
        break;
      case "searchConditionGender":
        _masterMap = getMasterMap("gender", ref);
        break;
      case "searchConditionHomeCountry":
        _masterMap = getMasterMap("country", ref);
        break;
      case "searchConditionLoginTime":
        _masterMap = getMasterMap("lastLogin", ref);
        break;
      case "searchConditionCategories":
        _masterMap = getMasterMap("category", ref);
        break;
      case "searchConditionCourses":
        _masterMap = getMasterMap("course", ref);
        break;
      case "searchConditionUserType":
        _masterMap = getMasterMap("userType", ref);
        break;
    }

    if (_masterMap.isEmpty) {
    } else {
      _masterMap.forEach((key, value) {
        if (inputValue.contains(key)) {
          _masterBoolMap[key] = true;
        } else {
          _masterBoolMap[key] = false;
        }
      });
    }

    setDoesntMatterCheck();
    notifyListeners();
  }

  void setBool(String key, bool value) {
    _masterBoolMap[key] = !value;
    setDoesntMatterCheck();
    notifyListeners();
  }

  void changeDoesntMatterCheck(bool changedDoesntMatter){
    if(changedDoesntMatter){
      _doesntMatterCheck = changedDoesntMatter;

      _masterBoolMap.forEach((key, value) {
        _masterBoolMap[key]=false;
      });
    }else{
    }

    notifyListeners();
  }
}

final searchUsersConditionEditTypeProvider =
    ChangeNotifierProvider((ref) => SearchUsersConditionEditTypeNotifier());
