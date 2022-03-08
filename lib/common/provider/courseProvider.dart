import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/courseEntityIsar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../daoIsar/courseDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../entityIsar/courseEntityIsar.dart' as course;
import '../logic/commonLogic.dart';

final courseDataProvider = ChangeNotifierProvider(
      (ref) => CourseDataNotifier(),
);

class CourseDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<bool>();
  StreamSubscription<QuerySnapshot>? streamSub;

  void closeStream() async {
    streamSub!.cancel();
  }

  void clearIsar()async {


    deleteIsarSettingsByCode("coursesUpdateCheck");
    var isarInstance = Isar.getInstance();
    await isarInstance?.writeTxn((isar) async {
      isar.courses.clear();
    });
  }

  void controlStreamOfReadCourseNewDataFromFirebaseToIsar()async {
    //TODO パフォーマンスを鑑み、コースデータは常にリッスンしない

    //最初は必ず呼び出し
    //log("XXXXXXXXXXXXX初回readCourseNewDataFromFirebaseToHiveAndMemorycallする");
    streamSub=await readCourseNewDataFromFirebaseToIsar();
    //log("XXXXXXXXXXXXX初回readCourseNewDataFromFirebaseToHiveAndMemorycallした");

    if(controller.hasListener){

    }else{
      //log("XXXXXXXXXXXXXControlListener開始");
      //2回目以降は新しいデータを更新するたびに起動
      controller.stream.listen((value)  async{
        streamSub!.cancel();
        //log("XXXXXXXXXXXXXreadCourseNewDataFromFirebaseToHiveAndMemorycallする");
        streamSub=await readCourseNewDataFromFirebaseToIsar();
        //log("XXXXXXXXXXXXXreadCourseNewDataFromFirebaseToHiveAndMemorycallした");
      });
    }

  }

  Future<StreamSubscription<QuerySnapshot>> readCourseNewDataFromFirebaseToIsar() async {
    Setting? tmpSetting = await selectIsarSettingByCode("coursesUpdateCheck");
    DateTime courseUpdatedTime = tmpSetting!.dateTimeValue1!;

    ////log("XXXXXXXXXXXXXQueryする"+courseUpdatedTime.toString());
    _callStream = FirebaseFirestore.instance
        .collection('courses')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(courseUpdatedTime))
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();


    StreamSubscription<QuerySnapshot> streamSub=_callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {
        for(int i=0;i<snapshot.size;i++){

          if(snapshot.docs[i].get("deleteFlg")){

            await deleteIsarCoursesById(snapshot.docs[i].id);

          }else{

            //画像ファイルの取得
            FirebaseStorage storage = FirebaseStorage.instance;
            Reference imageRef = storage.ref().child("courses").child(snapshot.docs[i].id + snapshot.docs[i].get("photoNameSuffix"));
            String imageUrl = await imageRef.getDownloadURL();
            File imgFile=await urlToFile(imageUrl);
            Uint8List? bytes;

            await imgFile.readAsBytes().then((value) {
              bytes = Uint8List.fromList(value);
              log('reading of bytes is completed');
            }).catchError((onError) {
              log('Exception Error while reading audio from path:' +
                  onError.toString());
            });

            insertOrUpdateIsarCourse(
                courseDocId: snapshot.docs[i].id,
                courseName: snapshot.docs[i].get("courseName"),
                photoFile: bytes!,
                photoNameSuffix: snapshot.docs[i].get("photoNameSuffix"),
                photoUpdateCnt: snapshot.docs[i].get("photoUpdateCnt"),
                insertUserDocId: snapshot.docs[i].get("insertUserDocId"),
                insertProgramId: snapshot.docs[i].get("insertProgramId"),
                insertTime: snapshot.docs[i].get("insertTime").toDate(),
                updateUserDocId: snapshot.docs[i].get("updateUserDocId"),
                updateProgramId: snapshot.docs[i].get("updateProgramId"),
                updateTime: snapshot.docs[i].get("updateTime").toDate(),
                readableFlg: snapshot.docs[i].get("readableFlg"),
                deleteFlg: snapshot.docs[i].get("deleteFlg")

            );

          }
          if (snapshot.docs[i].get("updateTime").toDate().isAfter(courseUpdatedTime)) {
            await insertOrUpdateIsarSettingBySettingCode(
                settingCode: "coursesUpdateCheck",
                dateTimeValue1: snapshot.docs[i].get("updateTime").toDate()
            );
          }

        }
        controller.sink.add(true);
        notifyListeners();
      }

    });
    return streamSub;
  }
}
