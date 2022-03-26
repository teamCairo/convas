// import 'dart:developer';
// import 'dart:typed_data';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../daoIsar/settingDaoIsar.dart';
// import '../../entityIsar/settingEntityIsar.dart';
//
// final settingDataProvider = ChangeNotifierProvider(
//   (ref) => SettingDataNotifier(),
// );
//
// class SettingDataNotifier extends ChangeNotifier {
//   Map<String, Setting> _settingData = {}; //キーはFriendのuserDocId
//   Map<String, Setting> get settingData => _settingData;
//
//   Future<void> readSettingDataFromIsarToMemory() async {
//     //データリセット
//     _settingData = {};
//     List<Setting>? tmpSettingList = await selectIsarSettingAll();
//
//     for (int i = 0; i < tmpSettingList!.length; i++) {
//       _settingData[tmpSettingList[i].settingCode] = tmpSettingList[i];
//     }
//   }
//
//   void setSettingUpdateCheckData(String entityName, DateTime updateTime) {
//
//     log("XXXXXXXXXXXXsetSettingUpdateCheckData："+entityName.toString()+updateTime.toString());
//     setSettingData(
//         settingCode: entityName + "UpdateCheck", dateTimeValue1: updateTime);
//   }
//
//   DateTime getSettingUpdateCheckData(String entityName) {
//     if (settingData[entityName + "UpdateCheck"] != null) {
//       return settingData[entityName + "UpdateCheck"]!.dateTimeValue1!;
//     } else {
//       insertOrUpdateIsarSetting(Setting(
//         entityName + "UpdateCheck",
//         null,
//         null,
//         null,
//         null,
//         DateTime(2022, 1, 1, 0, 0),
//         null,
//         null,
//         null,
//         null,
//         null,
//       ));
//       return DateTime(2022, 1, 1, 0, 0);
//     }
//   }
//
//   void setSettingData({
//     required String settingCode,
//     String? stringValue1,
//     String? stringValue2,
//     int? numberValue1,
//     int? numberValue2,
//     DateTime? dateTimeValue1,
//     DateTime? dateTimeValue2,
//     bool? boolValue1,
//     bool? boolValue2,
//     Uint8List? uint8ListValue1,
//     Uint8List? uint8ListValue2,
//   }) async {
//
//     log("XXXXXXXXXXXXsetSettingData："+settingCode.toString()+dateTimeValue1.toString());
//     _settingData[settingCode] = Setting(
//         settingCode,
//         stringValue1,
//         stringValue2,
//         numberValue1,
//         numberValue2,
//         dateTimeValue1,
//         dateTimeValue2,
//         boolValue1,
//         boolValue2,
//         uint8ListValue1,
//         uint8ListValue2);
//
//     log("XXXXXXXXXXXXsetSettingDataメモリUpdate後："+settingCode.toString()+dateTimeValue1.toString()+(stringValue1??"")+(stringValue2??""));
//     await insertOrUpdateIsarSetting(_settingData[settingCode]!);
//     log("XXXXXXXXXXXXsetSettingDataIsarUpdate後："+settingCode.toString()+dateTimeValue1.toString()+(stringValue1??"")+(stringValue2??""));
//   }
// }
