import 'dart:typed_data';
import 'package:isar/isar.dart';

part 'masterEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Master {

  Master(
      this.masterDocId,
      this.masterGroupCode,
      this.code,
      this.name,
      this.onMemoryFlg,
      this.optionTime1,
      this.optionTime2,
      this.optionNumber1,
      this.optionNumber2,
      this.optionText1,
      this.optionText2,
      this.optionBool1,
      this.optionBool2,
      this.optionFile1,
      this.optionFile2,
      this.fileNameSuffix1,
      this.fileNameSuffix2,
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
  late String masterDocId;
  late String masterGroupCode;
  late String code;
  late String name;
  late bool onMemoryFlg;
  DateTime? optionTime1;
  DateTime? optionTime2;
  int? optionNumber1;
  int? optionNumber2;
  String? optionText1;
  String? optionText2;
  bool? optionBool1;
  bool? optionBool2;
  Uint8List? optionFile1;
  Uint8List? optionFile2;
  late String fileNameSuffix1;
  late String fileNameSuffix2;
  String? insertUserDocId;
  String? insertProgramId;
  DateTime? insertTime;
  String? updateUserDocId;
  String? updateProgramId;
  DateTime? updateTime;
  bool? readableFlg;
  bool? deleteFlg;

}