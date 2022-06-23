import 'package:convas/UIs/register/learner/XXXXXoptionBeFoundByLearnerUI.dart';
import 'package:convas/UIs/register/learner/XXXXXselectPointsDialogProvider.dart';
import 'package:convas/UIs/register/learner/XXXXXsetFrequencyUI.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/learner/XXXXXsetGoalDetailUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';

import '../../../common/UI/commonButtonUI.dart';
import '../../../common/UI/commonPushUI.dart';
import 'XXXXXSelectPointsDialogUI.dart';
import 'XXXXXoptionFrequencySettingUI.dart';
import 'XXXXXgoalListData.dart';

class MakeMoreSpecific extends ConsumerWidget {
  MakeMoreSpecific({
    this.goalData,
    Key? key,
  }) : super(key: key);
  GoalData? goalData;

  TextEditingController tController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonScaffold(
      context,
      ref,
      MainAxisAlignment.spaceBetween,
      [
        Column(children: [
          commonText24BlackBoldCenter("Make your goal more specific!"),
          commonVerticalGap(),
          commonText16GrayCenter("Think you achieve the goal"),
          const SizedBox(height: 40),
          TextFormField(
            maxLines: 4,
            minLines: 1,
            controller:
                TextEditingController(text: ref.watch(registerProvider).goal),
            decoration: const InputDecoration(labelText: "Goal"),
            onChanged: (String value) {
              ref.read(registerProvider.notifier).setGoalWithoutRebuild(value);
            },
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          commonVerticalGap(),
          Row(children: makeHashButtonList(goalData, context, ref)),
          // Align(
          //     alignment: Alignment.topRight,
          //     child: commonIconButtonSmallWhiteBorderRound(iconData: Icons.share_outlined, text: "Share", onPressed: (){})),
        ]),
        Column(
          children: [
            commonButtonSecondaryColorRound(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  ref.read(registerProvider.notifier).setGoalWithoutRebuild("");
                  commonNavigatorPushSlideHorizon(
                      context, SetFrequency());
                },
                text: 'OK'),
            commonVerticalGap(),
            commonButtonWhiteBorderRound(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  commonNavigatorPushSlideHorizon(
                      context, SetFrequency());
                },
                text: 'Skip'),
          ],
        )
      ],
    );
  }
}

List<Widget> makeHashButtonList(
    GoalData? goalData, BuildContext context, WidgetRef ref) {
  List<Widget> hashTagButtonList = [];
  if (goalData == null ? true : goalData.due) {
    hashTagButtonList.add(commonIconButtonAddHashTagInfo(
        text: 'Due',
        iconData: Icons.calendar_today_outlined,
        color: Colors.cyan,
        onPressed: () {
          selectDate(context, ref);
        }));
  }

  if (goalData == null ? true : goalData.destination) {
    hashTagButtonList.add(commonIconButtonAddHashTagInfo(
        text: 'Destination',
        iconData: Icons.pin_drop,
        color: Colors.amberAccent,
        onPressed: () {}));
  }

  if (goalData == null ? true : goalData.point) {
    hashTagButtonList.add(commonIconButtonAddHashTagInfo(
        text: 'Points',
        iconData: Icons.score,
        color: Colors.teal,
        onPressed: () {
          ref.read(selectPointsDialogProvider.notifier).initialize(0, 100);
          selectPoint(context, ref);
        }));
  }
  return hashTagButtonList;
}

selectDate(BuildContext context, WidgetRef ref) async {
  // DateTime? selectedDate = await showMonthPicker(
  //   context: context,
  //   initialDate: DateTime.now(),
  //   firstDate: DateTime.now(),
  //   lastDate: DateTime(DateTime.now().year + 2),
  // );

  // 選択がキャンセルされた場合はNULL
  //
  // DateFormat outputFormat = DateFormat('yyyy/MM');
  // String dueStr = outputFormat.format(selectedDate);
  //
  // ref.read(registerProvider.notifier).setGoalHashTag("Due", dueStr);
  //
  // if (selectedDate == null) return null;
  return null;
}

selectPoint(BuildContext context, WidgetRef ref) async {

  showDialog<void>(
    context: context,
    builder: (_) {
      return SelectPointsDialog();
    },
  );
}