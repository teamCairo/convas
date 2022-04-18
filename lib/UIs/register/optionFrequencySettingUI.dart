import 'package:convas/UIs/register/registerLogic.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setFrequencyUI.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import 'dataPrepareingUI.dart';
import 'optionBeFoundByLearnerUI.dart';

class OptionFrequencySetting extends ConsumerWidget {
  const OptionFrequencySetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite("Register"),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      commonText20BlackCenter("Will you set how often you want to take a lesson?"),
                      const SizedBox(height: 20,),
                      commonText16Gray("We recommend you to set frequency to keep learning"),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:commonButtonOrangeRound(
                          text: "Yes, I will",
                          onPressed: ()  {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return const SetFrequency();
                                },
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                                },
                              ),
                            );
                          },),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:commonButtonOrangeRound(
                          text: "No, I won't",
                          onPressed: () async {
                            await commonShowOkInfoDialog(context, "You can set later easily");
                            ref.read(registerProvider.notifier).setCanBeFound(false);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const DataPreparing()),
                                    (_) => false);
                          },),)
                    ],
                  ),

                ]),
          )),
    );
  }
}
