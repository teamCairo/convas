import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/provider/chatDetailProvider.dart';
import 'package:convas/daoIsar/settingDaoIsar.dart';
import 'package:convas/entityIsar/chatDetailEntityIsar.dart';
import 'package:convas/entityIsar/masterEntityIsar.dart';
import 'package:flutter/cupertino.dart';
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
import '../register/setUserTypeUI.dart';
import '../register/welcomeLeanerUI.dart';
import 'clearLocalDataLogic.dart';
import 'loginLogicMessage.dart';
import 'loginLogicOnlieStatus.dart';


Future<void> userLocalDataCheckForInsert(String email, WidgetRef ref, BuildContext context)async {

  await openIsarInstances();
  Setting? tmpSetting = await selectIsarSettingByCode("localUserInfo");
  if(tmpSetting==null) {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return const SetUserType();
      }),
    );
  }else{
    if(tmpSetting.stringValue1==email){

    }else{
      await commonShowOkNgInfoDialog(
          context,
          "You have other user's data on local device.\nCan we delete them?",
              ()async{
            await clearLocalData();
            await Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) {
                return const SetUserType();
              }),
            );
          });
    }

  }
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