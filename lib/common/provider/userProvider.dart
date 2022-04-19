import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../daoFirebase/usersDaoFirebase.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../daoIsar/userDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import '../../entityIsar/userEntityIsar.dart';

class UserDataProviderNotifier extends ChangeNotifier {
  Map<String, dynamic> _userData = {};
  get userData => _userData;
  Image? _mainPhotoData;
  get mainPhotoData => _mainPhotoData;

  Stream<QuerySnapshot>? _callStream;
  final controller = StreamController<String>();
  StreamSubscription<QuerySnapshot>? streamSub;
  DateTime? updateCheckTime;


  Future<void> updateUserWhenLogin(WidgetRef ref) async {

    Setting? tmpSetting=await selectIsarSettingByCode("localUserInfo");

    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    String  messageTokenId=await _firebaseMessaging.getToken()??"";

    updateFirebaseUserHidden(userDocId: tmpSetting!.stringValue2!,
        data:{'lastLoginTime': FieldValue.serverTimestamp(),
          'messageTokenId':messageTokenId
        },
        programId: "updateLastLoginTime");
  }


  Future<void> readMainPhotoDataFromDirectoryToMemory() async {
    if ((_userData["profilePhotoNameSuffix"] ?? "") == "") {
      _mainPhotoData = null;
    } else {
      String profilePhotoNameSuffix = _userData["profilePhotoNameSuffix"]!;
      Directory appDocDir = await getApplicationDocumentsDirectory();
      File localFile =
      File("${appDocDir.path}/media/mainPhoto" + profilePhotoNameSuffix);
      _mainPhotoData = Image.file(localFile, width: 90);
    }
  }

  Future<void> readMainPhotoFromFirebaseToDirectoryAndMemory(String profilePhotoNameSuffix,String userDocId) async {
    if (profilePhotoNameSuffix == "") {
      _mainPhotoData = null;
    } else {

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference imageRef = storage
          .ref()
          .child("profile")
          .child(userDocId)
          .child("mainPhoto" + profilePhotoNameSuffix);
      String imageUrl = await imageRef.getDownloadURL();

      _mainPhotoData = Image.network(imageUrl, width: 90);

      Directory appDocDir = await getApplicationDocumentsDirectory();
      File downloadToFile =
      File("${appDocDir.path}/media/mainPhoto" + profilePhotoNameSuffix);
      try {
        await imageRef.writeToFile(downloadToFile);
      } catch (e) {
        _mainPhotoData = null;
        log("写真データが取れなかった");
      }
    }
  }

  void closeStream() async {
    streamSub!.cancel();
  }
  Future<void> readUserDataFromIsarToMemory() async {

    User? tmpUser = await selectIsarUser();
    if(tmpUser!=null){
      _userData["userDocId"] =tmpUser.userDocId;
      _userData['name'] =tmpUser.name;
      _userData['email'] =tmpUser.email;
      _userData['birthDate'] =tmpUser.birthDate;
      _userData['level'] =tmpUser.level;
      _userData['occupation'] =tmpUser.occupation;
      _userData['motherTongue'] =tmpUser.motherTongue;
      _userData['country'] =tmpUser.country;
      _userData['town'] =tmpUser.town;
      _userData['homeCountry'] =tmpUser.homeCountry;
      _userData['homeTown'] =tmpUser.homeTown;
      _userData['gender'] =tmpUser.gender;
      _userData['placeWannaGo'] =tmpUser.placeWannaGo;
      _userData['greeting'] =tmpUser.greeting;
      _userData['description'] =tmpUser.description;
      _userData['userType'] =tmpUser.userType;
      _userData['searchConditionAge'] =tmpUser.searchConditionAge;
      _userData['searchConditionLevel'] =tmpUser.searchConditionLevel;
      _userData['searchConditionMotherTongue'] =tmpUser.searchConditionMotherTongue;
      _userData['searchConditionCountry'] =tmpUser.searchConditionCountry;
      _userData['searchConditionGender'] =tmpUser.searchConditionGender;
      _userData['searchConditionHomeCountry'] =tmpUser.searchConditionHomeCountry;
      _userData['searchConditionLoginTime'] =tmpUser.searchConditionLoginTime;
      _userData['searchConditionCategories'] =tmpUser.searchConditionCategories;
      _userData['searchConditionCourses'] =tmpUser.searchConditionCourses;
      _userData['searchConditionUserType'] =tmpUser.searchConditionUserType;
      _userData['profilePhotoNameSuffix'] =tmpUser.profilePhotoNameSuffix;
      _userData['profilePhotoUpdateCnt'] =tmpUser.profilePhotoUpdateCnt;
      _userData['messageTokenId'] =tmpUser.messageTokenId;
      _userData['informationModifiedTime'] =tmpUser.informationModifiedTime;
      _userData['interestingCategories'] =tmpUser.interestingCategories;
      _userData['interestingCourses'] =tmpUser.interestingCourses;
      _userData['insertUserDocId'] =tmpUser.insertUserDocId;
      _userData['insertProgramId'] =tmpUser.insertProgramId;
      _userData['insertTime'] =tmpUser.insertTime;
      _userData['updateUserDocId'] =tmpUser.updateUserDocId;
      _userData['updateProgramId'] =tmpUser.updateProgramId;
      _userData['updateTime'] =tmpUser.updateTime;
      _userData['readableFlg'] =tmpUser.readableFlg;
      _userData['deleteFlg'] =tmpUser.deleteFlg;
    }
    await readMainPhotoDataFromDirectoryToMemory();
    log("XXXXXX after read user");
  }

