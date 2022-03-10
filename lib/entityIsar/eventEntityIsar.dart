import 'package:isar/isar.dart';

part 'eventEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Event {

  Event(this.eventDocId,
      this.eventName,
      this.eventType,
      this.friendUserDocId,
      this.friendUserName,
      this.callChannelId,
      this.fromTime,
      this.toTime,
      this.isAllDay,
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
  late String eventDocId;
  late String eventName;
  late String eventType;
  late String friendUserDocId;
  late String friendUserName;
  String? callChannelId;
  DateTime? fromTime;
  DateTime? toTime;
  late bool isAllDay;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;

}