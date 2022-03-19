import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/UI/commonButtonUI.dart';
import '../common/UI/commonOthersUI.dart';
import '../common/provider/userProvider.dart';
import '../daoFirebase/usersDaoFirebase.dart';

class SettingEditDescriptionPage extends ConsumerWidget {
  SettingEditDescriptionPage({
    required this.value,
    Key? key,
  }) : super(key: key);
  String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    String inputValue =value;

    return Scaffold(
      appBar:
      commonAppbarWhite("Description"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding:const EdgeInsets.symmetric(vertical:30,horizontal:10),
                child:TextFormField(
                  maxLines: null,
                  minLines: 7,
                  // テキスト入力のラベルを設定
                  decoration: const InputDecoration(labelText: "self-Introduction"),
                  initialValue:value,
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
                  await updateUserSelectedItem(ref,"description",inputValue,"settingEditDescriptionPage");
                  ref.read(userDataProvider.notifier).setUserDataOneItem("description",inputValue);
                  Navigator.pop(context);
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
