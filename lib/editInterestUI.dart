import 'package:convas/editInterestProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/commonValues.dart';
import 'daoFirebase/usersDaoFirebase.dart';

class EditInterest extends ConsumerWidget {
  EditInterest({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg = true;
  List<Widget> checkList = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    checkList = [];
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(editInterestProvider.notifier).initialize(ref);
    }
    ref.watch(editInterestProvider).categoryDocIdNameMap.forEach((key, value) {
      checkList.add(CheckboxListTile(
        title: gray20TextLeft(value),
        value: ref
            .watch(editInterestProvider)
            .categoryDocIdboolMap[key.toString()],
        onChanged: (bool? value) {
          ref
              .read(editInterestProvider.notifier)
              .setBool(key.toString(), !(value!));
        },
        controlAffinity: ListTileControlAffinity.trailing,
      ));
    });

    return Scaffold(
      appBar: whiteAppbar("edit Interest"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 14.0, left: 14.0, bottom: 20),
                  child: Column(children: checkList),
                ),
                commonButtonOrangeRound(
                    onPressed: () {
                      String interestingCategories = "";
                      ref
                          .watch(editInterestProvider)
                          .categoryDocIdboolMap
                          .forEach((key, value) {
                        if (value) {
                          if (interestingCategories != "") {
                            interestingCategories = interestingCategories + separatingCharacter;
                          }
                          interestingCategories = interestingCategories + key.toString();
                        }
                        updateUserSelectedItem(ref, "interestingCategories",interestingCategories, "editInterest");
                      });

                      Navigator.pop(context);
                    },
                    text: 'OK')
              ]),
        ),
      ),
    );
  }
}
