
import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/commonValues.dart';
import '../common/logic/commonLogic.dart';
import '../config/algolia_config.dart';
import 'package:flutter/services.dart';



Future<List<AlgoliaObjectSnapshot>> selectUsersByConditions(WidgetRef ref,{
  String? searchConditionAllKeyword,
  required String searchConditionAge,
  String? searchConditionLevel,
  String? searchConditionMotherTongue,
  String? searchConditionCountry,
  String? searchConditionGender,
  }) async {


  Algolia algolia = AlgoliaApplication.algolia;

  //searchConditionAllKeyword
  AlgoliaQuery query = algolia.instance.index('users').query(searchConditionAllKeyword??"");

  //searchConditionAge
  List<String> ageConditionList = fromTextToList(searchConditionAge);
  query.filters("age:" + ageConditionList[0] + " TO " + ageConditionList[1]);

  AlgoliaQuerySnapshot? snap = await query.getObjects();

  log("■■■■■■■■■■■ALGOLIA検索結果"+snap.hits.length.toString()+"件");

  return snap.hits;
}


Future<String> selectUsersByConditionsOnKotlin() async {
  String dateString = await platformForCallKotlin.invokeMethod('app');
  return dateString;
}