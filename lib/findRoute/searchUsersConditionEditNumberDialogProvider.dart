import 'package:convas/common/logic/commonLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/commonValues.dart';

class SearchUsersConditionEditNumberDialogNotifier extends ChangeNotifier {

  int _start=0;
  int _end=0;

  int _min=0;
  int _max=0;
  RangeValues _rangeValues=const RangeValues(0,0);

  get start => _start;
  get end => _end;

  get min => _min;
  get max => _max;
  get rangeValues => _rangeValues;

  void initialize(
      WidgetRef ref, String databaseItem, String value) async {

    _start=int.parse(fromTextToList(value)[0]);
    _end=int.parse(fromTextToList(value)[1]);
    _rangeValues=RangeValues(double.parse(fromTextToList(value)[0]),double.parse(fromTextToList(value)[1]));

    switch(databaseItem){
      case "searchConditionAge":
        _min = searchConditionAgeMin;
        _max = searchConditionAgeMax;
        break;

    }
  }

  void setRangeValues(RangeValues values){
    _rangeValues=values;
    _start=values.start.round();
    _end=values.end.round();
    notifyListeners();
  }

}

final searchUsersConditionEditNumberDialogProvider =
ChangeNotifierProvider((ref) => SearchUsersConditionEditNumberDialogNotifier());
