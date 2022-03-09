import 'package:convas/editInterestingCourseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'daoFirebase/usersDaoFirebase.dart';


class EditInterestingCourse extends ConsumerWidget {
  EditInterestingCourse({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg=true;
  List<Widget> checkList = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    checkList=[];
    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(editInterestingCourseProvider.notifier).initialize(ref);
    }
    ref.watch(editInterestingCourseProvider).courseDocIdNameMap.forEach((key, value) {
      checkList.add(
          CheckboxListTile(
            title: gray20TextLeft(value),
            value: ref.watch(editInterestingCourseProvider).courseDocIdBoolMap[key.toString()],
            onChanged: (bool? value) {
              ref.read(editInterestingCourseProvider.notifier).setBool(key.toString(),!(value!));
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ));

    });


    return Scaffold(
      appBar:
      whiteAppbar("edit Interest"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:14.0,left:14.0,bottom: 20),
                  child: Column(children: checkList),
                ),

                orangeRoundButton(onPressed: () {
                  String interestingCourses="";
                  ref.watch(editInterestingCourseProvider).courseDocIdBoolMap.forEach((key, value) {
                    if(value){
                      interestingCourses=interestingCourses+key.toString()+",";
                    }
                    updateUserSelectedItem(ref,"interestingCourses",interestingCourses,"editInterestingCourse");

                  });

                  Navigator.pop(context);
                }, text: 'OK')

              ]
          ),
        ),
      ),
    );
  }
}
