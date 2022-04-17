import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider = ChangeNotifierProvider(
      (ref) => RegisterNotifier(),
);
class RegisterNotifier extends ChangeNotifier {

  DateTime? _goalDeadline;
  DateTime? get goalDeadline=>_goalDeadline;

  DateTime? _continualUntil;
  DateTime? get continualUntil=>_continualUntil;

  bool _monday=false;
  bool get monday =>_monday;
  bool _tuesday=false;
  bool get tuesday =>_tuesday;
  bool _wednesday=false;
  bool get wednesday =>_wednesday;
  bool _thursday=false;
  bool get thursday =>_thursday;
  bool _friday=false;
  bool get friday =>_friday;
  bool _saturday=false;
  bool get saturday =>_saturday;
  bool _sunday=false;
  bool get sunday =>_sunday;

  String _goal="";
  String get goal=>_goal;

  String _name="";
  String get name=>_name;

  DateTime? _birthDate;
  DateTime? get birthDate=>_birthDate;

  String _userType="";
  String get userType=>_userType;

  int _timesAWeek=0;
  int get timesAWeek=>_timesAWeek;

  bool _canBeFound=false;
  bool get canBeFound =>_canBeFound;

  void initialize() async {
    _continualUntil=DateTime.now().add(const Duration(days:40));
    _goalDeadline=DateTime.now();
    _userType="";
    _goal="";
    _name="";
    _monday=false;
    _tuesday=false;
    _wednesday=false;
    _thursday=false;
    _friday=false;
    _saturday=false;
    _sunday=false;
    _birthDate=null;
    _timesAWeek=0;
  }

  setName(String value){
    _name=value;
    notifyListeners();
  }

  setBirthDate(DateTime? value){
    _birthDate=value;
    notifyListeners();
  }

  setCanBeFound(bool value){
    _canBeFound=value;
    notifyListeners();
  }

setContinualUntil(DateTime value){
  _continualUntil=value;
  notifyListeners();
}
  clearDayOfWeek(){
    _monday=false;
    _tuesday=false;
    _wednesday=false;
    _thursday=false;
    _friday=false;
    _saturday=false;
    _sunday=false;
    notifyListeners();
  }

  setGoal(String value){
    _goal=value;
    notifyListeners();
  }

  setTuesday(bool value){
    _tuesday=value;
    notifyListeners();
  }

  setWednesday(bool value){
    _wednesday=value;
    notifyListeners();
  }

  setThursday(bool value){
    _thursday=value;
    notifyListeners();
  }

  setFriday(bool value){
    _friday=value;
    notifyListeners();
  }

  setSaturday(bool value){
    _saturday=value;
    notifyListeners();
  }

  setSunday(bool value){
    _sunday=value;
    notifyListeners();
  }

  setMonday(bool value){
    _monday=value;
    notifyListeners();
  }

  setTimesAWeek(int value){
    _timesAWeek=value;
    notifyListeners();
  }

  setGoalDeadline(DateTime value){
    _goalDeadline=value;
    notifyListeners();
  }

  setUserType(String value){
    _userType=value;
    notifyListeners();
  }
}