import 'package:isar/isar.dart';

import '../entityIsar/userEntityIsar.dart';

Future<User?> selectIsarUser() async {

  var isarInstance = Isar.getInstance();
  User? resultUser;
  await isarInstance?.writeTxn((isar) async {
    List<User> resultList =
    await isar.users.filter().deleteFlgEqualTo(false).findAll();

    if(resultList.isEmpty){
      resultUser = null;
    }else{
      resultUser = resultList[0];
    }
  });
  return resultUser;
}


Future<int> insertOrUpdateIsarUser({
  required String userDocId,
  String? name,
  String? email,
  DateTime? birthDate,
  String? level,
  String? occupation,
  String? motherTongue,
  String? country,
  String? town,
  String? homeCountry,
  String? homeTown,
  String? gender,
  String? placeWannaGo,
  String? greeting,
  String? description,
  String? userType,
  String? searchConditionAge,
  String? searchConditionLevel,
  String? searchConditionMotherTongue,
  String? searchConditionCountry,
  String? searchConditionGender,
  String? searchConditionHomeCountry,
  String? searchConditionLoginTime,
  String? searchConditionCategories,
  String? searchConditionCourses,
  String? searchConditionUserType,
  String? profilePhotoNameSuffix,
  int? profilePhotoUpdateCnt,
  String? messageTokenId,
  DateTime? informationModifiedTime,
  String? interestingCategories,
  String? interestingCourses,
  String? goal,
  DateTime? continualUntilGoalDate,
  bool? lessonPlanMonday,
  bool? lessonPlanTuesday,
  bool? lessonPlanWednesday,
  bool? lessonPlanThursday,
  bool? lessonPlanFriday,
  bool? lessonPlanSaturday,
  bool? lessonPlanSunday,
  int? timesAWeek,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,
}) async {

  await deleteIsarUsers();
  return await insertIsarUser(
    userDocId: userDocId,
    name: name,
    email: email,
    birthDate: birthDate,
    level: level,
    occupation: occupation,
    motherTongue: motherTongue,
    country: country,
    town: town,
    homeCountry: homeCountry,
    homeTown: homeTown,
    gender: gender,
    placeWannaGo: placeWannaGo,
    greeting: greeting,
    description: description,
    userType: userType,
    searchConditionAge: searchConditionAge,
    searchConditionLevel: searchConditionLevel,
    searchConditionMotherTongue: searchConditionMotherTongue,
    searchConditionCountry: searchConditionCountry,
    searchConditionGender: searchConditionGender,
    searchConditionHomeCountry: searchConditionHomeCountry,
    searchConditionLoginTime: searchConditionLoginTime,
    searchConditionCategories: searchConditionCategories,
    searchConditionCourses: searchConditionCourses,
    searchConditionUserType: searchConditionUserType,
    profilePhotoNameSuffix: profilePhotoNameSuffix,
    profilePhotoUpdateCnt: profilePhotoUpdateCnt,
    messageTokenId: messageTokenId,
    informationModifiedTime: informationModifiedTime,
    interestingCategories: interestingCategories,
    interestingCourses: interestingCourses,
    goal: goal,
    continualUntilGoalDate: continualUntilGoalDate,
    lessonPlanMonday: lessonPlanMonday,
    lessonPlanTuesday: lessonPlanTuesday,
    lessonPlanWednesday: lessonPlanWednesday,
    lessonPlanThursday: lessonPlanThursday,
    lessonPlanFriday: lessonPlanFriday,
    lessonPlanSaturday: lessonPlanSaturday,
    lessonPlanSunday: lessonPlanSunday,
    timesAWeek: timesAWeek,
    insertUserDocId: insertUserDocId,
    insertProgramId: insertProgramId,
    insertTime: insertTime,
    updateUserDocId: updateUserDocId,
    updateProgramId: updateProgramId,
    updateTime: updateTime,
    readableFlg: readableFlg,
    deleteFlg: deleteFlg,);
}


Future<int> insertIsarUser({required String userDocId,
  String? name,
  String? email,
  DateTime? birthDate,
  String? level,
  String? occupation,
  String? motherTongue,
  String? country,
  String? town,
  String? homeCountry,
  String? homeTown,
  String? gender,
  String? placeWannaGo,
  String? greeting,
  String? description,
  String? userType,
  String? searchConditionAge,
  String? searchConditionLevel,
  String? searchConditionMotherTongue,
  String? searchConditionCountry,
  String? searchConditionGender,
  String? searchConditionHomeCountry,
  String? searchConditionLoginTime,
  String? searchConditionCategories,
  String? searchConditionCourses,
  String? searchConditionUserType,
  String? profilePhotoNameSuffix,
  int? profilePhotoUpdateCnt,
  String? messageTokenId,
  DateTime? informationModifiedTime,
  String? interestingCategories,
  String? interestingCourses,
  String? goal,
  DateTime? continualUntilGoalDate,
  bool? lessonPlanMonday,
  bool? lessonPlanTuesday,
  bool? lessonPlanWednesday,
  bool? lessonPlanThursday,
  bool? lessonPlanFriday,
  bool? lessonPlanSaturday,
  bool? lessonPlanSunday,
  int? timesAWeek,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,

}) async {

  User insertUser = User(
    userDocId,
    name,
    email,
    birthDate,
    level,
    occupation,
    motherTongue,
    country,
    town,
    homeCountry,
    homeTown,
    gender,
    placeWannaGo,
    greeting,
    description,
    userType,
    searchConditionAge,
    searchConditionLevel,
    searchConditionMotherTongue,
    searchConditionCountry,
    searchConditionGender,
    searchConditionHomeCountry,
    searchConditionLoginTime,
    searchConditionCategories,
    searchConditionCourses,
    searchConditionUserType,
    profilePhotoNameSuffix,
    profilePhotoUpdateCnt,
    messageTokenId,
    informationModifiedTime,
    interestingCategories,
    interestingCourses,
    goal,
    continualUntilGoalDate,
    lessonPlanMonday,
    lessonPlanTuesday,
    lessonPlanWednesday,
    lessonPlanThursday,
    lessonPlanFriday,
    lessonPlanSaturday,
    lessonPlanSunday,
    timesAWeek,
    insertUserDocId,
    insertProgramId,
    insertTime,
    updateUserDocId,
    updateProgramId,
    updateTime,
    readableFlg,
    deleteFlg,

  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.users.put(insertUser);
  });

  return returnResult;

}





Future<int> updateIsarUserPhotoInfo(
  String? profilePhotoNameSuffix,
) async {

  User? targetUser =await selectIsarUser();

  targetUser?.profilePhotoNameSuffix=profilePhotoNameSuffix;
  targetUser?.profilePhotoUpdateCnt=targetUser.profilePhotoUpdateCnt!+1;

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.users.put(targetUser!);
  });

  return returnResult;

}

Future<int> deleteIsarUsers() async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.users.filter().deleteFlgEqualTo(false).deleteAll();
  });

  return returnInt;

}