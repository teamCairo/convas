import 'dart:developer';

import 'package:convas/UIs/login/clearLocalData.dart';
import 'package:convas/UIs/register/dataPrepareingUI.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../faoFirebaseStorage/usersPhotoFaoFirebase.dart';
import '../login/loginLogic.dart';
import '../login/rootUI.dart';

Future<void> commonRegisterLogic(WidgetRef ref, BuildContext context)async{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? _currentUser = _auth.currentUser;
  await insertUser(ref,_currentUser!.email!);
  await initialProcessLogic(ref, _currentUser.email!);

  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Root()),
          (_) => false);
}

Future<void> insertUser(WidgetRef ref,String email)async {

  //メッセージトークンなどの取得
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String  messageTokenId=await _firebaseMessaging.getToken()??"";
  log("XXXXXXmessageTokenId:"+messageTokenId);

  String userDocId=await insertFirebaseUser(
      email: email,
      name: ref.watch(registerProvider).name,
      birthDate: ref.watch(registerProvider).birthDate,
      level: ref.watch(registerProvider).level,
      occupation: "",
      motherTongue: "",
      country: "",
      town: "",
      homeCountry: "",
      homeTown: "",
      gender: ref.watch(registerProvider).gender,
      placeWannaGo: "",
      greeting: "",
      description: "",
      profilePhotoNameSuffix:ref.watch(registerProvider).profilePhotoNameSuffix,
      userType:  ref.watch(registerProvider).userType,
      messageTokenId:messageTokenId,
      programId:"registerLogic",
      goal: ref.watch(registerProvider).goal,
      continualUntilGoalDate: ref.watch(registerProvider).continualUntil,
      lessonPlanMonday: ref.watch(registerProvider).monday,
      lessonPlanTuesday: ref.watch(registerProvider).tuesday,
      lessonPlanWednesday: ref.watch(registerProvider).wednesday,
      lessonPlanThursday: ref.watch(registerProvider).thursday,
      lessonPlanFriday: ref.watch(registerProvider).friday,
      lessonPlanSaturday: ref.watch(registerProvider).saturday,
      lessonPlanSunday: ref.watch(registerProvider).sunday,
      timesAWeek: ref.watch(registerProvider).timesAWeek,

  );

  await uploadAndInsertPhotoWhenRegister( ref,userDocId);

  await insertOrUpdateIsarSetting(Setting(
    "localUserInfo",
    email,
    userDocId,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ));

}