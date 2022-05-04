import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/learner/setGoalDetailUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/UI/commonPushUI.dart';

class SetGoal extends ConsumerWidget {
  const SetGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbar(""),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:14.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        commonText24BlackBoldCenter("Let's choose your goal!"),
                        const SizedBox(height:50),
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
                                      "Popular",
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
                                  boxImageButton(
                                      "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                      "this is ",
                                      "Travel",
                                      ref,
                                      context

                                  ),
                                  const SizedBox(width:6),
                                  boxImageButton(
                                      "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
                                      "this is ",
                                      "Popular",
                                      ref,
                                      context
                                  ),

                                ],
                              ),
                            ),
                          ]
                        ),
                        const SizedBox(height:50),
                      ],
                    ),
                  ]),
            ),
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
Widget boxImageButton(String url,String description,String goalCategoryName,WidgetRef ref, BuildContext context){
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
          Stack(
             alignment: AlignmentDirectional.topStart,
            children: [
              SizedBox(
              height: 180.0,
              width:150,
              child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      )),),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0,left:10),
              child: commonText16GrayLeft(description)),
            ],
          ),
          commonText16BlackCenter(goalCategoryName)
        ],
      ));
}