import 'dart:typed_data';
import 'package:isar/isar.dart';
import '../entityIsar/masterEntityIsar.dart';

Future<Master?> selectIsarMasterByKey(String masterGroupCode,String code) async {

  var isarInstance = Isar.getInstance();

  Master? result;
  await isarInstance?.writeTxn((isar) async {
    result =
    await isar.masters.filter().masterGroupCodeEqualTo(masterGroupCode).and().codeEqualTo(code).findFirst();
  });
  return result;
}


Future<Master?> selectIsarMasterById(String masterDocId) async {

  var isarInstance = Isar.getInstance();

  Master? result;
  await isarInstance?.writeTxn((isar) async {
    result =
    await isar.masters.filter().masterDocIdEqualTo(masterDocId).findFirst();
  });
  return result;
}


Future<int> insertOrUpdateIsarMasterByMasterCode({
  required String masterDocId,
  required String masterGroupCode,
  required String code,
  required String name,
  required bool onMemoryFlg,
  DateTime? optionTime1,
  DateTime? optionTIme2,
  int? optionNumber1,
  int? optionNumber2,
  String? optionText1,
  String? optionText2,
  bool? optionBool1,
  bool? optionBool2,
  Uint8List? optionFile1,
  Uint8List? optionFile2,
  required String fileNameSuffix1,
  required String fileNameSuffix2,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,

}) async {

  Master? targetMaster =await selectIsarMasterById(masterDocId);

  int returnValue=0;
  if(targetMaster==null){
    returnValue= await insertIsarMaster(
      masterDocId:masterDocId,
      masterGroupCode:masterGroupCode,
      code:code,
      name:name,
      onMemoryFlg:onMemoryFlg,
      optionTime1:optionTime1,
      optionTIme2:optionTIme2,
      optionNumber1:optionNumber1,
      optionNumber2:optionNumber2,
      optionText1:optionText1,
      optionText2:optionText2,
      optionBool1:optionBool1,
      optionBool2:optionBool2,
      optionFile1:optionFile1,
      optionFile2:optionFile2,
      fileNameSuffix1:fileNameSuffix1,
      fileNameSuffix2:fileNameSuffix2,
      insertUserDocId:insertUserDocId,
      insertProgramId:insertProgramId,
      insertTime:insertTime,
      updateUserDocId:updateUserDocId,
      updateProgramId:updateProgramId,
      updateTime:updateTime,
      readableFlg:readableFlg,
      deleteFlg:deleteFlg,
    );

  }else{

    returnValue= await updateIsarMasterByCode(
      masterDocId:masterDocId,
      masterGroupCode:masterGroupCode,
      code:code,
      name:name,
      onMemoryFlg:onMemoryFlg,
      optionTime1:optionTime1,
      optionTIme2:optionTIme2,
      optionNumber1:optionNumber1,
      optionNumber2:optionNumber2,
      optionText1:optionText1,
      optionText2:optionText2,
      optionBool1:optionBool1,
      optionBool2:optionBool2,
      optionFile1:optionFile1,
      optionFile2:optionFile2,
      fileNameSuffix1:fileNameSuffix1,
      fileNameSuffix2:fileNameSuffix2,
      insertUserDocId:insertUserDocId,
      insertProgramId:insertProgramId,
      insertTime:insertTime,
      updateUserDocId:updateUserDocId,
      updateProgramId:updateProgramId,
      updateTime:updateTime,
      readableFlg:readableFlg,
      deleteFlg:deleteFlg,

    );

  }

  return returnValue;

}


Future<int> insertIsarMaster({
  required String masterDocId,
  required String masterGroupCode,
  required String code,
  required String name,
  required bool onMemoryFlg,
  DateTime? optionTime1,
  DateTime? optionTIme2,
  int? optionNumber1,
  int? optionNumber2,
  String? optionText1,
  String? optionText2,
  bool? optionBool1,
  bool? optionBool2,
  Uint8List? optionFile1,
  Uint8List? optionFile2,
  required String fileNameSuffix1,
  required String fileNameSuffix2,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,
}) async {

  Master insertMaster = Master(
    masterDocId,
    masterGroupCode,
    code,
    name,
    onMemoryFlg,
    optionTime1,
    optionTIme2,
    optionNumber1,
    optionNumber2,
    optionText1,
    optionText2,
    optionBool1,
    optionBool2,
    optionFile1,
    optionFile2,
    fileNameSuffix1,
    fileNameSuffix2,
    insertUserDocId,
    insertProgramId,
    insertTime,
    updateUserDocId,
    updateProgramId,
    updateTime,
    readableFlg,
    deleteFlg,

  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.masters.put(insertMaster);
  });

  return returnResult;

}

