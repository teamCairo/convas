import 'package:convas/UIs/myPageRoute/settingEditRadioPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/provider/masterProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../entityIsar/masterEntityIsar.dart';

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
  Map<String,Master> masterMap = {};
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
      masterMap.addAll(getMasterMap("gender",ref));
    }else if(databaseItem=="level"){
      masterMap.addAll(getMasterMap("level",ref));
    }else if(databaseItem=="motherTongue"){
      masterMap.addAll(getMasterMap("language",ref));
    }else{
      masterMap.addAll(getMasterMap("country",ref));
      }

    masterMap.forEach((key, value) {
      radioTileList.add(RadioListTile(
        title: Text(value.name),
        value: key,
        groupValue: ref.watch(settingEditRadioPageProvider).onRadioGroupValue,
        onChanged: (key) => ref.read(settingEditRadioPageProvider.notifier).setOnRadioGroupValue(key.toString()),
          controlAffinity:ListTileControlAffinity.trailing
      ),);

    });


    return Scaffold(
      appBar:
      commonAppbar(displayedItem),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child:
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children:radioTileList),
                    ),
              ),
            ),
            commonButtonOrangeRound(text:"OK", onPressed: () async{

                await updateUserSelectedItem(ref,databaseItem,ref.watch(settingEditRadioPageProvider).onRadioGroupValue,"settingEditTextPage");
                ref.read(userDataProvider.notifier).setUserDataOneItem(databaseItem,ref.watch(settingEditRadioPageProvider).onRadioGroupValue);
                Navigator.pop(context);
              },)
          ],
        ),
      ),
    );
  }
}
