import 'package:convas/UIs/register/registerLogic.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/UI/commonPushUI.dart';
import '../dataPrepareingUI.dart';
import 'optionBeFoundByLearnerUI.dart';


class SetDayOfWeek extends ConsumerWidget {
  const SetDayOfWeek({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite(""),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      commonText24BlackBoldCenter("Why don't you decide days of week?"),
                      const SizedBox(height: 20,),
                      commonText16Gray("This helps you keep learning"),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:14.0),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: commonText20GrayLeft("Sunday"),
                          value: ref.watch(registerProvider).sunday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setSunday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),

                        CheckboxListTile(
                          title: commonText20GrayLeft("Monday"),
                          value: ref.watch(registerProvider).monday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setMonday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),

                        CheckboxListTile(
                          title: commonText20GrayLeft("Tuesday"),
                          value: ref.watch(registerProvider).tuesday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setTuesday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),

                        CheckboxListTile(
                          title: commonText20GrayLeft("Wednesday"),
                          value: ref.watch(registerProvider).wednesday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setWednesday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),

                        CheckboxListTile(
                          title: commonText20GrayLeft("Thursday"),
                          value: ref.watch(registerProvider).thursday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setThursday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),

                        CheckboxListTile(
                          title: commonText20GrayLeft("Friday"),
                          value: ref.watch(registerProvider).friday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setFriday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),

                        CheckboxListTile(
                          title: commonText20GrayLeft("Saturday"),
                          value: ref.watch(registerProvider).saturday,
                          onChanged: (bool? value) {
                            ref.read(registerProvider.notifier).setSaturday(value!);
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:commonButtonWhiteBorderRound(
                      text: "I don't want to decide",
                      onPressed: ()  {

                        ref.read(registerProvider.notifier).clearDayOfWeek();
                        // Navigator.of(context).push(
                        //   PageRouteBuilder(
                        //     pageBuilder: (context, animation, secondaryAnimation) {
                        //       return const OptionBeFoundLearner();
                        //     },
                        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        //       return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                        //     },
                        //   ),
                        // );

                        ref.read(registerProvider.notifier).setCanBeFound(false);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const DataPreparing()),
                                (_) => false);
                      },),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:commonButtonOrangeRound(
                      text: "OK",
                      onPressed: ()  {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const OptionBeFoundLearner();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                            },
                          ),
                        );
                      },),),

                ]),
          )),
    );
  }
}
