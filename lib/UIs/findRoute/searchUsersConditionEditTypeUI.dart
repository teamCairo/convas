import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/UIs/findRoute/searchUsersConditionEditTypeProvider.dart';
import 'package:convas/UIs/findRoute/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';


class SearchConditionValueEditType extends ConsumerWidget {
  String displayedItem;
  String databaseItem;
  String value;

  SearchConditionValueEditType({Key? key,
    required this.displayedItem,
    required this.databaseItem,
    required this.value,
  }) : super(key: key);

  bool initialProcessFlg =true;
  List<Widget> checkList = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    checkList=[];
    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(searchUsersConditionEditTypeProvider.notifier).initialize(ref, databaseItem, value);
    }
    checkList.add(
        CheckboxListTile(
          title: commonText20GrayLeft(searchConditionAlmightyWord),
          value: ref.watch(searchUsersConditionEditTypeProvider).doesntMatterCheck,
          onChanged: (bool? value) {
            ref.read(searchUsersConditionEditTypeProvider.notifier).changeDoesntMatterCheck(value??false);
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ));

    ref.watch(searchUsersConditionEditTypeProvider).masterMap.forEach((key, value) {
      checkList.add(
          CheckboxListTile(
            title: commonText20GrayLeft(value.name),
            value: ref.watch(searchUsersConditionEditTypeProvider).masterBoolMap[key.toString()],
            onChanged: (bool? value) {
              ref.read(searchUsersConditionEditTypeProvider.notifier).setBool(key.toString(),!(value!));
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ));
    });

    return Scaffold(
      appBar: commonAppbarWhite(displayedItem),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children:checkList),
              ),
            ),
            commonButtonOrangeRound(text: "OK", onPressed: (){
              ref.read(searchUsersProvider.notifier).setConditionByMap(ref,databaseItem,ref.watch(searchUsersConditionEditTypeProvider).masterBoolMap);
              Navigator.pop(context);

            })

          ],
        ),
      ),
    );
  }


}
