import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/entityIsar/masterEntityIsar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import '../faoFirebaseStorage/mastersImageFaoFirebase.dart';

Future<String> insertFirebaseMaster(WidgetRef ref,
    String masterGroupCode,
    String code,
    String name,
    bool onMemoryFlg,
    DateTime? optionTime1,
    DateTime? optionTime2,
    int? optionNumber1,
    int? optionNumber2,
    String? optionText1,
    String? optionText2,
    bool? optionBool1,
    bool? optionBool2,
    File? optionFile1,
    File? optionFile2,
    String? programId,
    String userDocId,
    ) async {

  String insertedDocId="";
  String pathStrFile1="";
  String pathStrFile2="";
  try {
    FirebaseStorage storage =FirebaseStorage.instance;
    if(optionFile1!=null){
      pathStrFile1= optionFile1.path;
      await storage.ref("masters/" + masterGroupCode+"/" +code+"_1"+ pathStrFile1.substring(pathStrFile1.lastIndexOf('.'),))
          .putFile(optionFile1);
    }

    if(optionFile2!=null){
      pathStrFile2= optionFile2.path;
      await storage.ref("masters/" + masterGroupCode+"/" +code+"_2"+pathStrFile2.substring(pathStrFile2.lastIndexOf('.'),))
          .putFile(optionFile2);
    }

    await FirebaseFirestore.instance.collection('masters').add(
      {'masterGroupCode': masterGroupCode,
        'code': code,
        'name': name,
        'onMemoryFlg': onMemoryFlg,
        'optionTime1': optionTime1==null?null:Timestamp.fromDate(optionTime1),
        'optionTime2': optionTime2==null?null:Timestamp.fromDate(optionTime2),
        'optionNumber1': optionNumber1,
        'optionNumber2': optionNumber2,
        'optionText1': optionText1,
        'optionText2': optionText2,
        'optionBool1': optionBool1,
        'optionBool2': optionBool2,
        'fileNameSuffix1': pathStrFile1==""?"":pathStrFile1.substring(pathStrFile1.lastIndexOf('.')),
        'fileNameSuffix2': pathStrFile2==""?"":pathStrFile2.substring(pathStrFile2.lastIndexOf('.')),
        'insertUserDocId':userDocId,
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      },
    ).then((value){
      insertedDocId=value.id;
    });

    return insertedDocId;

  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<void> updateFirebaseMasterPhotoInfo(String masterDocId,String userDocId,String fileNameSuffix1,String fileNameSuffix2,String programId)async {
  await FirebaseFirestore.instance
      .collection('masters')
      .doc(masterDocId)
      .update({
    "fileNameSuffix1": fileNameSuffix1,
    "fileNameSuffix2": fileNameSuffix2,
    'updateUserDocId': userDocId,
    'updateProgramId': programId,
    'updateTime': FieldValue.serverTimestamp(),
  });
}

Future<List<Master>> selectFirebaseListMastersByUpdateDate(DateTime mastersUpdatedTime)async{

  QuerySnapshot snapshot  = await FirebaseFirestore.instance
      .collection('masters')
      .where('updateTime',isGreaterThan: Timestamp.fromDate(mastersUpdatedTime))
      .where('readableFlg', isEqualTo: true)
      .orderBy('updateTime', descending: false)
      .get();

  List<Master> returnList = [];

  if(snapshot.size==0){
    return returnList;
  }

  for(int i =0;i<snapshot.size;i++){
    returnList.add(
      Master(
        snapshot.docs[i].id,
        snapshot.docs[i].get('masterGroupCode'),
        snapshot.docs[i].get('code'),
        snapshot.docs[i].get('name'),
        snapshot.docs[i].get('onMemoryFlg'),
        snapshot.docs[i].get('optionTime1')==null?null:snapshot.docs[i].get('optionTime1').toDate(),
        snapshot.docs[i].get('optionTime2')==null?null:snapshot.docs[i].get('optionTime2').toDate(),
        snapshot.docs[i].get('optionNumber1'),
        snapshot.docs[i].get('optionNumber2'),
        snapshot.docs[i].get('optionText1'),
        snapshot.docs[i].get('optionText2'),
        snapshot.docs[i].get('optionBool1'),
        snapshot.docs[i].get('optionBool2'),
        await  readMasterImageFromFirebase(
          snapshot.docs[i].get('masterGroupCode'),
          snapshot.docs[i].get('code'),
          snapshot.docs[i].get('fileNameSuffix1'),
          1
        ),
        await  readMasterImageFromFirebase(
            snapshot.docs[i].get('masterGroupCode'),
            snapshot.docs[i].get('code'),
            snapshot.docs[i].get('fileNameSuffix2'),
            2
          ),
        snapshot.docs[i].get('fileNameSuffix1'),
        snapshot.docs[i].get('fileNameSuffix2'),
        snapshot.docs[i].get('optionNumber2'),
        snapshot.docs[i].get('insertProgramId'),
        snapshot.docs[i].get('insertTime').toDate(),
        snapshot.docs[i].get('updateUserDocId'),
        snapshot.docs[i].get('updateProgramId'),
        snapshot.docs[i].get('updateTime').toDate(),
        snapshot.docs[i].get('readableFlg'),
        snapshot.docs[i].get('deleteFlg')
      )
    );
  }
  return returnList;
}