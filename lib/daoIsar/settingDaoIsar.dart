import 'package:isar/isar.dart';
import '../entityIsar/settingEntityIsar.dart';

Future<Setting?> selectIsarSettingByCode(String settingCode) async {

  var isarInstance = Isar.getInstance();

  Setting? resultSetting;
  await isarInstance?.writeTxn((isar) async {
    List<Setting> resultList =
        await isar.settings.filter().settingCodeEqualTo(settingCode).findAll();

    if(resultList.isEmpty){
      resultSetting=null;
    }else{
      resultSetting=resultList[0];
    }
  });
  return resultSetting;
}

Future<List<Setting>?> selectIsarSettingAll() async {

  List<Setting>? resultSettingList;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    resultSettingList =
    await isar.settings.filter().not().idEqualTo(-1).findAll();

  });
  return resultSettingList;
}


Future<int> insertOrUpdateIsarSetting(
    Setting setting
    ) async {
  await deleteIsarSettingsByCode(setting.settingCode);
  return await insertIsarSetting(setting);

}


Future<int> insertIsarSetting(
    Setting setting
    ) async {

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.settings.put(setting);
  });

  return returnResult;

}

Future<int> deleteIsarSettingsByCode(String settingCode) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.settings.filter().not().idEqualTo(-1).deleteAll();
  });

  return returnInt;

}