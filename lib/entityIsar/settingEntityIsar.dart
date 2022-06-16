import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'settingEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Setting {

  Setting(
      this.settingCode,
      this.stringValue1,
      this.stringValue2,
      this.numberValue1,
      this.numberValue2,
      this.dateTimeValue1,
      this.dateTimeValue2,
      this.boolValue1,
      this.boolValue2,
      this.uint8ListValue1,
      this.uint8ListValue2,
      );

  @Id()
  int id = Isar.autoIncrement;
  late String settingCode;
  String? stringValue1;
  String? stringValue2;
  int? numberValue1;
  int? numberValue2;
  DateTime? dateTimeValue1;
  DateTime? dateTimeValue2;
  bool? boolValue1;
  bool? boolValue2;
  Uint8List? uint8ListValue1;
  Uint8List? uint8ListValue2;
}