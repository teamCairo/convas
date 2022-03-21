import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/provider/chatDetailProvider.dart';
import 'package:convas/entityIsar/chatDetailEntityIsar.dart';
import 'package:convas/entityIsar/masterEntityIsar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/logic/commonLogicLog.dart';
import '../../common/provider/eventProvider.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/masterProvider.dart';
import '../../common/provider/topicProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/eventEntityIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../entityIsar/topicEntityIsar.dart';
import '../../entityIsar/userEntityIsar.dart';
import 'loginLogicMessage.dart';
import 'loginLogicOnlieStatus.dart';

Future<void> insertUserToFirebase(BuildContext context,WidgetRef ref, String email) async {


  await openIsarInstances();
  Setting? tmpSetting=await selectIsarSettingByCode("localUserInfo");
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
  insertOrUpdateIsarSettingBySettingCode(settingCode:"localUserInfo",
      stringValue1:email,
      stringValue2:userDocId
  );

  log("XXXXXXXXXXXユーザ登録終わり");

}


Future<void> initialProcessLogic(WidgetRef ref, String email) async {

  commonLogAddOthers(processName: 'login', processDescription: 'start loginProcess',moduleName:'initialProcessLogic');
  log("initialProcessLogic1行目");
  await makeDir("chat");
  await makeDir("media");

  await openIsarInstances();

  log("initialProcessLogic6行目くらい");
  await updateTimeCheck("events");
  await updateTimeCheck("topics");
  await updateTimeCheck("friends");
  await updateTimeCheck("masters");
  await updateTimeCheck("user");
  await updateTimeCheck("chatDetails");

  await ref.read(userDataProvider.notifier).readUserDataFromIsarToMemory();

  log("initialProcessLogic　readUserDataFromIsarToMemoryのあと");
  QuerySnapshot tmpUserData=await selectFirebaseUserByEmail(email);

  await insertOrUpdateIsarSettingBySettingCode(settingCode:"localUserInfo",
      stringValue1:tmpUserData.docs[0].get("email"),
      stringValue2:tmpUserData.docs[0].id
  );

  ref
      .read(userDataProvider.notifier)
      .controlStreamOfReadUserDataFirebaseToIsarAndMemory(email,tmpUserData.docs[0].id);


  await ref
      .read(masterDataProvider.notifier)
      .readMasterDataFromIsarToMemory();

  await ref
      .read(friendDataProvider.notifier)
      .readFriendDataFromIsarToMemory();

  await ref
      .read(eventDataProvider.notifier)
      .readEventDataFromIsarToMemory();


  ref
      .read(masterDataProvider.notifier)
      .readMasterFromFirebaseToIsarAndMemory();

  ref
      .read(friendDataProvider.notifier)
      .controlStreamOfReadFriendNewDataFromFirebaseToIsarAndMemory(ref,tmpUserData.docs[0].id);


  ref
      .read(chatDetailDataProvider.notifier)
      .controlStreamOfReadChatDetailNewDataFromFirebaseToIsar(tmpUserData.docs[0].id);
  
  ref
      .read(eventDataProvider.notifier)
      .controlStreamOfReadEventNewDataFromFirebaseToIsar(tmpUserData.docs[0].id);
  

  ref
      .read(topicDataProvider.notifier)
      .controlStreamOfReadTopicNewDataFromFirebaseToIsar();

  ref.read(userDataProvider.notifier).updateUserWhenLogin();

  listenNotification();
  updateOnlineStatus(ref,tmpUserData.docs[0].id);

  commonLogAddOthers(processName: 'login', processDescription: 'end loginProcess',moduleName:'initialProcessLogic');

}



Future<void> updateTimeCheck(String itemName) async {

  Setting? updateTime = await selectIsarSettingByCode(itemName + "UpdateCheck");
  if (updateTime == null) {
    await insertIsarSetting(settingCode:itemName + "UpdateCheck", dateTimeValue1:DateTime(2022, 1, 1, 0, 0));
  }
}

Future<void> makeDir(String dirName) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  final Directory appDocDirFolder = Directory("${appDocDir.path}/" + dirName);
  if (await appDocDirFolder.exists()) {
  } else {
    Directory(appDocDirFolder.path).createSync(recursive: true);
  }
}

Future<void> openIsarInstances() async {

  var isarInstance = Isar.getInstance();
  final dir = await getApplicationSupportDirectory();
  if (isarInstance == null) {
    await Isar.open(
      schemas: [SettingSchema,UserSchema,TopicSchema,EventSchema,FriendSchema,MasterSchema,ChatDetailSchema],
      directory: dir.path,
      inspector: true,
    );
  } else {
    if (!isarInstance.isOpen) {
      await Isar.open(
        schemas: [SettingSchema,UserSchema,TopicSchema,EventSchema,FriendSchema,MasterSchema,ChatDetailSchema],
        directory: dir.path,
        inspector: true,
      );
    }
  }
}