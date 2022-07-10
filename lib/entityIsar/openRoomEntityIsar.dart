import 'package:isar/isar.dart';

part 'openRoomEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class OpenRoom{

  OpenRoom(
      this.openRoomDocId,
      this.createUserDocId,
      this.roomName,
      this.categoryDocId,
      this.topicDocId,
      this.description,
      this.startDateTime,
      this.endDateTime,
      this.joinUserNumber,
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
  late String openRoomDocId;
  late String createUserDocId;
  late String roomName;
  late String categoryDocId;
  late String topicDocId;
  late String description;
  late DateTime startDateTime;
  DateTime? endDateTime;
  late int joinUserNumber;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;
}