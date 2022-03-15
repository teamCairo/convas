
import 'dart:convert';
import 'dart:developer';
import 'package:convas/common/logic/commonLogic.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/commonValues.dart';

class SearchHitUsers {
  final String objectID;
  final String name;
  final String path;
  final int birthDate;
  final String country;
  final String gender;
  final String greeting;
  final String homeCountry;
  final String interestingCategories;
  final String interestingCourses;
  final int lastLoginTime;
  final String level;
  final String motherTongue;
  final String userType;
  final String profilePhotoNameSuffix;
  final bool onlineStatus;

  SearchHitUsers(this.objectID,
      this.name,
      this.path,
      this.birthDate,
      this.country,
      this.gender,
      this.greeting,
      this.homeCountry,
      this.interestingCategories,
      this.interestingCourses,
      this.lastLoginTime,
      this.level,
      this.motherTongue,
      this.userType,
      this.profilePhotoNameSuffix,
      this.onlineStatus,);

  static SearchHitUsers fromJson(Map<String, dynamic> json) {
    return SearchHitUsers(json['objectID'],
        json['name'],
        json['path'],
        json['birthDate'],
        json['country'],
        json['gender'],
        json['greeting'],
        json['homeCountry'],
        json['interestingCategories'],
        json['interestingCourses'],
        json['lastLoginTime'],
        json['level'],
        json['motherTongue'],
        json['userType'],
        json['profilePhotoNameSuffix'],
        json['onlineStatus']);
  }
}


Future<List<SearchHitUsers>> selectUsersByConditions(WidgetRef ref,{
  String? searchConditionAllKeyword,
  required String searchConditionAge,
  required String searchConditionLevel,
  required String searchConditionMotherTongue,
  required String searchConditionCountry,
  required String searchConditionGender,
  required String searchConditionHomeCountry,
  required String searchConditionLoginTime,
  required String searchConditionCategories,
  required String searchConditionCourses,
  required String searchConditionUserType,
  required String userDocId,
  }) async {

  int days =0;
  switch(searchConditionLoginTime){
    case "1":
      days = 1;
      break;

    case "2":
      days = 3;
      break;

    case "3":
      days = 7;
      break;

    case "4":
      days = 30;
      break;

    default:
      days = searchConditionLastLoginInDays;
      break;
  }



  List<String?> tmpList=[
    "users",//0
    searchConditionAllKeyword,//1
    birthDateMinFromAge(int.parse(fromTextToList(searchConditionAge)[1])).millisecondsSinceEpoch.toString(),//2
    birthDateMaxFromAge(int.parse(fromTextToList(searchConditionAge)[0])).millisecondsSinceEpoch.toString(),//3
    searchConditionLevel.replaceAll(", ", "@ "),//4
    searchConditionMotherTongue.replaceAll(", ", "@ "),//5
    searchConditionCountry.replaceAll(", ", "@ "),//6
    searchConditionGender.replaceAll(", ", "@ "),//7
    searchConditionHomeCountry.replaceAll(", ", "@ "),//8
    DateTime.now().add(Duration(days:days*-1)).millisecondsSinceEpoch.toString(),//9
    searchConditionCategories.replaceAll(", ", "@ "),//10
    searchConditionCourses.replaceAll(", ", "@ "),
    searchConditionUserType.replaceAll(", ", "@ "),
    userDocId,
  ];

  List<SearchHitUsers> searchUsersResult = await selectUsersByConditionsOnKotlin(tmpList);
  log("XXXXXXXXXXXXXX件数"+searchUsersResult.length.toString());
  return searchUsersResult;
}


Future<List<SearchHitUsers>> selectUsersByConditionsOnKotlin(List<String?> conditionsList) async {


  try {
  String response = await platformForCallKotlin.invokeMethod('selectUsersByConditionsOnKotlin',conditionsList);
  var decodedResponse= jsonDecode(response);
  var hitsList = (decodedResponse['hits'] as List).map((json) {
    return SearchHitUsers.fromJson(json);
  }).toList();
  return hitsList;
  } on PlatformException catch (_) {
    List<SearchHitUsers> tmpList =[];
    log("検索でエラー発生");
    return tmpList;
  }
}