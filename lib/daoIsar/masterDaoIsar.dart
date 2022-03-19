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


Future<List<Master>?> selectIsarMasterAll() async {
  var isarInstance = Isar.getInstance();

  List<Master>? resultList;
  await isarInstance?.writeTxn((isar) async {
    resultList =
    await isar.masters.filter().deleteFlgEqualTo(false).findAll();
  });
  return resultList;
}

Future<int> insertOrUpdateIsarMasterByMasterDocId(
 Master masterData
) async {

  await deleteIsarMastersById(masterData.masterDocId);
  return await insertIsarMaster(masterData);

}


Future<int> insertIsarMaster(
    Master masterData
) async {
  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.masters.put(masterData);
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