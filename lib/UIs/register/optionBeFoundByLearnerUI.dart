import 'package:convas/UIs/register/registerBirthDateAndGenderUI.dart';
import 'package:convas/UIs/register/registerLogic.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import 'dataPrepareingUI.dart';


class OptionBeFoundLearner extends ConsumerWidget {
  const OptionBeFoundLearner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
                      const SizedBox(height: 20,),
                      commonText20BlackCenter("Do you want to learn with other learners?"),
                      const SizedBox(height: 20),
                      commonText16Gray("This helps you learn cheaply and help each other and..."),
                    ],
                  ),
                  Container(height:120,
                    width:150,
                    color:Colors.blue,
                    child:commonText16Gray("image or slideshow"),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child:commonButtonWhiteBorderRound(
                          text: "No, I don't",
                          onPressed: ()  {
                            ref.read(registerProvider.notifier).setCanBeFound(false);
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const RegisterBirthDateAndGender();
                                },
                                transitionsBuilder:
                                    (context, animation, secondaryAnimation, child) {
                                  return commonFunctionPushSlideHorizon(
                                      context, animation, secondaryAnimation, child);
                                },
                              ),
                            );
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => const RegisterBirthDateAndGender()),
                            //         (_) => false);
                          },),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child:commonButtonOrangeRound(
                          text: "Yes, I do",
                          onPressed: ()  {
                            commonShowOkNgInfoDialog(
                                context,
                                'Other learner can find you',
                                    (){
                                  ref.read(registerProvider.notifier).setCanBeFound(true);
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation, secondaryAnimation) {
                                        return const RegisterBirthDateAndGender();
                                      },
                                      transitionsBuilder:
                                          (context, animation, secondaryAnimation, child) {
                                        return commonFunctionPushSlideHorizon(
                                            context, animation, secondaryAnimation, child);
                                      },
                                    ),
                                  );
                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const RegisterBirthDateAndGender()),
                                  //         (_) => false);
                                });
                          },),),
                    ],
                  ),

                ]),
          )),
    );
  }
}
