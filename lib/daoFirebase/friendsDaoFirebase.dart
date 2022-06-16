import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/userProvider.dart';
import 'chatHeadersDaoFirebase.dart';

Future<String> insertFriendsData(WidgetRef ref,String friendUserDocId,String programId) async{

  DocumentSnapshot<Map<String, dynamic>>firebaseUserData = await FirebaseFirestore.instance
      .collection('users')
      .doc(friendUserDocId)
      .get();
//TODO データ登録直前にすでにフレンドデータがないかチェックする。

  String chatHeaderDocId=await insertFirebaseChatHeader(ref.watch(userDataProvider).userData["userDocId"],programId);

  //自分側の登録
  await insertFirebaseFriend(
      userDocId:ref.watch(userDataProvider).userData["userDocId"],
      ownerUserDocId:ref.watch(userDataProvider).userData["userDocId"],
      friendUserDocId:friendUserDocId,
      friendUserName:firebaseUserData["name"] ,
      profilePhotoUpdateCnt:firebaseUserData["profilePhotoUpdateCnt"] ,
      profilePhotoNameSuffix:firebaseUserData["profilePhotoNameSuffix"],
      chatHeaderDocId:chatHeaderDocId,
      programId:programId
  );

  //相手側の登録
  await insertFirebaseFriend(
      userDocId:ref.watch(userDataProvider).userData["userDocId"],
      ownerUserDocId:friendUserDocId,
      friendUserDocId:ref.watch(userDataProvider).userData["userDocId"],
      friendUserName:ref.watch(userDataProvider).userData["name"],
      profilePhotoUpdateCnt:ref.watch(userDataProvider).userData["profilePhotoUpdateCnt"],
      profilePhotoNameSuffix:ref.watch(userDataProvider).userData["profilePhotoNameSuffix"],
      chatHeaderDocId:chatHeaderDocId,
      programId:programId
  );

  return chatHeaderDocId;

}
Future<String> insertFirebaseFriend({
  required String userDocId,
  required String ownerUserDocId,
  required String friendUserDocId,
  required String friendUserName,
  required int profilePhotoUpdateCnt,
  required String profilePhotoNameSuffix,
  required String chatHeaderDocId,
  required String  programId
}) async {

  String insertedDocId="";
  await FirebaseFirestore.instance.collection('friends').add(
      {
        'userDocId':ownerUserDocId,
        'friendUserDocId':friendUserDocId,
        'friendUserName':friendUserName,
        'lastMessageContent':"",
        'lastMessageDocId':"",
        'lastMessageTime':FieldValue.serverTimestamp(),
        'profilePhotoUpdateCnt':profilePhotoUpdateCnt,
        'profilePhotoNameSuffix':profilePhotoNameSuffix,
        'mute':false,
        'chatHeaderDocId':chatHeaderDocId,
        'insertUserDocId':userDocId,
        'insertProgramId': programId,
        'insertTime': FieldValue.serverTimestamp(),
        'updateUserDocId':userDocId,
        'updateProgramId': programId,
        'updateTime': FieldValue.serverTimestamp(),
        'readableFlg': true,
        'deleteFlg': false,
      }).then((value){
    insertedDocId=value.id;
  });

  return insertedDocId;
}