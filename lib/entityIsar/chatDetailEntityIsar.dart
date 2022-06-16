import 'package:isar/isar.dart';

part 'chatDetailEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class ChatDetail{

  ChatDetail(
      this.chatDetailDocId,
      this.chatHeaderDocId,
      this.senderUserDocId,
      this.receiverUserDocId,
      this.userDocId,
      this.messageType,
      this.fileNameSuffix,
      this.referDocId,
      this.message,
      this.sendTime,
      this.insertUserDocId,
      this.insertProgramId,
      this.insertTime,
      this.updateUserDocId,
      this.updateProgramId,
      this.updateTime,
      this.readableFlg,
      this.deleteFlg,

      );

  @Id()
  int id = Isar.autoIncrement;
  late String chatDetailDocId;
  late String chatHeaderDocId;
  late String senderUserDocId;
  late String receiverUserDocId;
  late String userDocId;
  late String messageType;
  late String fileNameSuffix;
  late String referDocId;
  late String message;
  late DateTime sendTime;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;
}