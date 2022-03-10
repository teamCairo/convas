
import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/logic/commonLogic.dart';
import '../common/provider/userProvider.dart';
import '../config/algolia_config.dart';

String addConditionList(WidgetRef ref,String conditionString, String conditionItemName,String itemName){

  if((ref.watch(userDataProvider).userData[conditionItemName]!)!=""){

    conditionString= conditionString + " AND (";

    List<String > countryConditionList=fromTextToList(ref.watch(userDataProvider).userData[conditionItemName]!);
    for(int i=0;i<countryConditionList.length;i++){
      if(i!=0){
        conditionString= conditionString + " OR ";
      }
      conditionString= conditionString + " "+itemName+":"+countryConditionList[i];
    }
    conditionString= conditionString + " )";
  }

  return conditionString;

}



Future<List<AlgoliaObjectSnapshot>> selectUsersByConditions(WidgetRef ref,{
  required String searchConditionAge,
  String? searchConditionLevel,
  String? searchConditionMotherTongue,
  String? searchConditionCountry,
  String? searchConditionGender,
  }) async {
  Algolia algolia = AlgoliaApplication.algolia;

  AlgoliaQuery query = algolia.instance.index('users').query("");
  AlgoliaQuerySnapshot? snap = await query.getObjects();

  List<String> ageConditionList = fromTextToList(searchConditionAge);

  String filterConditions =
      "age:" + ageConditionList[0] + " TO " + ageConditionList[1];


  query = query.filters(filterConditions);
  snap = await query.getObjects();

  log("■■■■■■■■■■■ALGOLIA検索結果"+snap.hits.length.toString()+"件");

  return snap.hits;
}