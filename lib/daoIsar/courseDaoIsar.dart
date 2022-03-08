import 'dart:developer';
import 'dart:typed_data';

import 'package:isar/isar.dart';

import '../entityIsar/courseEntityIsar.dart';

Future<Course?> selectIsarCourseById(String courseDocId) async {

  var isarInstance = Isar.getInstance();
  Course? resultCourse;
  await isarInstance?.writeTxn((isar) async {
    List<Course> resultList =
    await isar.courses.filter().deleteFlgEqualTo(false).courseDocIdEqualTo(courseDocId).findAll();

    if(resultList.length == 0){
      resultCourse = null;
    }else{
      resultCourse = resultList[0];
    }
  });
  return resultCourse;
}

Future<List<Course>?> selectIsarCourseAll() async {

  List<Course>? resultCourseList;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    resultCourseList =
    await isar.courses.filter().deleteFlgEqualTo(false).findAll();

    log("XXXXXXXXXXカテゴリ件数"+resultCourseList!.length.toString());
  });
  return resultCourseList;
}


Future<int> insertOrUpdateIsarCourse({
  required String courseDocId,
  required String courseName,
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

  Course? targetCourse =await selectIsarCourseById(courseDocId);

  int returnValue=0;
  if(targetCourse==null){
    returnValue= await insertIsarCourse(
      courseDocId: courseDocId,
      courseName: courseName,
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

    returnValue= await updateIsarCourse(
      courseDocId: courseDocId,
      courseName: courseName,
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


Future<int> insertIsarCourse({
  required String courseDocId,
  required String courseName,
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

  Course insertCourse = Course(
    courseDocId,
    courseName,
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
    returnResult=  await isar.courses.put(insertCourse);
  });

  return returnResult;

}



Future<int> updateIsarCourse({
  required String courseDocId,
  required String courseName,
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

  Course? targetCourse =await selectIsarCourseById(courseDocId);

  Course updateCourse = setIsarCourseParameters(
    inputCourse: targetCourse!,
    courseDocId: courseDocId,
    courseName: courseName,
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
    returnResult=  await isar.courses.put(updateCourse);
  });

  return returnResult;

}


Future<int> deleteIsarCoursesById(courseDocId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.courses.filter().deleteFlgEqualTo(false).courseDocIdEqualTo(courseDocId).deleteAll();
  });

  return returnInt;

}



Course setIsarCourseParameters({
  required Course inputCourse,
  required String courseDocId,
  required String courseName,
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

  Course tmpCourse =inputCourse;
  tmpCourse.courseDocId=courseDocId;
  tmpCourse.courseName=courseName;
  tmpCourse.photoFile=photoFile;
  tmpCourse.photoNameSuffix=photoNameSuffix;
  tmpCourse.photoUpdateCnt=photoUpdateCnt;
  tmpCourse.insertUserDocId=insertUserDocId;
  tmpCourse.insertProgramId=insertProgramId;
  tmpCourse.insertTime=insertTime;
  tmpCourse.updateUserDocId=updateUserDocId;
  tmpCourse.updateProgramId=updateProgramId;
  tmpCourse.updateTime=updateTime;
  tmpCourse.readableFlg=readableFlg;
  tmpCourse.deleteFlg=deleteFlg;


  return tmpCourse;
}