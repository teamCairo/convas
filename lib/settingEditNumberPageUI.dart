import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/provider/userProvider.dart';
import 'daoFirebase/usersDaoFirebase.dart';

class SettingEditNumberPage extends ConsumerWidget {
  SettingEditNumberPage({
    required this.displayedItem,
    required this.databaseItem,
    required this.value,
    Key? key,
  }) : super(key: key);
  String displayedItem;
  String databaseItem;
  int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    String inputValue =value.toString();

    return Scaffold(
      appBar:
      commonAppbarWhite(displayedItem),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Padding(
              padding:const EdgeInsets.symmetric(vertical:30,horizontal:10),
              child:TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(labelText: displayedItem),
                initialValue:value.toString(),
                onChanged: (String value) {
                  inputValue=value;
                },
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:30,horizontal: 10),
              child: commonButtonOrangeRound(text:"OK", onPressed: () async{
                await updateUserSelectedItem(ref,databaseItem,int.parse(inputValue),"settingEditTextPage");
                ref.read(userDataProvider.notifier).setUserDataOneItem(databaseItem,int.parse(inputValue));
                Navigator.pop(context);
              },),
            )
          ],
        ),
      ),
    );
  }
}
