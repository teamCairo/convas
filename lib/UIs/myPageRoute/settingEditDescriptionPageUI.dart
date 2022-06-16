import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/commonValues.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/usersDaoFirebase.dart';

class SettingEditDescriptionPage extends ConsumerWidget {
  SettingEditDescriptionPage({
    required this.value,
    Key? key,
  }) : super(key: key);
  String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String inputValue = value;

    return commonScaffoldScroll(
        context,
        ref,
        MainAxisAlignment.start,
        [
          TextFormField(
            maxLines: null,
            minLines: 7,
            // テキスト入力のラベルを設定
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: commonColorSecondary,width:2 ),
              ),
              focusColor: Colors.black,
              fillColor: Colors.black,
              labelText: "Self-introduction",
              labelStyle: TextStyle(color: commonColorSecondary),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: commonColorSecondary,
              //   ),
              // ),
              border:   OutlineInputBorder(
                borderSide: BorderSide(
                  color: commonColorSecondary,
                ),
              ),
              alignLabelWithHint: true,
            ),
            initialValue: value,
            onChanged: (String value) {
              inputValue = value;
            },
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: commonButtonSecondaryColorRound(
              text: "OK",
              onPressed: () async {
                await updateUserSelectedItem(ref, "description", inputValue,
                    "settingEditDescriptionPage");
                ref
                    .read(userDataProvider.notifier)
                    .setUserDataOneItem("description", inputValue);
                Navigator.pop(context);
              },
            ),
          )
        ],
        appBar: commonAppbar("Self-introduction",
            helpTitle: "Self-introduction",
            helpText: "You can register Self-introduction",
            contextForHelp: context));
  }
}