  void controlStreamOfReadUserDataFirebaseToIsarAndMemory(WidgetRef ref, String email,
      String userDocId) async {
    //最初は必ず呼び出し
    streamSub = await readUserDataFirebaseToIsarAndMemory(ref, email,userDocId);

    if (controller.hasListener) {
    } else {
      controller.stream.listen((value) async {
        if(value=="listen"){
          streamSub = await readUserDataFirebaseToIsarAndMemory(ref, email,userDocId);
        }
        if(value=="cancel"){
          streamSub!.cancel();
        }
      });
    }
  }

  Future<StreamSubscription<QuerySnapshot>> readUserDataFirebaseToIsarAndMemory(WidgetRef ref,
      String email,String userDocId) async {

    updateCheckTime ??= await selectIsarSettingUpdateCheckTimeByEntityName("user");

    _callStream = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .where('informationModifiedTime', isGreaterThan: Timestamp.fromDate(updateCheckTime!))
        .where('readableFlg', isEqualTo: true)
        .snapshots();

    StreamSubscription<QuerySnapshot> streamSub =
    _callStream!.listen((QuerySnapshot snapshot) async {
      if (snapshot.size != 0) {

        controller.sink.add("cancel");

        if(_userData["profilePhotoUpdateCnt"]!=null){
          if (_userData["profilePhotoUpdateCnt"]<
              snapshot.docs[0].get("profilePhotoUpdateCnt")) {
            //自デバイス以外で写真が更新された場合は写真をDL
            await readMainPhotoFromFirebaseToDirectoryAndMemory(snapshot.docs[0].get("profilePhotoNameSuffix") ?? "",userDocId);
          }
        }else{
          //そのデバイスで初回にデータ読み込むときも同様
          await readMainPhotoFromFirebaseToDirectoryAndMemory(snapshot.docs[0].get("profilePhotoNameSuffix") ?? "",userDocId);

        }

        _userData["userDocId"] = snapshot.docs[0].id;
        _userData['name'] = snapshot.docs[0].get('name');
        _userData['email'] = snapshot.docs[0].get('email');
        _userData['birthDate'] = snapshot.docs[0].get('birthDate')==null?null:snapshot.docs[0].get('birthDate').toDate();
        _userData['level'] = snapshot.docs[0].get('level');
        _userData['occupation'] = snapshot.docs[0].get('occupation');
        _userData['motherTongue'] = snapshot.docs[0].get('motherTongue');
        _userData['country'] = snapshot.docs[0].get('country');
        _userData['town'] = snapshot.docs[0].get('town');
        _userData['homeCountry'] = snapshot.docs[0].get('homeCountry');
        _userData['homeTown'] = snapshot.docs[0].get('homeTown');
        _userData['gender'] = snapshot.docs[0].get('gender');
        _userData['placeWannaGo'] = snapshot.docs[0].get('placeWannaGo');
        _userData['greeting'] = snapshot.docs[0].get('greeting');
        _userData['description'] = snapshot.docs[0].get('description');
        _userData['userType'] = snapshot.docs[0].get('userType');
        _userData['searchConditionAge'] = snapshot.docs[0].get('searchConditionAge');
        _userData['searchConditionLevel'] = snapshot.docs[0].get('searchConditionLevel');
        _userData['searchConditionMotherTongue'] = snapshot.docs[0].get('searchConditionMotherTongue');
        _userData['searchConditionCountry'] = snapshot.docs[0].get('searchConditionCountry');
        _userData['searchConditionGender'] = snapshot.docs[0].get('searchConditionGender');
        _userData['searchConditionHomeCountry'] = snapshot.docs[0].get('searchConditionHomeCountry');
        _userData['searchConditionLoginTime'] = snapshot.docs[0].get('searchConditionLoginTime');
        _userData['searchConditionCategories'] = snapshot.docs[0].get('searchConditionCategories');
        _userData['searchConditionCourses'] = snapshot.docs[0].get('searchConditionCourses');
        _userData['searchConditionUserType'] = snapshot.docs[0].get('searchConditionUserType');
        _userData['profilePhotoNameSuffix'] = snapshot.docs[0].get('profilePhotoNameSuffix');
        _userData['profilePhotoUpdateCnt'] = snapshot.docs[0].get('profilePhotoUpdateCnt');
        _userData['messageTokenId'] = snapshot.docs[0].get('messageTokenId');
        _userData['informationModifiedTime'] = snapshot.docs[0].get('informationModifiedTime');
        _userData['interestingCategories'] = snapshot.docs[0].get('interestingCategories');
        _userData['interestingCourses'] = snapshot.docs[0].get('interestingCourses');
        _userData['insertUserDocId'] = snapshot.docs[0].get('insertUserDocId');
        _userData['insertProgramId'] = snapshot.docs[0].get('insertProgramId');
        _userData['insertTime'] = snapshot.docs[0].get('insertTime');
        _userData['updateUserDocId'] = snapshot.docs[0].get('updateUserDocId');
        _userData['updateProgramId'] = snapshot.docs[0].get('updateProgramId');
        _userData['updateTime'] = snapshot.docs[0].get('updateTime');
        _userData['readableFlg'] = snapshot.docs[0].get('readableFlg');
        _userData['deleteFlg'] = snapshot.docs[0].get('deleteFlg');

        await insertOrUpdateIsarUser(
            userDocId: snapshot.docs[0].id,
            name: snapshot.docs[0].get('name'),
            email: snapshot.docs[0].get('email'),
            birthDate: snapshot.docs[0].get('birthDate')==null?null:snapshot.docs[0].get('birthDate').toDate(),
            level: snapshot.docs[0].get('level'),
            occupation: snapshot.docs[0].get('occupation'),
            motherTongue: snapshot.docs[0].get('motherTongue'),
            country: snapshot.docs[0].get('country'),
            town: snapshot.docs[0].get('town'),
            homeCountry: snapshot.docs[0].get('homeCountry'),
            homeTown: snapshot.docs[0].get('homeTown'),
            gender: snapshot.docs[0].get('gender'),
            placeWannaGo: snapshot.docs[0].get('placeWannaGo'),
            greeting: snapshot.docs[0].get('greeting'),
            description: snapshot.docs[0].get('description'),
            userType: snapshot.docs[0].get('userType'),
            searchConditionAge: snapshot.docs[0].get('searchConditionAge'),
            searchConditionLevel: snapshot.docs[0].get('searchConditionLevel'),
            searchConditionMotherTongue: snapshot.docs[0].get('searchConditionMotherTongue'),
            searchConditionCountry: snapshot.docs[0].get('searchConditionCountry'),
            searchConditionGender: snapshot.docs[0].get('searchConditionGender'),
            searchConditionHomeCountry: snapshot.docs[0].get('searchConditionHomeCountry'),
            searchConditionLoginTime: snapshot.docs[0].get('searchConditionLoginTime'),
            searchConditionCategories: snapshot.docs[0].get('searchConditionCategories'),
            searchConditionCourses: snapshot.docs[0].get('searchConditionCourses'),
            searchConditionUserType: snapshot.docs[0].get('searchConditionUserType'),
            profilePhotoNameSuffix: snapshot.docs[0].get('profilePhotoNameSuffix'),
            profilePhotoUpdateCnt: snapshot.docs[0].get('profilePhotoUpdateCnt'),
            messageTokenId: snapshot.docs[0].get('messageTokenId'),
            informationModifiedTime: snapshot.docs[0].get('informationModifiedTime').toDate(),
            interestingCategories: snapshot.docs[0].get('interestingCategories'),
            interestingCourses: snapshot.docs[0].get('interestingCourses'),
            insertUserDocId: snapshot.docs[0].get('insertUserDocId'),
            insertProgramId: snapshot.docs[0].get('insertProgramId'),
            insertTime: snapshot.docs[0].get('insertTime').toDate(),
            updateUserDocId: snapshot.docs[0].get('updateUserDocId'),
            updateProgramId: snapshot.docs[0].get('updateProgramId'),
            updateTime: snapshot.docs[0].get('updateTime').toDate(),
            readableFlg: snapshot.docs[0].get('readableFlg'),
            deleteFlg: snapshot.docs[0].get('deleteFlg'),
      );

        updateCheckTime=snapshot.docs[snapshot.size-1].get("informationModifiedTime").toDate();
        insertOrUpdateIsarSettingUpdateCheckTime(
            "user",
            snapshot.docs[snapshot.size-1].get("updateTime").toDate()
        );
        controller.sink.add("listen");
        notifyListeners();
      }
    });

    return streamSub;
  }

