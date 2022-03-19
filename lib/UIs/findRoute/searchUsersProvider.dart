import 'package:convas/common/logic/commonLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/commonValues.dart';
import '../../common/provider/userProvider.dart';
import '../../daoAlgolia/usersDaoAlgolia.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../faoFirebaseStorage/usersPhotoFaoFirebase.dart';


final searchUsersProvider = ChangeNotifierProvider(
      (ref) => SearchUsersNotifier(),
);

class SearchUsersNotifier extends ChangeNotifier {
  List<SearchHitUsers> _searchResultList = [];

  get searchResultList => _searchResultList;

  Map<String, Image?> _userImages = {};
  get userImages => _userImages;

  Map<String, List<String>> _userCategories = {};
  get userCategories => _userCategories;

  Map<int, bool?> _userImagesLoadStartFlg = {};
  get userImagesLoadStartFlg => _userImagesLoadStartFlg;

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

  String _tmpSearchConditionHomeCountry="";
  get  tmpSearchConditionHomeCountry => _tmpSearchConditionHomeCountry;

  String _tmpSearchConditionLoginTime="";
  get  tmpSearchConditionLoginTime => _tmpSearchConditionLoginTime;

  String _tmpSearchConditionCategories="";
  get  tmpSearchConditionCategories => _tmpSearchConditionCategories;

  String _tmpSearchConditionCourses="";
  get  tmpSearchConditionCourses => _tmpSearchConditionCourses;

  String _tmpSearchConditionUserType="";
  get  tmpSearchConditionUserType => _tmpSearchConditionUserType;

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
        'searchConditionHomeCountry':_tmpSearchConditionHomeCountry,
        'searchConditionLoginTime':_tmpSearchConditionLoginTime,
        'searchConditionCategories':_tmpSearchConditionCategories,
        'searchConditionCourses':_tmpSearchConditionCourses,
        'searchConditionUserType':_tmpSearchConditionUserType,
      }, programId: "searchUsers"
      , );

  }

  Future<void> searchUsers(WidgetRef ref)async {

    _userImages.clear();
    _userImagesLoadStartFlg.clear();
    _userCategories.clear();
    _searchResultList = await selectUsersByConditions(ref,
        searchConditionAge:_tmpSearchConditionAge,
        searchConditionLevel:_tmpSearchConditionLevel,
        searchConditionMotherTongue:_tmpSearchConditionMotherTongue,
        searchConditionCountry:_tmpSearchConditionCountry,
        searchConditionGender:_tmpSearchConditionGender,
        searchConditionHomeCountry:_tmpSearchConditionHomeCountry,
        searchConditionLoginTime:_tmpSearchConditionLoginTime,
        searchConditionCategories:_tmpSearchConditionCategories,
        searchConditionCourses:_tmpSearchConditionCourses,
        searchConditionUserType:_tmpSearchConditionUserType,
        searchConditionAllKeyword:"",
        userDocId: ref.watch(userDataProvider).userData["userDocId"]);
    _searchProcessFlg=false;
    notifyListeners();

  }

  void resetConditions(WidgetRef ref){
    _tmpSearchConditionAge=searchConditionAgeMin.toString()+", "+searchConditionAgeMax.toString();
    _tmpSearchConditionLevel="";
    _tmpSearchConditionMotherTongue="";
    _tmpSearchConditionCountry="";
    _tmpSearchConditionGender="";
    _tmpSearchConditionHomeCountry="";
    _tmpSearchConditionLoginTime="";
    _tmpSearchConditionCategories="";
    _tmpSearchConditionCourses="";
    _tmpSearchConditionUserType="";
    notifyListeners();

  }


  void readConditionsFromUserData(WidgetRef ref){

    _tmpSearchConditionAge=ref.watch(userDataProvider).userData["searchConditionAge"]!;
    _tmpSearchConditionLevel=ref.watch(userDataProvider).userData["searchConditionLevel"]!;
    _tmpSearchConditionMotherTongue=ref.watch(userDataProvider).userData["searchConditionMotherTongue"]!;
    _tmpSearchConditionCountry=ref.watch(userDataProvider).userData["searchConditionCountry"]!;
    _tmpSearchConditionGender=ref.watch(userDataProvider).userData["searchConditionGender"]!;
    _tmpSearchConditionHomeCountry=ref.watch(userDataProvider).userData["searchConditionHomeCountry"]!;
    _tmpSearchConditionLoginTime=ref.watch(userDataProvider).userData["searchConditionLoginTime"]!;
    _tmpSearchConditionCategories=ref.watch(userDataProvider).userData["searchConditionCategories"]!;
    _tmpSearchConditionCourses=ref.watch(userDataProvider).userData["searchConditionCourses"]!;
    _tmpSearchConditionUserType=ref.watch(userDataProvider).userData["searchConditionUserType"]!;
    notifyListeners();
  }

  void setSearchProcessingFlgTrue(){
    _searchProcessFlg=true;
    notifyListeners();
  }
  
  void setConditionByMap(WidgetRef ref,String databaseItem,Map<String,bool> values){

    List<String> tmpList =[];
    values.forEach((k, v){
      if(v){
        tmpList.add(k);
      }
    });

    String value=fromListToTextDot(tmpList);
    setCondition(ref, databaseItem, value);
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

      case "searchConditionHomeCountry":
        _tmpSearchConditionHomeCountry=value;
        break;

      case "searchConditionLoginTime":
        _tmpSearchConditionLoginTime=value;
        break;

      case "searchConditionCategories":
        _tmpSearchConditionCategories=value;
        break;

      case "searchConditionCourses":
        _tmpSearchConditionCourses=value;
        break;

      case "searchConditionUserType":
        _tmpSearchConditionUserType=value;
        break;
    }
    notifyListeners();
  }

  void setImage(String userDocId, Image? image){
    _userImages[userDocId]=image;
  }

  Future<void> setFriendPhotoAndCategories(WidgetRef ref,int index) async {

    _userImagesLoadStartFlg[index]=true;
    ref.read(searchUsersProvider.notifier).setImage(_searchResultList[index].objectID, await getUsersSmallPhoto(_searchResultList[index].objectID,_searchResultList[index].profilePhotoNameSuffix,ref));


    List<String> categoriesNameList=masterNameListFromText(_searchResultList[index].interestingCategories,"category",ref);

    _userCategories[_searchResultList[index].objectID]=categoriesNameList;
    notifyListeners();
  }
}
