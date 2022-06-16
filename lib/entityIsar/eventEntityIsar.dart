import 'package:isar/isar.dart';

part 'eventEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Event {

  Event(this.eventDocId,
      this.userDocId,
      this.eventName,
      this.eventType,
      this.friendUserDocId,
      this.callChannelId,
      this.fromTime,
      this.toTime,
      this.isAllDay,
      this.repeat,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday,
      this.description,
      this.recurrenceRule,
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
  late String userDocId;
  late String eventName;
  late String eventType;
  late String friendUserDocId;
  String? callChannelId;
  DateTime? fromTime;
  DateTime? toTime;
  late bool isAllDay;
  late bool repeat;
  late bool monday;
  late bool tuesday;
  late bool wednesday;
  late bool thursday;
  late bool friday;
  late bool saturday;
  late bool sunday;
  late String description;
  late String recurrenceRule;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;

}