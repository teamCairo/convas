import 'package:convas/UIs/register/setUserTypeLogic.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetUserType extends ConsumerWidget {
  const SetUserType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonScaffoldScroll(context, ref, MainAxisAlignment.spaceBetween, [
      Column(
        children: [
          commonText30BlackBoldLeft("Hi there,\nWelcome to Convas!!"),
          commonVerticalGap(),
          commonText20GrayLeft("Convas helps you keep learning English"),
          commonVerticalGap(),
          commonText20BlackCenter("Are you a learner or teacher?"),
          const SizedBox(height: 40),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    selectTeacher(ref, context);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width/2-30,
                          child:
                          Image.asset('assets/teacher.png')
                      ),
                      commonText20BlackCenter("Teacher"),
                    ],
                  ),
                ),
                commonVerticalGap(),
                GestureDetector(
                  onTap: () {
                    selectLearner(ref, context);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width/2-60,
                          child:
                          Image.asset('assets/learner.png')
                      ),
                      commonText20BlackCenter("Learner")
                    ],
                  ),
                )
              ])
        ],
      )
    ]);
  }
}
