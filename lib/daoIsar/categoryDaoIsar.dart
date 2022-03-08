import 'dart:developer';
import 'dart:typed_data';

import 'package:isar/isar.dart';

import '../entityIsar/categoryEntityIsar.dart';

Future<Category?> selectIsarCategoryById(String categoryDocId) async {

  var isarInstance = Isar.getInstance();
  Category? resultCategory;
  await isarInstance?.writeTxn((isar) async {
    List<Category> resultList =
    await isar.categorys.filter().deleteFlgEqualTo(false).and().categoryDocIdEqualTo(categoryDocId).findAll();

    if(resultList.length == 0){
      resultCategory = null;
    }else{
      resultCategory = resultList[0];
    }
  });
  return resultCategory;
}

Future<List<Category>?> selectIsarCategoryAll() async {

  List<Category>? resultCategoryList;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    resultCategoryList =
    await isar.categorys.filter().deleteFlgEqualTo(false).findAll();

    log("XXXXXXXXXXカテゴリ件数"+resultCategoryList!.length.toString());
  });
  return resultCategoryList;
}


Future<int> insertOrUpdateIsarCategory({
  required String categoryDocId,
  required String categoryName,
  required Uint8List photoFile,
  required String photoNameSuffix,
  required int photoUpdateCnt,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,
}) async {

  Category? targetCategory =await selectIsarCategoryById(categoryDocId);

  int returnValue=0;
  if(targetCategory==null){
    returnValue= await insertIsarCategory(
      categoryDocId: categoryDocId,
      categoryName: categoryName,
      photoFile: photoFile,
      photoNameSuffix: photoNameSuffix,
      photoUpdateCnt: photoUpdateCnt,
      insertUserDocId: insertUserDocId,
      insertProgramId: insertProgramId,
      insertTime: insertTime,
      updateUserDocId: updateUserDocId,
      updateProgramId: updateProgramId,
      updateTime: updateTime,
      readableFlg: readableFlg,
      deleteFlg: deleteFlg,
    );

  }else{

    returnValue= await updateIsarCategory(
      categoryDocId: categoryDocId,
      categoryName: categoryName,
      photoFile: photoFile,
      photoNameSuffix: photoNameSuffix,
      photoUpdateCnt: photoUpdateCnt,
      insertUserDocId: insertUserDocId,
      insertProgramId: insertProgramId,
      insertTime: insertTime,
      updateUserDocId: updateUserDocId,
      updateProgramId: updateProgramId,
      updateTime: updateTime,
      readableFlg: readableFlg,
      deleteFlg: deleteFlg,


    );

  }

  return returnValue;

}


Future<int> insertIsarCategory({
  required String categoryDocId,
  required String categoryName,
  required Uint8List photoFile,
  required String photoNameSuffix,
  required int photoUpdateCnt,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,


}) async {

  Category insertCategory = Category(
    categoryDocId,
    categoryName,
    photoFile,
    photoNameSuffix,
    photoUpdateCnt,
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
    returnResult=  await isar.categorys.put(insertCategory);
  });

  return returnResult;

}



Future<int> updateIsarCategory({
  required String categoryDocId,
  required String categoryName,
  required Uint8List photoFile,
  required String photoNameSuffix,
  required int photoUpdateCnt,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,


}) async {

  Category? targetCategory =await selectIsarCategoryById(categoryDocId);

  Category updateCategory = setIsarCategoryParameters(
    inputCategory: targetCategory!,
    categoryDocId: categoryDocId,
    categoryName: categoryName,
    photoFile: photoFile,
    photoNameSuffix: photoNameSuffix,
    photoUpdateCnt: photoUpdateCnt,
    insertUserDocId: insertUserDocId,
    insertProgramId: insertProgramId,
    insertTime: insertTime,
    updateUserDocId: updateUserDocId,
    updateProgramId: updateProgramId,
    updateTime: updateTime,
    readableFlg: readableFlg,
    deleteFlg: deleteFlg,


  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.categorys.put(updateCategory);
  });

  return returnResult;

}


Future<int> deleteIsarCategorysById(categoryDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.categorys.filter().deleteFlgEqualTo(false).categoryDocIdEqualTo(categoryDocId).deleteAll();
  });

  return returnInt;

}



Category setIsarCategoryParameters({
  required Category inputCategory,
  required String categoryDocId,
  required String categoryName,
  required Uint8List photoFile,
  required String photoNameSuffix,
  required int photoUpdateCnt,
  required String insertUserDocId,
  required String insertProgramId,
  required DateTime insertTime,
  required String updateUserDocId,
  required String updateProgramId,
  required DateTime updateTime,
  required bool readableFlg,
  required bool deleteFlg,


}){

  Category tmpCategory =inputCategory;
  tmpCategory.categoryDocId=categoryDocId;
  tmpCategory.categoryName=categoryName;
  tmpCategory.photoFile=photoFile;
  tmpCategory.photoNameSuffix=photoNameSuffix;
  tmpCategory.photoUpdateCnt=photoUpdateCnt;
  tmpCategory.insertUserDocId=insertUserDocId;
  tmpCategory.insertProgramId=insertProgramId;
  tmpCategory.insertTime=insertTime;
  tmpCategory.updateUserDocId=updateUserDocId;
  tmpCategory.updateProgramId=updateProgramId;
  tmpCategory.updateTime=updateTime;
  tmpCategory.readableFlg=readableFlg;
  tmpCategory.deleteFlg=deleteFlg;


  return tmpCategory;
}