import 'package:convas/UIs/register/learner/XXXXXselectPointsDialogProvider.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/UI/commonButtonUI.dart';
import '../../../common/UI/commonOthersUI.dart';
import '../registerProvider.dart';

class SelectPointsDialog extends ConsumerWidget {

  SelectPointsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return commonDialog(
        context,
        ref,
        "Set target points",
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height:40),
              commonText20BlackCenter(ref.watch(selectPointsDialogProvider).chosenPoints.toStringAsFixed(1)),
              Slider(
                value: ref.watch(selectPointsDialogProvider).chosenPoints,
                min: ref.watch(selectPointsDialogProvider).minPoints,
                max: ref.watch(selectPointsDialogProvider).maxPoints,
                onChanged: (value) {
                  ref.read(selectPointsDialogProvider.notifier).setPoints(value);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

            commonButtonRoundWhiteSmall(
              text: 'Cancel',
              width: (MediaQuery.of(context).size.width * 3 / 4 - 36) / 2,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            commonHorizontalGap(),
                    commonButtonSecondaryColorRound(
              text: 'OK',
              width: (MediaQuery.of(context).size.width * 3 / 4 - 36) / 2,
              onPressed: (
                  ) {
                ref.read(registerProvider.notifier).setGoalHashTag("Points", ref.watch(selectPointsDialogProvider).chosenPoints.toStringAsFixed(1));
                Navigator.pop(context);
              },
            )
          ])
        ]));

  }
}
