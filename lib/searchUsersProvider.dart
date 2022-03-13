import 'package:algolia/algolia.dart';
import 'package:convas/common/logic/commonLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/commonValues.dart';
import 'common/provider/userProvider.dart';
import 'daoAlgolia/usersDaoAlgolia.dart';
import 'daoFirebase/usersDaoFirebase.dart';
import 'faoFirebaseStorage/usersPhotoFaoFirebase.dart';


final searchUsersProvider = ChangeNotifierProvider(
      (ref) => SearchUsersNotifier(),
);

class SearchUsersNotifier extends ChangeNotifier {
  List<SearchHitUsers> _searchResultList = [];

  get searchResultList => _searchResultList;

  Map<String, Image?> _userImages = {};

  get userImages => _userImages;

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
    _userImages = {};
  }

  Future<void> setConditionsToFirebaseAndSearchUsers(WidgetRef ref)async {
    String userDocId =ref.watch(userDataProvider).userData["userDocId"];
    await searchUsers(ref);
    updateFirebaseUser(userDocId: userDocId,
      data: {
        'searchConditionAge':_tmpSearchConditionAge ,
        'searchConditionLevel':_tmpSearchConditionLevel,
        'searchConditionMotherTongue':_tmpSearchConditionMotherTongue,
        'searchConditionCountry':_tmpSearchConditionCountry,
        'searchConditionGender':_tmpSearchConditionGender,
      }, programId: "searchUsers"
      , );

  }

  Future<void> searchUsers(WidgetRef ref)async {

    _searchResultList = await selectUsersByConditions(ref,
        searchConditionAge:_tmpSearchConditionAge,
        searchConditionAllKeyword:"",
        userDocId: ref.watch(userDataProvider).userData["userDocId"]);

    await setFriendPhoto();
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
    notifyListeners();
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
    _userImages.clear();

    for (int i = 0; i < _searchResultList.length; i++) {
      getUsersSmallPhoto(_searchResultList[i].objectID,_searchResultList[i].profilePhotoNameSuffix);
    }
  }
}
