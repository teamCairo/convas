import 'package:convas/entityIsar/chatDetailEntityIsar.dart';
import 'package:convas/entityIsar/eventEntityIsar.dart';
import 'package:convas/entityIsar/friendEntityIsar.dart';
import 'package:convas/entityIsar/masterEntityIsar.dart';
import 'package:convas/entityIsar/settingEntityIsar.dart';
import 'package:convas/entityIsar/topicEntityIsar.dart';
import 'package:convas/entityIsar/userEntityIsar.dart';
import 'package:isar/isar.dart';

import 'loginLogic.dart';

Future<void> clearLocalData()async{
  await openIsarInstances();
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    await isar.chatDetails.clear();
    await isar.events.clear();
    await isar.friends.clear();
    await isar.users.clear();
    await isar.masters.clear();
    await isar.settings.clear();
    await isar.topics.clear();
  });
}