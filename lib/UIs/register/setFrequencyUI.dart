import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setDayOfWeek.dart';
import 'package:convas/UIs/register/setFrequencyLogic.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/UI/commonPushUI.dart';

class SetFrequency extends ConsumerWidget {
  const SetFrequency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    String continueUntilDate =
        outputFormat.format(ref.watch(registerProvider).continualUntil!);

    return Scaffold(
      appBar: commonAppbarWhite(""),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  commonText24BlackBoldCenter(
                      "How often do you want to take a lesson?"),
                  const SizedBox(
                    height: 20,
                  ),
                  commonText16Gray(
                      "We recommend 3 or more times per week to keep learning"),
                  // timesAWeekRadio(ref, 1,"Once"),
                  timesAWeekRadio(ref, 2,"Easy      : Twice"),
                  timesAWeekRadio(ref, 3,"Normal    : 3 times"),
                  // timesAWeekRadio(ref, 4,"Hard      : 4 times"),
                  timesAWeekRadio(ref, 5,"Hard      : 5 times"),
                  // timesAWeekRadio(ref, 6,"6 times"),
                  timesAWeekRadio(ref, 7,"Extreme   : 7 times"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: commonButtonOrangeRound(
                  text: "OK",
                  onPressed: () {
                    bool checkResult = checkFrequency(ref);
                    if (checkResult) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const SetDayOfWeek();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return commonFunctionPushSlideHorizon(
                                context, animation, secondaryAnimation, child);
                          },
                        ),
                      );
                    } else {
                      // commonShowOkInfoDialog(
                      //     context, "You can set 1～7 as times per week");
                    }
                  },
                ),
              ),
            ]),
      )),
    );
  }
}

Widget timesAWeekRadio(WidgetRef ref, int timesAWeek,String timesStr) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: RadioListTile(
        title: commonText20GrayLeft(
            timesStr + " per week"),
        value: timesAWeek,
        groupValue: ref.watch(registerProvider).timesAWeek,
        onChanged: (key) =>
            ref.read(registerProvider.notifier).setTimesAWeek(timesAWeek),
        controlAffinity: ListTileControlAffinity.trailing),
  );
}
