import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    "USA":"English(USA)",
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
}

