
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
  String? searchConditionLevel,
  String? searchConditionMotherTongue,
  String? searchConditionCountry,
  String? searchConditionGender,
  required String userDocId,
  }) async {



  List<String?> tmpList=[
    "users",//index name
    searchConditionAllKeyword,
    birthDateMinFromAge(int.parse(fromTextToList(searchConditionAge)[1])).millisecondsSinceEpoch.toString(),
    birthDateMaxFromAge(int.parse(fromTextToList(searchConditionAge)[0])).millisecondsSinceEpoch.toString(),
    searchConditionLevel,
    searchConditionMotherTongue,
    searchConditionCountry,
    searchConditionGender,
    userDocId,
  ];

  List<SearchHitUsers> searchUsersResult = await selectUsersByConditionsOnKotlin(tmpList);
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