  Future<void> uploadAndInsertPhoto(File imageFile, WidgetRef ref) async {
    _mainPhotoData = Image.file(imageFile);

    String pathStr = imageFile.path;
    String pathStrEx = pathStr.substring(
      pathStr.lastIndexOf('.'),
    );
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      await storage
          .ref("profile/" + _userData["userDocId"]! + "/mainPhoto" + pathStrEx)
          .putFile(imageFile);

      //ローカルに保存
      Directory appDocDir = await getApplicationDocumentsDirectory();
      File downloadToFile =
      File("${appDocDir.path}/media/" + "mainPhoto" + pathStrEx);
      await downloadToFile.writeAsBytes(await imageFile.readAsBytes());

      _userData["profilePhotoUpdateCnt"] = _userData["profilePhotoUpdateCnt"]! + 1;
      _userData["profilePhotoNameSuffix"] = pathStrEx;
      await updateIsarUserPhotoInfo(pathStrEx);

      updateFirebaseUserPhotoInfo(_userData["userDocId"]!,_userData["profilePhotoUpdateCnt"]! + 1,pathStrEx,"uploadAndInsertPhoto");

      await FlutterImageCompress.compressAndGetFile(
        "${appDocDir.path}/media/" + "mainPhoto" + pathStrEx,
        "${appDocDir.path}/media/" + "mainPhoto_small" + pathStrEx,
        quality: 20,
      );

      File localSmallFile =
      File("${appDocDir.path}/media/" + "mainPhoto_small" + pathStrEx);
      await storage
          .ref("profile/" +
          _userData["userDocId"]! +
          "/mainPhoto_small" +
          pathStrEx)
          .putFile(localSmallFile);
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> setImage(WidgetRef ref) async {
    XFile? pickerFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 40);
    if (pickerFile != null) {
      uploadAndInsertPhoto(File(pickerFile.path), ref);
      //TODO 圧縮率などは調整
    }
  }


  void clearIsarAndMemoryAndDirectory()async {

    _userData = {};
    _mainPhotoData=null;

    deleteIsarSettingsByCode("userUpdateCheck");
    deleteIsarUsers();
    final userDir = Directory((await getApplicationDocumentsDirectory()).path+"/media");

    List<FileSystemEntity> files;
    files = userDir.listSync(recursive: true,followLinks: false);
    for (var file in files) {
      file.deleteSync(recursive: true);
    }

    log("XXXXXXXXfinishDelete");
  }

  void setUserDataOneItem(String ItemName,dynamic ItemValue){

    _userData[ItemName] =ItemValue;
  }

}


final userDataProvider = ChangeNotifierProvider(
      (ref) => UserDataProviderNotifier(),
);
