import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entityIsar/masterEntityIsar.dart';

class AppointmentSelectTypeNotifier extends ChangeNotifier {
  Map<String, Master> _masterMap = {};
  Map<String, Master> get masterMap => _masterMap;

  Map<String, bool> _masterBoolMap = {};
  get masterBoolMap => _masterBoolMap;

  bool _allCheck =false;
  bool get allCheck=>_allCheck;

  void setAllCheck() {
    bool allFalseCheckBool= true;
    _masterBoolMap.forEach((key, value) {
      if(value == true){
        allFalseCheckBool=false;
      }
    });

    _allCheck=allFalseCheckBool;
  }

  Future<void> initialize(
      WidgetRef ref, String databaseItem, String inputValue) async {
    _masterBoolMap = {};
    _masterMap = getMasterMap(databaseItem, ref);

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

    setAllCheck();
    notifyListeners();
  }

  void setBool(String key, bool value) {
    _masterBoolMap[key] = !value;
    setAllCheck();
    notifyListeners();
  }

  void changeAllCheck(bool changedAllCheck){
    if(changedAllCheck){
      _allCheck = changedAllCheck;

      _masterBoolMap.forEach((key, value) {
        _masterBoolMap[key]=false;
      });
    }else{
    }

    notifyListeners();
  }
}

final appointmentSelectTypeProvider =
ChangeNotifierProvider((ref) => AppointmentSelectTypeNotifier());