Future<int> updateIsarMasterByCode({
  required String masterDocId,
  required String masterGroupCode,
  required String code,
  required String name,
  required bool onMemoryFlg,
  DateTime? optionTime1,
  DateTime? optionTIme2,
  int? optionNumber1,
  int? optionNumber2,
  String? optionText1,
  String? optionText2,
  bool? optionBool1,
  bool? optionBool2,
  Uint8List? optionFile1,
  Uint8List? optionFile2,
  required String fileNameSuffix1,
  required String fileNameSuffix2,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,
}) async {


  Master? targetMaster =await selectIsarMasterById(masterDocId);

  Master updateMaster = setIsarMasterParameters(
      inputMaster: targetMaster!,
    masterDocId:masterDocId,
    masterGroupCode:masterGroupCode,
    code:code,
    name:name,
    onMemoryFlg:onMemoryFlg,
    optionTime1:optionTime1,
    optionTIme2:optionTIme2,
    optionNumber1:optionNumber1,
    optionNumber2:optionNumber2,
    optionText1:optionText1,
    optionText2:optionText2,
    optionBool1:optionBool1,
    optionBool2:optionBool2,
    optionFile1:optionFile1,
    optionFile2:optionFile2,
    fileNameSuffix1:fileNameSuffix1,
    fileNameSuffix2:fileNameSuffix2,
    insertUserDocId:insertUserDocId,
    insertProgramId:insertProgramId,
    insertTime:insertTime,
    updateUserDocId:updateUserDocId,
    updateProgramId:updateProgramId,
    updateTime:updateTime,
    readableFlg:readableFlg,
    deleteFlg:deleteFlg,
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.masters.put(updateMaster);
  });

  return returnResult;

}

Future<int> deleteIsarMastersById(String masterDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.masters.filter().masterDocIdEqualTo(masterDocId).deleteAll();
  });

  return returnInt;

}



Master setIsarMasterParameters({
  required Master inputMaster,
  required String masterDocId,
  required String masterGroupCode,
  required String code,
  required String name,
  required bool onMemoryFlg,
  DateTime? optionTime1,
  DateTime? optionTIme2,
  int? optionNumber1,
  int? optionNumber2,
  String? optionText1,
  String? optionText2,
  bool? optionBool1,
  bool? optionBool2,
  Uint8List? optionFile1,
  Uint8List? optionFile2,
  required String fileNameSuffix1,
  required String fileNameSuffix2,
  String? insertUserDocId,
  String? insertProgramId,
  DateTime? insertTime,
  String? updateUserDocId,
  String? updateProgramId,
  DateTime? updateTime,
  bool? readableFlg,
  bool? deleteFlg,
}){

  Master tmpMaster =inputMaster;
  tmpMaster.masterDocId=masterDocId;
  tmpMaster.masterGroupCode=masterGroupCode;
  tmpMaster.code=code;
  tmpMaster.name=name;
  tmpMaster.onMemoryFlg=onMemoryFlg;
  tmpMaster.optionTime1=optionTime1;
  tmpMaster.optionTIme2=optionTIme2;
  tmpMaster.optionNumber1=optionNumber1;
  tmpMaster.optionNumber2=optionNumber2;
  tmpMaster.optionText1=optionText1;
  tmpMaster.optionText2=optionText2;
  tmpMaster.optionBool1=optionBool1;
  tmpMaster.optionBool2=optionBool2;
  tmpMaster.optionFile1=optionFile1;
  tmpMaster.optionFile2=optionFile2;
  tmpMaster.fileNameSuffix1=fileNameSuffix1;
  tmpMaster.fileNameSuffix2=fileNameSuffix2;
  tmpMaster.insertUserDocId=insertUserDocId;
  tmpMaster.insertProgramId=insertProgramId;
  tmpMaster.insertTime=insertTime;
  tmpMaster.updateUserDocId=updateUserDocId;
  tmpMaster.updateProgramId=updateProgramId;
  tmpMaster.updateTime=updateTime;
  tmpMaster.readableFlg=readableFlg;
  tmpMaster.deleteFlg=deleteFlg;
  return tmpMaster;
}