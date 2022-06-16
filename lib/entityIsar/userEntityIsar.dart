import 'package:isar/isar.dart';

part 'userEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class User {

  User(
      this.userDocId,
      this.name,
      this.email,
      this.birthDate,
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
      this.searchConditionMotherTongue,
      this.searchConditionCountry,
      this.searchConditionGender,
      this.searchConditionHomeCountry,
      this.searchConditionLoginTime,
      this.searchConditionCategories,
      this.searchConditionCourses,
      this.searchConditionUserType,
      this.profilePhotoNameSuffix,
      this.profilePhotoUpdateCnt,
      this.messageTokenId,
      this.informationModifiedTime,
      this.interestingCategories,
      this.interestingCourses,
      this.goal,
      this.continualUntilGoalDate,
      this.lessonPlanMonday,
      this.lessonPlanTuesday,
      this.lessonPlanWednesday,
      this.lessonPlanThursday,
      this.lessonPlanFriday,
      this.lessonPlanSaturday,
      this.lessonPlanSunday,
      this.timesAWeek,
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
  DateTime? birthDate;
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
  String? searchConditionMotherTongue;
  String? searchConditionCountry;
  String? searchConditionGender;
  String? searchConditionHomeCountry;
  String? searchConditionLoginTime;
  String? searchConditionCategories;
  String? searchConditionCourses;
  String? searchConditionUserType;
  String? profilePhotoNameSuffix;
  int? profilePhotoUpdateCnt;
  String? messageTokenId;
  DateTime? informationModifiedTime;
  String? interestingCategories;
  String? interestingCourses;
  String? goal;
  DateTime? continualUntilGoalDate;
  bool? lessonPlanMonday;
  bool? lessonPlanTuesday;
  bool? lessonPlanWednesday;
  bool? lessonPlanThursday;
  bool? lessonPlanFriday;
  bool? lessonPlanSaturday;
  bool? lessonPlanSunday;
  int? timesAWeek;
  String? insertUserDocId;
  String? insertProgramId;
  DateTime? insertTime;
  String? updateUserDocId;
  String? updateProgramId;
  DateTime? updateTime;
  bool? readableFlg;
  bool? deleteFlg;
}