import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setGoalDetailUI.dart';
import 'package:convas/UIs/register/setGoalLogic.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


import '../../common/UI/commonPushUI.dart';
import 'optionFrequencySettingUI.dart';

class SetGoal extends ConsumerWidget {
  const SetGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // DateFormat outputFormat = DateFormat('yyyy/MM');
    // String deadline = outputFormat.format(ref.watch(registerProvider).goalDeadline!);

    return Scaffold(
      appBar: commonAppbarWhite(""),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      commonText20BlackCenter("Let's choose your goal!"),
                      
                      Column(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Travel",
                                    ref,
                                    context

                                ),

                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Examination",
                                    ref,
                                    context
                                ),

                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Work",
                                    ref,
                                    context
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Travel",
                                    ref,
                                    context

                                ),

                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Examination",
                                    ref,
                                    context
                                ),

                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Work",
                                    ref,
                                    context
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Travel",
                                    ref,
                                    context

                                ),

                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Examination",
                                    ref,
                                    context
                                ),

                                circleImageButton(
                                    "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                    "Work",
                                    ref,
                                    context
                                ),
                              ],
                            ),
                          ),
                        ]
                      )
                      // const SizedBox(height: 20),
                      // commonText16Gray("We recommend short term goal and specific deadline"),
                      // commonText16Gray("example:join a online language exchange Meetup and make friends this year"),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: commonButtonSmallOrangeRound(
                      //         text: "More examples",
                      //         onPressed: (){
                      //
                      //     }),
                      //   ),
                      // )
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     TextFormField(
                  //     // テキスト入力のラベルを設定
                  //     decoration: const InputDecoration(labelText: "Goal"),
                  //       onChanged: (String value) {
                  //         ref.read(registerProvider.notifier).setGoal(value);
                  //       },
                  //     style: const TextStyle(
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(top:8.0),
                  //       child: Align(
                  //           alignment: Alignment.topLeft,
                  //           child: commonText14OrangeLeft("Deadline")),
                  //     ),
                  //     Row(children:[
                  //       commonText20BlackCenter(deadline),
                  //       const SizedBox(width:6),
                  //       commonButtonSmallOrangeRound(
                  //           text: "Select",
                  //         onPressed: () => selectDate(context,ref)
                  //       )
                  //     ])
                  //   ],
                  // ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(top:40),
                  //       child:commonButtonOrangeRound(
                  //         text: "OK",
                  //         onPressed: ()  {
                  //           Navigator.of(context).push(
                  //             PageRouteBuilder(
                  //               pageBuilder: (context, animation, secondaryAnimation) {
                  //                 return const OptionFrequencySetting();
                  //               },
                  //               transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  //                 return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                  //               },
                  //             ),
                  //           );
                  //         },),)
                  //   ],
                  // ),
                ]),
          )),
    );
  }
}

Widget circleImageButton(String url,String goalCategoryName,WidgetRef ref, BuildContext context){
  return GestureDetector(
    onTap:(){
      ref.read(registerProvider.notifier).setGoalCategory(goalCategoryName);
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SetGoalDetail();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
          },
        ),
      );

    },
        child:Column(
          children: [
            commonCircleAvatarImage(radius: 40,
                name: "",
                image:Image.network(url)),
            commonText16BlackCenter(goalCategoryName)
          ],
        ));
}