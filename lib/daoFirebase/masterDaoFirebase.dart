import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

Future<String> insertFirebaseMaster(WidgetRef ref,
    String masterGroupCode,
    String code,
    String name,
    bool onMemoryFlg,
    DateTime? optionTime1,
    DateTime? optionTIme2,
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
      await storage.ref("masters/" + masterGroupCode+"/" +code+ pathStrFile1.substring(pathStrFile1.lastIndexOf('.'),))
          .putFile(optionFile1);
    }

    if(optionFile2!=null){
      pathStrFile2= optionFile2.path;
      await storage.ref("masters/" + masterGroupCode+"/" +code+ pathStrFile2.substring(pathStrFile2.lastIndexOf('.'),))
          .putFile(optionFile2);
    }

    await FirebaseFirestore.instance.collection('masters').add(
      {'masterGroupCode': masterGroupCode,
        'code': code,
        'name': name,
        'onMemoryFlg': onMemoryFlg,
        'optionTime1': optionTime1,
        'optionTIme2': optionTIme2,
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