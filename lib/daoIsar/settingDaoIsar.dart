import 'dart:developer';
import 'dart:typed_data';
import 'package:isar/isar.dart';
import '../entityIsar/settingEntityIsar.dart';

Future<Setting?> selectIsarSettingByCode(String settingCode) async {

  var isarInstance = Isar.getInstance();

  Setting? resultSetting;
  await isarInstance?.writeTxn((isar) async {
    List<Setting> resultList =
        await isar.settings.filter().settingCodeEqualTo(settingCode).findAll();

    log("XXXXXXXXXX"+resultList.length.toString()+"件");
    log("XXXXXXXXXX"+settingCode+"データあった");
    if(resultList.length==0){
      resultSetting=null;
    }else{
      resultSetting=resultList[0];
    }
  });
  return resultSetting;
}


Future<int> insertOrUpdateIsarSettingBySettingCode({required String settingCode,
  String? stringValue1,
  String? stringValue2,
  int? numberValue1,
  int? numberValue2,
  DateTime? dateTimeValue1,
  DateTime? dateTimeValue2,
  bool? boolValue1,
  bool? boolValue2,
  Uint8List? uint8ListValue1,
  Uint8List? uint8ListValue2,
}) async {

  Setting? targetSetting =await selectIsarSettingByCode(settingCode);

  int returnValue=0;
  if(targetSetting==null){
    returnValue= await insertIsarSetting(
        settingCode: settingCode,
        stringValue1:stringValue1,
        stringValue2:stringValue2,
        numberValue1:numberValue1,
        numberValue2:numberValue2,
        dateTimeValue1:dateTimeValue1,
        dateTimeValue2:dateTimeValue2,
        boolValue1:boolValue1,
        boolValue2:boolValue2,
        uint8ListValue1:uint8ListValue1,
        uint8ListValue2:uint8ListValue2);

  }else{

    returnValue= await updateIsarSettingByCode(
        settingCode: settingCode,
        stringValue1:stringValue1,
        stringValue2:stringValue2,
        numberValue1:numberValue1,
        numberValue2:numberValue2,
        dateTimeValue1:dateTimeValue1,
        dateTimeValue2:dateTimeValue2,
        boolValue1:boolValue1,
        boolValue2:boolValue2,
        uint8ListValue1:uint8ListValue1,
        uint8ListValue2:uint8ListValue2);

  }

  return returnValue;

}


Future<int> insertIsarSetting({required String settingCode,
  String? stringValue1,
  String? stringValue2,
  int? numberValue1,
  int? numberValue2,
  DateTime? dateTimeValue1,
  DateTime? dateTimeValue2,
  bool? boolValue1,
  bool? boolValue2,
  Uint8List? uint8ListValue1,
  Uint8List? uint8ListValue2,
}) async {

  Setting insertSetting = Setting(
      settingCode,
      stringValue1,
      stringValue2,
      numberValue1,
      numberValue2,
      dateTimeValue1,
      dateTimeValue2,
      boolValue1,
      boolValue2,
      uint8ListValue1,
      uint8ListValue2
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.settings.put(insertSetting);
  });

  return returnResult;

}

Future<int> updateIsarSettingByCode({required String settingCode,
  String? stringValue1,
  String? stringValue2,
  int? numberValue1,
  int? numberValue2,
  DateTime? dateTimeValue1,
  DateTime? dateTimeValue2,
  bool? boolValue1,
  bool? boolValue2,
  Uint8List? uint8ListValue1,
  Uint8List? uint8ListValue2,
}) async {

  Setting? targetSetting =await selectIsarSettingByCode(settingCode);

  Setting updateSetting = setIsarSettingParameters(
      inputSetting: targetSetting!,
      stringValue1:stringValue1,
      stringValue2:stringValue2,
      numberValue1:numberValue1,
      numberValue2:numberValue2,
      dateTimeValue1:dateTimeValue1,
      dateTimeValue2:dateTimeValue2,
      boolValue1:boolValue1,
      boolValue2:boolValue2,
      uint8ListValue1:uint8ListValue1,
      uint8ListValue2:uint8ListValue2
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.settings.put(updateSetting);
  });

  return returnResult;

}

Future<int> deleteIsarSettingsByCode(String settingCode) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.settings.filter().settingCodeEqualTo(settingCode).deleteAll();
  });

  return returnInt;

}



Setting setIsarSettingParameters({
  required Setting inputSetting,
  String? stringValue1,
  String? stringValue2,
  int? numberValue1,
  int? numberValue2,
  DateTime? dateTimeValue1,
  DateTime? dateTimeValue2,
  bool? boolValue1,
  bool? boolValue2,
  Uint8List? uint8ListValue1,
  Uint8List? uint8ListValue2,}){

  Setting tmpSetting =inputSetting;
  tmpSetting.stringValue1=stringValue1;
  tmpSetting.stringValue2=stringValue2;
  tmpSetting.numberValue1=numberValue1;
  tmpSetting.numberValue2=numberValue2;
  tmpSetting.dateTimeValue1=dateTimeValue1;
  tmpSetting.dateTimeValue2=dateTimeValue2;
  tmpSetting.boolValue1=boolValue1;
  tmpSetting.boolValue2=boolValue2;
  tmpSetting.uint8ListValue1=uint8ListValue1;
  tmpSetting.uint8ListValue2=uint8ListValue2;

  return tmpSetting;
}