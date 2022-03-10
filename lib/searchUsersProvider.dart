import 'dart:developer';
import 'package:algolia/algolia.dart';
import 'package:convas/common/logic/commonLogic.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/commonValues.dart';
import 'common/provider/userProvider.dart';
import 'daoAlgolia/usersDaoAlgolia.dart';


final searchUsersProvider = ChangeNotifierProvider(
      (ref) => SearchUsersNotifier(),
);

class SearchUsersNotifier extends ChangeNotifier {
  List<AlgoliaObjectSnapshot> _searchResultList = [];

  get searchResultList => _searchResultList;

  Map<String, Image?> _friendImage = {};

  get friendImage => _friendImage;

  bool _searchProcessFlg=true;
  get  searchProcessFlg => _searchProcessFlg;

  String _tmpSearchConditionAge="";
  get  tmpSearchConditionAge => _tmpSearchConditionAge;

  String _tmpSearchConditionLevel="";
  get  tmpSearchConditionLevel => _tmpSearchConditionLevel;

  String _tmpSearchConditionMotherTongue="";
  get  tmpSearchConditionMotherTongue => _tmpSearchConditionMotherTongue;

  String _tmpSearchConditionCountry="";
  get  tmpSearchConditionCountry => _tmpSearchConditionCountry;

  String _tmpSearchConditionGender="";
  get  tmpSearchConditionGender => _tmpSearchConditionGender;

  void clear() {
    _searchResultList = [];
    _friendImage = {};
  }

  Future<void> searchUsers(WidgetRef ref)async {

    _searchResultList = await selectUsersByConditions(ref);
    setFriendPhoto();
    _searchProcessFlg=false;
    notifyListeners();

  }

  void resetConditions(WidgetRef ref){

    _tmpSearchConditionAge=searchConditionAgeMin.toString()+", "+searchConditionAgeMax.toString();

    _tmpSearchConditionLevel="";

    _tmpSearchConditionMotherTongue="";

    _tmpSearchConditionCountry="";

    _tmpSearchConditionGender="";
    notifyListeners();

  }


  void readConditionsFromUserData(WidgetRef ref){

    _tmpSearchConditionAge=ref.watch(userDataProvider).userData["searchConditionAge"]!;

    _tmpSearchConditionLevel=ref.watch(userDataProvider).userData["searchConditionLevel"]!;

    _tmpSearchConditionMotherTongue=ref.watch(userDataProvider).userData["searchConditionMotherTongue"]!;

    _tmpSearchConditionCountry=ref.watch(userDataProvider).userData["searchConditionCountry"]!;

    _tmpSearchConditionGender=ref.watch(userDataProvider).userData["searchConditionGender"]!;

    // notifyListeners();

  }

  void setSearchProcessingFlgTrue(){
    _searchProcessFlg=true;
  }
  
  void setConditionByMap(WidgetRef ref,String databaseItem,Map<String,bool> values){

    bool allTrueCheck=true;
    List<String> tmpList =[];
    values.forEach((k, v){
      if(v){
        tmpList.add(k);
      }else{
        allTrueCheck=false;
      }
    });

    String value="";

    if(allTrueCheck){

    }else{
      value=fromListToTextDot(tmpList);
    }
    
    switch(databaseItem){
      case "searchConditionAge":
        _tmpSearchConditionAge=value;
        break;

      case "searchConditionLevel":
        _tmpSearchConditionLevel=value;
        break;

      case "searchConditionMotherTongue":
        _tmpSearchConditionMotherTongue=value;
        break;

      case "searchConditionCountry":
        _tmpSearchConditionCountry=value;
        break;

      case "searchConditionGender":
        _tmpSearchConditionGender=value;
        break;
    }
    notifyListeners();
  }


  void setCondition(WidgetRef ref,String databaseItem,String value){
    switch(databaseItem){
      case "searchConditionAge":
        _tmpSearchConditionAge=value;
        break;

      case "searchConditionLevel":
        _tmpSearchConditionLevel=value;
        break;

      case "searchConditionMotherTongue":
        _tmpSearchConditionMotherTongue=value;
        break;

      case "searchConditionCountry":
        _tmpSearchConditionCountry=value;
        break;

      case "searchConditionGender":
        _tmpSearchConditionGender=value;
        break;
    }
    notifyListeners();
  }



  Future<void> setFriendPhoto() async {
    _friendImage.clear();
    FirebaseStorage storage = FirebaseStorage.instance;

    for (int i = 0; i < _searchResultList.length; i++) {
      String profilePhotoNameSuffix =
      _searchResultList[i].data["profilePhotoNameSuffix"];

      if (profilePhotoNameSuffix != "") {
        //写真が登録されている場合

        try {
          Reference imageRef = storage
              .ref()
              .child("profile")
              .child(_searchResultList[i].data["objectID"]!)
              .child("mainPhoto_small" + profilePhotoNameSuffix);
          await imageRef.getDownloadURL().then((imageUrl) {
            _friendImage[_searchResultList[i].data["objectID"]!] =
                Image.network(imageUrl, width: 90);
          });
        } catch (e) {
          //写真があるはずなのになぜかエラーだった
          log("写真あるはずなのになぜかエラーだった");
          _friendImage[_searchResultList[i].data["objectID"]!] = null;
        }
      } else {
        //写真が登録されていない場合

        _friendImage[_searchResultList[i].data["objectID"]!] = null;
      }
    }
  }
}
