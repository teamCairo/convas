import 'dart:core';
import 'package:convas/entityIsar/masterEntityIsar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../daoFirebase/mastersDaoFirebase.dart';
import '../../daoIsar/masterDaoIsar.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/masterEntityIsar.dart';

final masterDataProvider = ChangeNotifierProvider(
      (ref) => MasterDataNotifier(),
);

class MasterDataNotifier extends ChangeNotifier {
  Map<String, Map<String,Master>> _masterData = {}; //親のキーはGroupCd
  get masterData => _masterData;

  Future<void> readMasterDataFromIsarToMemory() async {
    //データリセット
    _masterData ={};
    List<Master>? tmpMasterList = await selectIsarMasterAll();

    for(int i=0;i<tmpMasterList!.length;i++){

      if(_masterData[tmpMasterList[i].masterGroupCode]==null){
        _masterData[tmpMasterList[i].masterGroupCode]={};
      }
      _masterData[tmpMasterList[i].masterGroupCode]![tmpMasterList[i].code]=tmpMasterList[i];
    }
  }


  Future<void> readMasterFromFirebaseToIsarAndMemory(WidgetRef ref) async {

    DateTime updateCheckTime = await selectIsarSettingUpdateCheckTimeByEntityName("masters");
    List<Master> masterList = await selectFirebaseListMastersByUpdateDate(updateCheckTime);

      if (masterList.isNotEmpty) {

        for (int i = 0; i < masterList.length; i++) {
          if (masterList[i].deleteFlg!) {

            _masterData[masterList[i].masterGroupCode]!.remove(masterList[i].code);
            deleteIsarMastersById(masterList[i].masterDocId);

          } else {

            if(_masterData[masterList[i].masterGroupCode]==null){
              _masterData[masterList[i].masterGroupCode]={};
            }
            _masterData[masterList[i].masterGroupCode]![masterList[i].code]=masterList[i];

            insertOrUpdateIsarMasterByMasterDocId(
                masterList[i]
            );
          }
        }
        insertOrUpdateIsarSettingUpdateCheckTime(
            "masters",
            masterList[masterList.length-1].updateTime!
        );
      }
  }
}

Master getMasterData(String masterGroupCode, String code, WidgetRef ref){
  return ref.watch(masterDataProvider).masterData[masterGroupCode]![code];
}


Map<String,Master> getMasterMap(String masterGroupCode, WidgetRef ref){
  return ref.watch(masterDataProvider).masterData[masterGroupCode]!;
}