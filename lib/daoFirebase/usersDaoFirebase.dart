

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/userProvider.dart';


Future<QuerySnapshot> selectFirebaseUserByEmail(String email)async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  return snapshot;
}


Future<QuerySnapshot> selectFirebaseAll()async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .get();

  return snapshot;
}

Future<QuerySnapshot> selectFirebaseByUserDocIdList(List<String> strList)async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where(FieldPath.documentId,whereIn:strList).
      get();

  return snapshot;
}


Future<DocumentSnapshot> selectFirebaseUserByUserDocId(String userDocId)async{
  DocumentSnapshot snapshot  = await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocId)
      .get();

  return snapshot;
}

Future<Map<String,dynamic>> selectFirebaseMapUserByUserDocId(String userDocId)async{
  DocumentSnapshot snapshot = await selectFirebaseUserByUserDocId(userDocId);
  Map<String,dynamic> returnMap = {};
  returnMap['userDocId']=userDocId;
  returnMap['name']=snapshot.get('name');
  returnMap['email']=snapshot.get('email');
  returnMap['birthDate']=snapshot.get('birthDate').toDate();
  returnMap['level']=snapshot.get('level');
  returnMap['occupation']=snapshot.get('occupation');
  returnMap['motherTongue']=snapshot.get('motherTongue');
  returnMap['country']=snapshot.get('country');
  returnMap['town']=snapshot.get('town');
  returnMap['homeCountry']=snapshot.get('homeCountry');
  returnMap['homeTown']=snapshot.get('homeTown');
  returnMap['gender']=snapshot.get('gender');
  returnMap['placeWannaGo']=snapshot.get('placeWannaGo');
  returnMap['greeting']=snapshot.get('greeting');
  returnMap['description']=snapshot.get('description');
  returnMap['userType']=snapshot.get('userType');
  returnMap['searchConditionAge']=snapshot.get('searchConditionAge');
  returnMap['searchConditionLevel']=snapshot.get('searchConditionLevel');
  returnMap['searchConditionMotherTongue']=snapshot.get('searchConditionMotherTongue');
  returnMap['searchConditionCountry']=snapshot.get('searchConditionCountry');
  returnMap['searchConditionGender']=snapshot.get('searchConditionGender');
  returnMap['searchConditionHomeCountry']=snapshot.get('searchConditionHomeCountry');
  returnMap['searchConditionLoginTime']=snapshot.get('searchConditionLoginTime');
  returnMap['searchConditionCategories']=snapshot.get('searchConditionCategories');
  returnMap['searchConditionCourses']=snapshot.get('searchConditionCourses');
  returnMap['searchConditionUserType']=snapshot.get('searchConditionUserType');
  returnMap['profilePhotoNameSuffix']=snapshot.get('profilePhotoNameSuffix');
  returnMap['profilePhotoUpdateCnt']=snapshot.get('profilePhotoUpdateCnt');
  returnMap['messageTokenId']=snapshot.get('messageTokenId');
  returnMap['onlineStatus']=snapshot.get('onlineStatus');
  returnMap['lastLoginTime']=snapshot.get('lastLoginTime').toDate();
  returnMap['informationModifiedTime']=snapshot.get('informationModifiedTime').toDate();
  returnMap['interestingCategories']=snapshot.get('interestingCategories');
  returnMap['interestingCourses']=snapshot.get('interestingCourses');
  returnMap['insertUserDocId']=snapshot.get('insertUserDocId');
  returnMap['insertProgramId']=snapshot.get('insertProgramId');
  returnMap['insertTime']=snapshot.get('insertTime').toDate();
  returnMap['updateUserDocId']=snapshot.get('updateUserDocId');
  returnMap['updateProgramId']=snapshot.get('updateProgramId');
  returnMap['updateTime']=snapshot.get('updateTime').toDate();
  returnMap['readableFlg']=snapshot.get('readableFlg');
  return returnMap;
}

Future<String> insertFirebaseUser({
  String? name,
  required String email,
  DateTime? birthDate,
  String? level,
  String? occupation,
  String? motherTongue,
  String? country,
  String? town,
  String? homeCountry,
  String? homeTown,
  String? gender,
  String? placeWannaGo,
  String? greeting,
  String? description,
  String? userType,
  required String messageTokenId,
  bool? readableFlg,
  required String  programId
}) async {

  String insertedDocId="";
    await FirebaseFirestore.instance.collection('users').add(
        {
          'email': email,
          'name': name,
          'birthDate': birthDate==null?null:Timestamp.fromDate(birthDate),
          'level': level,
          'occupation': occupation,
          'motherTongue': motherTongue,
          'country': country,
          'town': town,
          'homeCountry': homeCountry,
          'homeTown': homeTown,
          'gender': gender,
          'placeWannaGo': placeWannaGo,
          'greeting': greeting,
          'description': description,
          'userType':"1",
          'searchConditionAge': '18, 100',
          'searchConditionLevel': '',
          'searchConditionMotherTongue': '',
          'searchConditionCountry': '',
          'searchConditionGender': '',
          'searchConditionHomeCountry': '',
          'searchConditionLoginTime': '3',
          'searchConditionCategories': '',
          'searchConditionCourses': '',
          'searchConditionUserType': '',
          'profilePhotoNameSuffix':"",
          'profilePhotoUpdateCnt': 0,
          'messageTokenId':messageTokenId,
          'onlineStatus':false,
          'lastLoginTime':FieldValue.serverTimestamp(),
          'informationModifiedTime': FieldValue.serverTimestamp(),
          'interestingCategories':"",
          'interestingCourses':"",
          'insertUserDocId':"myself",
          'insertProgramId': programId,
          'insertTime': FieldValue.serverTimestamp(),
          'updateUserDocId':"myself",
          'updateProgramId': programId,
          'updateTime': FieldValue.serverTimestamp(),
          'readableFlg': readableFlg??true,
          'deleteFlg': false,
        }).then((value){
      insertedDocId=value.id;
    });

  return insertedDocId;
}

Future<void> updateUserSelectedItem(WidgetRef ref,String databaseItem,dynamic value,String programId) async {
  String userDocId = ref
      .watch(userDataProvider.notifier)
      .userData["userDocId"]!;

  //TODO Name，Ageを変更する場合は、Friendデータも更新する
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocId)
      .update({
    databaseItem: value,
    'informationModifiedTime': FieldValue.serverTimestamp(),
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
}

Future<void> updateFirebaseUser({required String userDocId,
  required Map<String, Object?> data,
  required programId
}) async {
  data.addAll({
    'informationModifiedTime': FieldValue.serverTimestamp(),
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
  FirebaseFirestore.instance.collection('users').doc(userDocId).update(data);
}


Future<void> updateFirebaseUserHidden({required String userDocId,
  required Map<String, Object?> data,
  required programId
}) async {
  data.addAll({
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
  FirebaseFirestore.instance.collection('users').doc(userDocId).update(data);
}

Future<void> updateFirebaseUserPhotoInfo(String userDocId,int profilePhotoUpdateCnt,String profilePhotoNameSuffix,String programId)async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocId)
      .update({
    "profilePhotoUpdateCnt": profilePhotoUpdateCnt,
    "profilePhotoNameSuffix": profilePhotoNameSuffix,
    'informationModifiedTime': FieldValue.serverTimestamp(),
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
}