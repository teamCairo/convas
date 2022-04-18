import 'package:convas/UIs/register/registerLogic.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dataPrepareingUI.dart';


class OptionBeFoundLearner extends ConsumerWidget {
  const OptionBeFoundLearner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite("Register"),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      commonText20BlackCenter("Do you want to learn with other learners?"),
                      const SizedBox(height: 20,),
                      commonText16Gray("This helps you learn cheaply"),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:commonButtonOrangeRound(
                          text: "Yes, I do",
                          onPressed: ()  {
                            commonShowOkNgInfoDialog(
                                context,
                                'Other learner can find you',
                                (){
                                  ref.read(registerProvider.notifier).setCanBeFound(true);
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const DataPreparing()),
                                          (_) => false);
                                });
                          },),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:commonButtonOrangeRound(
                          text: "No, I don't",
                          onPressed: ()  {
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
