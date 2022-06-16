import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setFrequencyProvider = ChangeNotifierProvider(
      (ref) => SetFrequencyNotifier(),
);
class SetFrequencyNotifier extends ChangeNotifier {
  int _mondayLevel=0;
  int _tuesdayLevel=0;
  int _wednesdayLevel=0;
  int _thursdayLevel=0;
  int _fridayLevel=0;
  int _saturdayLevel=0;
  int _sundayLevel=0;

  int getLevel(String text){
    switch(text){
      case "Mon":
        return _mondayLevel;
      case "Tue":
        return _tuesdayLevel;
      case "Wed":
        return _wednesdayLevel;
      case "Thu":
        return _thursdayLevel;
      case "Fri":
        return _fridayLevel;
      case "Sat":
        return _saturdayLevel;
      case "Sun":
        return _sundayLevel;
      default:
        return -1;
    }
  }

  void setLevel(String text,int level){
    switch(text){
      case "Mon":
        _mondayLevel=level;
        break;
      case "Tue":
        _tuesdayLevel=level;
        break;
      case "Wed":
        _wednesdayLevel=level;
        break;
      case "Thu":
        _thursdayLevel=level;
        break;
      case "Fri":
        _fridayLevel=level;
        break;
      case "Sat":
        _saturdayLevel=level;
        break;
      case "Sun":
        _sundayLevel=level;
        break;
      default:
    }

    notifyListeners();

  }

  void initialize() async {
    _mondayLevel=0;
    _tuesdayLevel=0;
    _wednesdayLevel=0;
    _thursdayLevel=0;
    _fridayLevel=0;
    _saturdayLevel=0;
    _sundayLevel=0;
  }

}