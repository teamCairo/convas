import 'package:convas/UIs/myPageRoute/editInterestingCourseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../daoFirebase/usersDaoFirebase.dart';


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
    ref.watch(editInterestingCourseProvider).courseCdNameMap.forEach((key, value) {
      checkList.add(
          CheckboxListTile(
            title: commonText20GrayLeft(value),
            value: ref.watch(editInterestingCourseProvider).courseCdBoolMap[key.toString()],
            onChanged: (bool? value) {
              ref.read(editInterestingCourseProvider.notifier).setBool(key.toString(),!(value!));
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ));

    });


    return Scaffold(
      appBar:
      commonAppbar("edit Interest"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:14.0,left:14.0,bottom: 20),
                  child: Column(children: checkList),
                ),

                commonButtonOrangeRound(onPressed: () async{
                  String interestingCourses="";
                  ref.watch(editInterestingCourseProvider).courseCdBoolMap.forEach((key, value) {
                    if(value){
                      if(interestingCourses!=""){
                        interestingCourses=interestingCourses+separatingCharacter;
                      }
                      interestingCourses=interestingCourses+key.toString();
                    }

                  });
                  await updateUserSelectedItem(ref,"interestingCourses",interestingCourses,"editInterestingCourse");

                  Navigator.pop(context);
                }, text: 'OK')

              ]
          ),
        ),
      ),
    );
  }
}
