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
          commonText30BlackBoldCenter("Hi there,\nWelcome to Convas!!"),
          commonVerticalGap(),
          commonText20GrayLeft("Convas helps you keep learning English"),
          commonVerticalGap(),
          commonText20BlackCenter("Are you a learner or teacher?"),
          const SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            commonImageButton('assets/teacher.png', "Teacher", () {
              selectTeacher(ref, context);
            }, MediaQuery.of(context).size.width / 2 - 30),
            commonVerticalGap(),
            commonImageButton('assets/learner.png', "Learner", () {
              selectLearner(ref, context);
            }, MediaQuery.of(context).size.width / 2 - 60),
          ])
        ],
      )
    ]);
  }
}
