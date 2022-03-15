import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String getMasterName(String masterName, String code, WidgetRef ref){

  switch(masterName){
    case "level":
    return ref.watch(masterDataProvider).levelMasterData[code];
    case "country":
    return ref.watch(masterDataProvider).countryMasterData[code];
    case "language":
    return ref.watch(masterDataProvider).languageMasterData[code];
    case "gender":
    return ref.watch(masterDataProvider).genderMasterData[code];
    case "lastLogin":
      return ref.watch(masterDataProvider).lastLoginMasterData[code];
    case "userType":
      return ref.watch(masterDataProvider).userTypeMasterData[code];
    default:
      return "";
  }

}


Map<String,String> getMasterMap(String masterName, WidgetRef ref){

  switch(masterName){
    case "level":
      return ref.watch(masterDataProvider).levelMasterData;
    case "country":
      return ref.watch(masterDataProvider).countryMasterData;
    case "language":
      return ref.watch(masterDataProvider).languageMasterData;
    case "gender":
      return ref.watch(masterDataProvider).genderMasterData;
    case "lastLogin":
      return ref.watch(masterDataProvider).lastLoginMasterData;
    case "userType":
      return ref.watch(masterDataProvider).userTypeMasterData;
    default:
      return {};
  }

}

final masterDataProvider = ChangeNotifierProvider(
      (ref) => MasterDataProvider(),
);


class MasterDataProvider extends ChangeNotifier {
  final Map<String,String> _levelMasterData={
    "1":"beginner",
    "2":"intermediate",
    "3":"advanced",
    "4":"native",
  };
  get levelMasterData => _levelMasterData ;

  final Map<String,String> _genderMasterData={
    "1":"male",
    "2":"female",
    "3":"other",

  };
  get genderMasterData => _genderMasterData ;

  final Map<String,String> _languageMasterData={
    "ENG":"English",
    "JPN":"Japanese",
    "CHN":"Chinese",
    "SPN":"Spanish",
  };
  get languageMasterData => _languageMasterData ;

  final Map<String,String> _countryMasterData={
    "USA":"America",
    "GBR":"United Kingdom",
    "JPN":"Japan",
    "CHN":"China",
    "SPN":"Spain",
    "AFG":"Afghanistan",
    "ALB":"Albania",
    "DZA":"Algeria",
    "AND":"Andorra",
    "AGO":"Angola",
    "AIA":"Anguilla",
    "ATA":"Antarctica",
    "ATG":"Antigua and Barbuda",
    "ARG":"Argentina",
  };
  get countryMasterData => _countryMasterData ;

  final Map<String,String> _lastLoginMasterData={
    "1":"Today",
    "2":"Last 3days",
    "3":"This week",
    "4":"This month",
  };
  get lastLoginMasterData => _lastLoginMasterData ;

  final Map<String,String> _userTypeMasterData={
    "1":"User",
    "2":"Teacher",
  };
  get userTypeMasterData => _userTypeMasterData ;
}

