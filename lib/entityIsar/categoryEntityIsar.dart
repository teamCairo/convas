import 'dart:typed_data';
import 'dart:ui';

import 'package:isar/isar.dart';

part 'categoryEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Category {

  Category(this.categoryDocId,
      this.categoryName,
      this.photoFile,
      this.photoNameSuffix,
      this.photoUpdateCnt,
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
  late String categoryDocId;
  late String categoryName;
  late Uint8List photoFile;
  late String photoNameSuffix;
  late int photoUpdateCnt;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;
}