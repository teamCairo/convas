import 'dart:typed_data';

import 'package:isar/isar.dart';

import '../entityIsar/topicEntityIsar.dart';

Future<Topic?> selectIsarTopicById(String topicDocId) async {

  var isarInstance = Isar.getInstance();
  Topic? resultTopic;
  await isarInstance?.writeTxn((isar) async {
    List<Topic> resultList =
    await isar.topics.filter().deleteFlgEqualTo(false).and().topicDocIdEqualTo(topicDocId).findAll();

    if(resultList.length == 0){
      resultTopic = null;
    }else{
      resultTopic = resultList[0];
    }
  });
  return resultTopic;
}


Future<int> insertOrUpdateIsarTopic({
  required String topicDocId,
  required String topicName,
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

  Topic? targetTopic =await selectIsarTopicById(topicDocId);

  int returnValue=0;
  if(targetTopic==null){
    returnValue= await insertIsarTopic(
      topicDocId: topicDocId,
      topicName: topicName,
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

    returnValue= await updateIsarTopic(
      topicDocId: topicDocId,
      topicName: topicName,
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


Future<int> insertIsarTopic({
  required String topicDocId,
  required String topicName,
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

  Topic insertTopic = Topic(
    topicDocId,
    topicName,
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
    returnResult=  await isar.topics.put(insertTopic);
  });

  return returnResult;

}



Future<int> updateIsarTopic({
  required String topicDocId,
  required String topicName,
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

  Topic? targetTopic =await selectIsarTopicById(topicDocId);

  Topic updateTopic = setIsarTopicParameters(
    inputTopic: targetTopic!,
    topicDocId: topicDocId,
    topicName: topicName,
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
    returnResult=  await isar.topics.put(updateTopic);
  });

  return returnResult;

}


Future<int> deleteIsarTopicsById(topicDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.topics.filter().deleteFlgEqualTo(false).and().topicDocIdEqualTo(topicDocId).deleteAll();
  });

  return returnInt;

}



Topic setIsarTopicParameters({
  required Topic inputTopic,
  required String topicDocId,
  required String topicName,
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

  Topic tmpTopic =inputTopic;
  tmpTopic.topicDocId=topicDocId;
  tmpTopic.topicName=topicName;
  tmpTopic.categoryDocId=categoryDocId;
  tmpTopic.categoryName=categoryName;
  tmpTopic.photoFile=photoFile;
  tmpTopic.photoNameSuffix=photoNameSuffix;
  tmpTopic.photoUpdateCnt=photoUpdateCnt;
  tmpTopic.insertUserDocId=insertUserDocId;
  tmpTopic.insertProgramId=insertProgramId;
  tmpTopic.insertTime=insertTime;
  tmpTopic.updateUserDocId=updateUserDocId;
  tmpTopic.updateProgramId=updateProgramId;
  tmpTopic.updateTime=updateTime;
  tmpTopic.readableFlg=readableFlg;
  tmpTopic.deleteFlg=deleteFlg;


  return tmpTopic;
}