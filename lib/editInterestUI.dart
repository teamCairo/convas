import 'package:convas/settingEditRadioPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonUI.dart';
import 'common/provider/masterProvider.dart';
import 'common/provider/userProvider.dart';
import 'daoFirebase/usersDaoFirebase.dart';

class EditInterest extends ConsumerWidget {
  EditInterest({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg=true;
  Map<String,String> masterMap = {};
  List<Widget> radioTileList = [];


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // if(initialProcessFlg){
    //   initialProcessFlg=false;
    //   ref.read(settingEditRadioPageProvider.notifier).initialize(value);
    // }
    //
    // masterMap = {};
    // radioTileList=[];
    //
    // if(databaseItem=="gender"){
    //   masterMap.addAll(ref.watch(masterDataProvider).genderMasterData);
    // }else if(databaseItem=="level"){
    //   masterMap.addAll(ref.watch(masterDataProvider).levelMasterData);
    // }else if(databaseItem=="motherTongue"){
    //   masterMap.addAll(ref.watch(masterDataProvider).languageMasterData);
    // }else{
    //   masterMap.addAll(ref.watch(masterDataProvider).countryMasterData);
    // }
    //
    // masterMap.forEach((key, value) {
    //   radioTileList.add(RadioListTile(
    //       title: Text(value),
    //       value: key,
    //       groupValue: ref.watch(settingEditRadioPageProvider).onRadioGroupValue,
    //       onChanged: (key) => ref.read(settingEditRadioPageProvider.notifier).setOnRadioGroupValue(key.toString()),
    //       controlAffinity:ListTileControlAffinity.trailing
    //   ),);
    //
    // });


    return Scaffold(
      // appBar:
      // whiteAppbar(displayedItem),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Column(children:radioTileList),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical:30,horizontal: 10),
              //   child: orangeRoundButton(text:"OK", onPressed: () async{
              //     await updateUserSelectedItem(ref,databaseItem,ref.watch(settingEditRadioPageProvider).onRadioGroupValue,"settingEditTextPage");
              //     ref.read(userDataProvider.notifier).setUserDataOneItem(databaseItem,ref.watch(settingEditRadioPageProvider).onRadioGroupValue);
              //     Navigator.pop(context);
              //   },),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
