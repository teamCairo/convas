import 'package:convas/settingEditRadioPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/provider/masterProvider.dart';
import 'common/provider/userProvider.dart';
import 'daoFirebase/usersDaoFirebase.dart';

class SettingEditRadioPage extends ConsumerWidget {
  SettingEditRadioPage({
    required this.displayedItem,
    required this.databaseItem,
    required this.value,
    Key? key,
  }) : super(key: key);
  String displayedItem;
  String databaseItem;
  String value;

  bool initialProcessFlg=true;
  Map<String,String> masterMap = {};
  List<Widget> radioTileList = [];


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(settingEditRadioPageProvider.notifier).initialize(value);
    }

    masterMap = {};
    radioTileList=[];

    if(databaseItem=="gender"){
      masterMap.addAll(ref.watch(masterDataProvider).genderMasterData);
    }else if(databaseItem=="level"){
      masterMap.addAll(ref.watch(masterDataProvider).levelMasterData);
    }else if(databaseItem=="motherTongue"){
      masterMap.addAll(ref.watch(masterDataProvider).languageMasterData);
    }else{
      masterMap.addAll(ref.watch(masterDataProvider).countryMasterData);
      }

    masterMap.forEach((key, value) {
      radioTileList.add(RadioListTile(
        title: Text(value),
        value: key,
        groupValue: ref.watch(settingEditRadioPageProvider).onRadioGroupValue,
        onChanged: (key) => ref.read(settingEditRadioPageProvider.notifier).setOnRadioGroupValue(key.toString()),
          controlAffinity:ListTileControlAffinity.trailing
      ),);

    });


    return Scaffold(
      appBar:
      whiteAppbar(displayedItem),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children:radioTileList),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:30,horizontal: 10),
              child: orangeRoundButton(text:"OK", onPressed: () async{
                await updateUserSelectedItem(ref,databaseItem,ref.watch(settingEditRadioPageProvider).onRadioGroupValue,"settingEditTextPage");
                ref.read(userDataProvider.notifier).setUserDataOneItem(databaseItem,ref.watch(settingEditRadioPageProvider).onRadioGroupValue);
                Navigator.pop(context);
              },),
            )
          ],
        ),
      ),
    );
  }
}
