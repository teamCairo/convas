
import 'dart:convert';
import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/commonValues.dart';
import '../common/logic/commonLogic.dart';
import '../config/algolia_config.dart';


class SearchHitUsers {
  final String firstname;
  final String lastname;
  // age,country,gender,greeting,homeCountry,interestingCategories,interestingCourses,lastLoginTime,level,motherTongue,name,userType,profilePhotoNameSuffix,onlineStatus
  SearchHitUsers(this.firstname, this.lastname);

  static SearchHitUsers fromJson(Map<String, dynamic> json) {
    return SearchHitUsers(json['firstname'], json['lastname']);
  }
}


Future<List<AlgoliaObjectSnapshot>> selectUsersByConditions(WidgetRef ref,{
  String? searchConditionAllKeyword,
  required String searchConditionAge,
  String? searchConditionLevel,
  String? searchConditionMotherTongue,
  String? searchConditionCountry,
  String? searchConditionGender,
  }) async {

  List<String?> tmpList=[
    searchConditionAllKeyword,
    searchConditionAge,
    searchConditionLevel,
    searchConditionMotherTongue,
    searchConditionCountry,
    searchConditionGender,
  ];

  await selectUsersByConditionsOnKotlin(tmpList);
  Algolia algolia = AlgoliaApplication.algolia;

  //searchConditionAllKeyword
  AlgoliaQuery query = algolia.instance.index('test').query(searchConditionAllKeyword??"");

  //searchConditionAge
  List<String> ageConditionList = fromTextToList(searchConditionAge);
  query.filters("age:" + ageConditionList[0] + " TO " + ageConditionList[1]);

  AlgoliaQuerySnapshot? snap = await query.getObjects();

  log("■■■■■■■■■■■ALGOLIA検索結果"+snap.hits.length.toString()+"件");

  return snap.hits;
}


Future<List<SearchHitUsers>?> selectUsersByConditionsOnKotlin(List<String?> conditionsList) async {


  try {
  String response = await platformForCallKotlin.invokeMethod('selectUsersByConditionsOnKotlin',conditionsList);
  var decodedResponse= jsonDecode(response);
  var hitsList = (decodedResponse['hits'] as List).map((json) {
    return SearchHitUsers.fromJson(json);
  }).toList();
  return hitsList;
  } on PlatformException catch (_) {

    log("検索でエラー発生");
    return null;
  }
}