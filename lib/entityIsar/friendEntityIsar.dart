import 'dart:typed_data';
import 'package:isar/isar.dart';

part 'friendEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Friend {

  Friend(
  this.friendDocId,
  this.userDocId,
  this.friendUserDocId,
  this.friendUserName,
  this.lastMessageContent,
  this.lastMessageDocId,
  this.lastMessageTime,
  this.profilePhoto,
  this.profilePhotoUpdateCnt,
  this.profilePhotoNameSuffix,
  this.mute,
  this.chatHeaderId,
  this.insertUserDocId,
  this.insertProgramId,
  this.insertTime,
  this.updateUserDocId,
  this.updateProgramId,
  this.updateTime,
  this.readableFlg,
  this.deleteFlg


  );

  @Id()
  int id = Isar.autoIncrement;
  late String friendDocId;
  late String userDocId;
  late String friendUserDocId;
  late String friendUserName;
  late String lastMessageContent;
  late String lastMessageDocId;
  late DateTime lastMessageTime;
  Uint8List? profilePhoto;
  late int profilePhotoUpdateCnt;
  late String profilePhotoNameSuffix;
  late bool mute;
  late String chatHeaderId;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;

}