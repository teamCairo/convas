import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/provider/chatDetailProvider.dart';
import 'package:convas/common/provider/settingProvider.dart';
import 'package:convas/daoIsar/settingDaoIsar.dart';
import 'package:convas/entityIsar/chatDetailEntityIsar.dart';
import 'package:convas/entityIsar/masterEntityIsar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/provider/eventProvider.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/masterProvider.dart';
import '../../common/provider/topicProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../entityIsar/eventEntityIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../entityIsar/topicEntityIsar.dart';
import '../../entityIsar/userEntityIsar.dart';
import 'loginLogicMessage.dart';
import 'loginLogicOnlieStatus.dart';

Future<void> insertUserToFirebase(BuildContext context,WidgetRef ref, String email) async {

  await openIsarInstances();
  Setting? tmpSetting = await selectIsarSettingByCode("localUserInfo");
  if(tmpSetting==null) {

    await insertUser(ref,email);

  }else {
    if(tmpSetting.stringValue1!=email) {

      await showOkWarningDialog(context,"Different E-mail,Delete Local Data");

    }else{
      await insertUser(ref,email);

    }
  }
}

Future<void> insertUser(WidgetRef ref,String email)async {

  //メッセージトークンなどの取得
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String  messageTokenId=await _firebaseMessaging.getToken()??"";
  log("XXXXXXmessageTokenId:"+messageTokenId);

  String userDocId=await insertFirebaseUser(
      email: email,
      name: "my name",
      birthDate: DateTime(1990,9,2,0,0),
      level: "1",
      occupation: "consultant",
      motherTongue: "JPN",
      country: "JPN",
      town: "Tokyo",
      homeCountry: "JPN",
      homeTown: "Nagano",
      gender: "1",
      placeWannaGo: "antarctic",
      greeting: "good morning",
      description: "I'm my name",
      userType: "1",
      messageTokenId:messageTokenId,
      programId:"loginLogic"
  );

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


Future<void> initialProcessLogic(WidgetRef ref, String email) async {

  await makeDir("media");

  await openIsarInstances();

  await ref.read(userDataProvider.notifier).readUserDataFromIsarToMemory();

  QuerySnapshot tmpUserData=await selectFirebaseUserByEmail(email);

  await insertOrUpdateIsarSetting(Setting(
    "localUserInfo",
    email,
    tmpUserData.docs[0].id,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ));

  ref
      .read(userDataProvider.notifier)
      .controlStreamOfReadUserDataFirebaseToIsarAndMemory(ref,email,tmpUserData.docs[0].id);

  await ref
      .read(masterDataProvider.notifier)
      .readMasterDataFromIsarToMemory();

  await ref
      .read(friendDataProvider.notifier)
      .readFriendDataFromIsarToMemory();

  await ref
      .read(masterDataProvider.notifier)
      .readMasterFromFirebaseToIsarAndMemory(ref);

  ref
      .read(friendDataProvider.notifier)
      .controlStreamOfReadFriendNewDataFromFirebaseToIsarAndMemory(ref,tmpUserData.docs[0].id);

  ref
      .read(chatDetailDataProvider.notifier)
      .controlStreamOfReadChatDetailNewDataFromFirebaseToIsar(ref,tmpUserData.docs[0].id);
  
  ref
      .read(eventDataProvider.notifier)
      .controlStreamOfReadEventNewDataFromFirebaseToIsar(ref,tmpUserData.docs[0].id);

  ref
      .read(topicDataProvider.notifier)
      .controlStreamOfReadTopicNewDataFromFirebaseToIsar(ref);

  ref.read(userDataProvider.notifier).updateUserWhenLogin(ref);

  listenNotification();
  updateOnlineStatus(ref,tmpUserData.docs[0].id);

}

Future<void> makeDir(String dirName) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  final Directory appDocDirFolder = Directory("${appDocDir.path}/" + dirName);
  if (await appDocDirFolder.exists()) {
  } else {
    Directory(appDocDirFolder.path).createSync(recursive: true);
  }
}

Future<Isar?> openIsarInstances() async {

  var isarInstance = Isar.getInstance();
  final dir = await getApplicationSupportDirectory();
  if (isarInstance == null) {
    await Isar.open(
      schemas: [SettingSchema,UserSchema,TopicSchema,EventSchema,FriendSchema,MasterSchema,ChatDetailSchema],
      directory: dir.path,
      inspector: true,
    );
    isarInstance = Isar.getInstance();
  } else {
    if (!isarInstance.isOpen) {
      await Isar.open(
        schemas: [SettingSchema,UserSchema,TopicSchema,EventSchema,FriendSchema,MasterSchema,ChatDetailSchema],
        directory: dir.path,
        inspector: true,
      );
    }
  }
  return isarInstance;
}