import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final registerProvider = ChangeNotifierProvider(
      (ref) => RegisterNotifier(),
);
class RegisterNotifier extends ChangeNotifier {

  DateTime? _continualUntil;
  DateTime? get continualUntil=>_continualUntil;

  File? _photo;
  File? get photo=>_photo;

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

  String _goalCategory="";
  String get goalCategory=>_goalCategory;

  String _profilePhotoNameSuffix="";
  String get profilePhotoNameSuffix=>_profilePhotoNameSuffix;


  String _goal="";
  String get goal=>_goal;

  String _name="";
  String get name=>_name;

  DateTime? _birthDate;
  DateTime? get birthDate=>_birthDate;

  String _userType="";
  String get userType=>_userType;

  String _gender="";
  String get gender=>_gender;
  String _level="";
  String get level=>_level;

  int _timesAWeek=3;
  int get timesAWeek=>_timesAWeek;

  bool _canBeFound=false;
  bool get canBeFound =>_canBeFound;

  void initialize() async {
    _continualUntil=DateTime.now().add(const Duration(days:40));
    _userType="";
    _gender="";
    _level="";
    _profilePhotoNameSuffix="";
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
    _timesAWeek=3;
    _goalCategory="";
    _photo=null;
  }

  setPhoto(WidgetRef ref)async{

    XFile? pickerFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 40);
    if (pickerFile != null) {
      _photo = File(pickerFile.path);
      //TODO 圧縮率などは調整
      _profilePhotoNameSuffix=_photo!.path.substring(
        _photo!.path.lastIndexOf('.'),
      );
    }
    notifyListeners();
  }

  setGoalCategory(String value){
    _goalCategory=value;
  }

  setGender(String value){
    _gender=value;
    notifyListeners();
  }

  setLevel(String value){
    _level=value;
    notifyListeners();
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


  setGoalHashTag(String item, String value){
    _goal=_goal+" #"+item+":"+value+" ";
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

  setUserType(String value){
    _userType=value;
    notifyListeners();
  }
}