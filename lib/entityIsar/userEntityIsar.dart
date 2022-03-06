import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'userEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class User {

  User(
      this.userDocId,
      this.name,
      this.email,
      this.age,
      this.level,
      this.occupation,
      this.motherTongue,
      this.country,
      this.town,
      this.homeCountry,
      this.homeTown,
      this.gender,
      this.placeWannaGo,
      this.greeting,
      this.description,
      this.userType,
      this.searchConditionAge,
      this.searchConditionLevel,
      this.searchConditionNativeLang,
      this.searchConditionCountry,
      this.searchConditionGender,
      this.profilePhotoNameSuffix,
      this.profilePhotoUpdateCnt,
      this.messageTokenId,
      this.onlineStatus,
      this.lastLoginTime,
      this.interestingCategories,
      this.interestingCourse,
      this.insertUserDocId,
      this.insertProgramId,
      this.insertTime,
      this.updateUserDocId,
      this.updateProgramId,
      this.updateTime,
      this.readableFlg,
      this.deleteFlg,

      );

  @Id()
  int id = Isar.autoIncrement;
  late String userDocId;
  String? name;
  String? email;
  int? age;
  String? level;
  String? occupation;
  String? motherTongue;
  String? country;
  String? town;
  String? homeCountry;
  String? homeTown;
  String? gender;
  String? placeWannaGo;
  String? greeting;
  String? description;
  String? userType;
  String? searchConditionAge;
  String? searchConditionLevel;
  String? searchConditionNativeLang;
  String? searchConditionCountry;
  String? searchConditionGender;
  String? profilePhotoNameSuffix;
  int? profilePhotoUpdateCnt;
  String? messageTokenId;
  bool? onlineStatus;
  DateTime? lastLoginTime;
  String? interestingCategories;
  String? interestingCourse;
  String? insertUserDocId;
  String? insertProgramId;
  DateTime? insertTime;
  String? updateUserDocId;
  String? updateProgramId;
  DateTime? updateTime;
  bool? readableFlg;
  bool? deleteFlg;


}