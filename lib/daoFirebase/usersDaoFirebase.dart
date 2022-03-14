

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


Future<DocumentSnapshot> selectFirebaseUserByUserDocId(String userDocId)async{
  DocumentSnapshot snapshot  = await FirebaseFirestore.instance
      .collection('users')
      .doc(userDocId)
      .get();

  return snapshot;
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
          'profilePhotoNameSuffix':"",
          'profilePhotoUpdateCnt': 0,
          'messageTokenId':"",
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