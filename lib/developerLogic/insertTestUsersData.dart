import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/logic/commonLogicFile.dart';
import '../common/provider/userProvider.dart';
import '../daoFirebase/usersDaoFirebase.dart';


Future<void> insertTestUserData(WidgetRef ref) async {
  insertUnitData(ref,"wendy",24,DateTime(1980,1,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/44295/image_190824233619.jpg");
  insertUnitData(ref,"gene",21,DateTime(1999,1,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/10061/image_170515223502.jpg");
  insertUnitData(ref,"macky",45,DateTime(1965,11,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/671/image.jpg");
  insertUnitData(ref,"marc",17,DateTime(2004,10,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/5069/image_161114054531.jpg");
  insertUnitData(ref,"wendy",50,DateTime(1980,5,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/13107/image_170819003830.jpg");
  insertUnitData(ref,"idolic",34,DateTime(1993,3,13,0,0),"JPN","https://cdn.with.is/uploads/group/icon/11649/170709201434.jpg");
  insertUnitData(ref,"mimi",78,DateTime(1954,1,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/4573/image_161028015519.jpg");
  insertUnitData(ref,"cail",29,DateTime(1994,1,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/3918/image_161001160804.jpg");
  insertUnitData(ref,"wan",70,DateTime(1987,1,1,0,0),"JPN","https://cdn.with.is/uploads/group/icon/2000/image_160807115050.jpg");
  insertUnitData(ref,"loi",41,DateTime(1997,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/22951/_.jpg");
  insertUnitData(ref,"coco",33,DateTime(1977,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/2037/image_160808024141.jpg");
  insertUnitData(ref,"ois",87,DateTime(1965,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/5427/image_161126023851.jpg");
  insertUnitData(ref,"lam",34,DateTime(1989,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/1027/image.jpg");
  insertUnitData(ref,"cindy",78,DateTime(2000,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/998/image.jpg");
  insertUnitData(ref,"qeii",29,DateTime(1999,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/9343/170415124610.jpg");
  insertUnitData(ref,"natsu",70,DateTime(1982,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/6158/image_161225174710.jpg");
  insertUnitData(ref,"wei",41,DateTime(1975,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/91860/image_220220063316.jpg");
  insertUnitData(ref,"sand",33,DateTime(1980,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/5554/image_161130012110.jpg");
  insertUnitData(ref,"u-ma",87,DateTime(1990,1,1,0,0),"USA","https://cdn.with.is/uploads/group/icon/7436/4Z20121221GZ0JPG00030300100.jpg");

}

Future<void> insertUnitData(WidgetRef ref, String name,int varForTypes,DateTime birthDate,String country,String photoURL)async {
  String insertedDocId = await insertFirebaseUser(
      name: name,
      email: name + "@gmail.com",
      birthDate: birthDate,
      level: ((varForTypes % 4) + 1).toString(),
      occupation: "employee",
      motherTongue: "ENG",
      country: country,
      town: "town",
      homeCountry: country,
      homeTown: "town",
      gender: ((varForTypes % 3) + 1).toString(),
      placeWannaGo: "none",
      greeting: "good morning I'm " + name,
      description: "hello nice to meet you I'm " + name+"1234567890223456789032345678904234567890523456789062345678907234567890823456789092345678900234567890",
      userType: ((varForTypes % 2) + 1).toString(),
      messageTokenId: "",
      readableFlg: false,
      programId: 'insertTestUsersData');

  FirebaseStorage storage = FirebaseStorage.instance;
  try {
    await storage
        .ref("profile/" + insertedDocId + "/mainPhoto" +
        photoURL.substring(photoURL.lastIndexOf('.')))
        .putFile(await urlToFile(photoURL));
  } catch (e) {
    log("画像保存でエラー");
  }

  try {
    await storage
        .ref("profile/" + insertedDocId + "/mainPhoto_small" +
        photoURL.substring(photoURL.lastIndexOf('.')))
        .putFile(await urlToFile(photoURL));
  } catch (e) {
    log("画像保存でエラー" + insertedDocId);
  }
  await updateFirebaseUser(
    userDocId: insertedDocId,
    data: {
    'profilePhotoNameSuffix': photoURL.substring(photoURL.lastIndexOf('.')),
    'readableFlg': true,
    'photoUpdateCnt': 1,
    'updateUserDocId': ref
        .watch(userDataProvider.notifier)
        .userData["userDocId"],
    'updateProgramId': "insertTestUserData",
    'updateTime': FieldValue.serverTimestamp()
  }, programId:  'insertTestUsersData', );

}