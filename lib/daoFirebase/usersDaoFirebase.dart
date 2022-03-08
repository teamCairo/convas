

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

Future<String> insertFirebaseUser({
  String? name,
  String? email,
  int? age,
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
  required String  programId
}) async {

  String insertedDocId="";
    await FirebaseFirestore.instance.collection('users').add(
        {
          'email': email,
          'name': name,
          'age': age,
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
          'searchConditionAge': '18,100',
          'searchConditionLevel': '1,2,3,4',
          'searchConditionNativeLang': 'ENG',
          'searchConditionCountry': '',
          'searchConditionGender': '1,2,3',
          'profilePhotoNameSuffix':"",
          'profilePhotoUpdateCnt': 0,
          'messageTokenId':"",
          'informationModifiedTime': FieldValue.serverTimestamp(),
          'interestingCategories':"",
          'interestingCourses':"",
          'insertUserDocId':"myself",
          'insertProgramId': programId,
          'insertTime': FieldValue.serverTimestamp(),
          'updateUserDocId':"myself",
          'updateProgramId': programId,
          'updateTime': FieldValue.serverTimestamp(),
          'readableFlg': true,
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
  required Map<String, Object?> data
}) async {
  FirebaseFirestore.instance.collection('users').doc(userDocId).update(data);

}

Future<void> updateFirebaseUserPhotoInfo(String userDocId,int profilePhotoUpdateCnt,String profilePhotoNameSuffix)async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocId)
      .update({
    "profilePhotoUpdateCnt": profilePhotoUpdateCnt,
    "profilePhotoNameSuffix": profilePhotoNameSuffix
  });
}