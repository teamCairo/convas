import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/UIs/findRoute/searchUsersConditionEditRadioProvider.dart';
import 'package:convas/UIs/findRoute/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonOthersUI.dart';


class SearchConditionValueEditRadio extends ConsumerWidget {
  String displayedItem;
  String databaseItem;
  String value;

  SearchConditionValueEditRadio({Key? key,
    required this.displayedItem,
    required this.databaseItem,
    required this.value,
  }) : super(key: key);

  bool initialProcessFlg =true;
  List<Widget> radioTileList = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(searchUsersConditionEditRadioProvider.notifier).initialize(ref, databaseItem, value);
    }
    radioTileList=[];

    ref.watch(searchUsersConditionEditRadioProvider).masterMap.forEach((key, value) {
      radioTileList.add(RadioListTile(
          title: Text(value.name),
          value: key.toString(),
          groupValue: ref.watch(searchUsersConditionEditRadioProvider).onRadioGroupValue,
          onChanged: (key) => ref.read(searchUsersConditionEditRadioProvider.notifier).setOnRadioGroupValue(key.toString()),
          controlAffinity:ListTileControlAffinity.trailing
      ),);

    });

    return Scaffold(
      appBar: commonAppbar(displayedItem),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:radioTileList),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20 ,vertical:30),
              child: commonButtonOrangeRound(text: "OK", onPressed: (){
                ref.read(searchUsersProvider.notifier).setCondition(ref,databaseItem,ref.watch(searchUsersConditionEditRadioProvider).onRadioGroupValue);
                Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    );
  }

}
