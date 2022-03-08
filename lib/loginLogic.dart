import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/categoryEntityIsar.dart';
import 'package:convas/entityIsar/courseEntityIsar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'common/UI/commonUI.dart';
import 'common/provider/categoryProvider.dart';
import 'common/provider/courseProvider.dart';
import 'common/provider/topicProvider.dart';
import 'common/provider/userProvider.dart';
import 'daoFirebase/usersDaoFirebase.dart';
import 'daoIsar/settingDaoIsar.dart';
import 'entityIsar/settingEntityIsar.dart';
import 'entityIsar/topicEntityIsar.dart';
import 'entityIsar/userEntityIsar.dart';

Future<void> insertUserToFirebase(BuildContext context,WidgetRef ref, String email) async {


  await openIsarInstances();
  Setting? tmpSetting=await selectIsarSettingByCode("localUserInfo");
  if(tmpSetting==null) {

    await insertUser(ref,email);

  }else {
    if(tmpSetting.stringValue1!=email) {

      await showOkWarningDialog(context,"Different e-mail,Delete Local Data");

    }else{
      await insertUser(ref,email);

    }
  }
}

Future<void> insertUser(WidgetRef ref,String email)async {

  String userDocId=await insertFirebaseUser(
      email: email,
      name: "my name",
      age: 31,
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
      programId:"loginLogic"
  );
  insertOrUpdateIsarSettingBySettingCode(settingCode:"localUserInfo",
      stringValue1:email,
      stringValue2:userDocId
  );

  log("XXXXXXXXXXXユーザ登録終わり");

}


Future<void> initialProcessLogic(WidgetRef ref, String email) async {
  await makeDir("chatMessages");
  await makeDir("media");

  await openIsarInstances();

  await updateTimeCheck("courses");
  await updateTimeCheck("topics");
  await updateTimeCheck("friends");
  await updateTimeCheck("user");
  await updateTimeCheck("chatMessages");
  await updateTimeCheck("categories");
  await updateTimeCheck("countries");

  await ref.read(userDataProvider.notifier).readUserDataFromIsarToMemory();
  // await ref.read(friendDataProvider.notifier).readFriendDataFromHiveToMemory();
  // await ref.read(countryDataProvider.notifier).readCountryDataFromIsarToMemory();

  QuerySnapshot tmpUserData=await selectFirebaseUserByEmail(email);

  insertOrUpdateIsarSettingBySettingCode(settingCode:"localUserInfo",
      stringValue1:tmpUserData.docs[0].get("email"),
      stringValue2:tmpUserData.docs[0].id
  );

  ref
      .read(userDataProvider.notifier)
      .controlStreamOfReadUserDataFirebaseToIsarAndMemory(email);
  // ref
  //     .read(friendDataProvider.notifier)
  //     .controlStreamOfReadFriendNewDataFromFirebaseToHiveAndMemory(
  //     ref, boxSetting.get("userDocId"));
  ref
      .read(topicDataProvider.notifier)
      .controlStreamOfReadTopicNewDataFromFirebaseToIsar();
  ref
      .read(categoryDataProvider.notifier)
      .controlStreamOfReadCategoryNewDataFromFirebaseToIsar();
  ref
      .read(courseDataProvider.notifier)
      .controlStreamOfReadCourseNewDataFromFirebaseToIsar();
  // ref
  //     .read(chatMessagesDataProvider.notifier)
  //     .controlStreamOfReadChatMessageNewDataFromFirebaseToIsar(
  //     ref, boxSetting.get("userDocId"));

  // ref.read(countryDataProvider.notifier).controlStreamOfReadCountryNewDataFromFirebaseToIsarAndMemory();
  ref.read(userDataProvider.notifier).updateLastLoginTime();
  //TODO Master、Topic、Category、Countryは常にWatchする必要ないよね
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
      schemas: [SettingSchema,UserSchema,CategorySchema,TopicSchema,CourseSchema],
      directory: dir.path,
      inspector: true,
    );
  } else {
    if (!isarInstance.isOpen) {
      await Isar.open(
        schemas: [SettingSchema,UserSchema,CategorySchema,TopicSchema,CourseSchema],
        directory: dir.path,
        inspector: true,
      );
    }
  }
}