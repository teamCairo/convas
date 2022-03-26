import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoIsar/settingDaoIsar.dart';
import '../../daoIsar/topicDaoIsar.dart';
import '../logic/commonLogicFile.dart';

final topicDataProvider = ChangeNotifierProvider(
      (ref) => TopicDataNotifier(),
);

class TopicDataNotifier extends ChangeNotifier {
  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;
  DateTime? updateCheckTime;

  void closeStream() async {
    streamSub!.cancel();
  }

  void controlStreamOfReadTopicNewDataFromFirebaseToIsar(WidgetRef ref)async {

    streamSub=await readTopicNewDataFromFirebaseToIsar( ref);

    if(controller.hasListener){

    }else{
      controller.stream.listen((value) async {
        if(value=="listen"){
          streamSub=await readTopicNewDataFromFirebaseToIsar( ref);
        }

        if(value=="cancel"){
          streamSub!.cancel();
        }

      });
    }

  }

  Future<StreamSubscription<QuerySnapshot>> readTopicNewDataFromFirebaseToIsar(WidgetRef ref) async {
    updateCheckTime ??= await selectIsarSettingUpdateCheckTimeByEntityName("topics");

    _callStream = FirebaseFirestore.instance
        .collection('topics')
        .where('updateTime',
        isGreaterThan: Timestamp.fromDate(updateCheckTime!))
        .where('readableFlg', isEqualTo: true)
        .orderBy('updateTime', descending: false)
        .snapshots();


    StreamSubscription<QuerySnapshot> streamSub=_callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

        controller.sink.add("cancel");

        for(int i=0;i<snapshot.size;i++){

          if(snapshot.docs[i].get("deleteFlg")){

            await deleteIsarTopicsById(snapshot.docs[i].id);

          }else{

            //画像ファイルの取得
            FirebaseStorage storage = FirebaseStorage.instance;
            Reference imageRef = storage.ref().child("topics").child(snapshot.docs[i].id + snapshot.docs[i].get("photoNameSuffix"));
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

            insertOrUpdateIsarTopic(
                topicDocId: snapshot.docs[i].id,
                topicName: snapshot.docs[i].get("topicName"),
                categoryDocId: snapshot.docs[i].get("categoryDocId"),
                categoryName: snapshot.docs[i].get("categoryName"),
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
                deleteFlg: snapshot.docs[i].get("deleteFlg"),

            );
          }
        }

        updateCheckTime=snapshot.docs[snapshot.size-1].get("updateTime").toDate();
        insertOrUpdateIsarSettingUpdateCheckTime(
            "topics",
            snapshot.docs[snapshot.size-1].get("updateTime").toDate()
        );
        controller.sink.add("listen");
        notifyListeners();
      }

    });
    return streamSub;
  }
}
