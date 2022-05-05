import 'package:convas/UIs/register/learner/setGoalDetailUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/UI/commonButtonUI.dart';
import '../../../common/UI/commonPushUI.dart';
import '../dataPreparingUI.dart';
import 'makeMoreSpecific.dart';

class SetGoal extends ConsumerWidget {
  const SetGoal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonScaffold(context, ref, MainAxisAlignment.spaceBetween, [
      Column(
        children: [
          commonText24BlackBoldCenter("Let's choose your goal!"),
          commonVerticalGap(),
          commonText16GrayCenter("We recommend you to set a goal to keep learning"),
          const SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            commonImageButton('assets/goalTravel.JPG', "Travel", () {
              commonNavigatorPushPushSlideHorizon(context,  const SetGoalDetail(category: "travel"));
            }, (MediaQuery.of(context).size.width - 56) / 2),
            commonVerticalGap(),
            commonImageButton('assets/goalExam.JPG', "Exam", () {
              commonNavigatorPushPushSlideHorizon(context,  const SetGoalDetail(category: "exam"));
            }, (MediaQuery.of(context).size.width - 56) / 2),
          ]),
          commonVerticalGap(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            commonImageButton('assets/goalWork.JPG', "Work", () {
              commonNavigatorPushPushSlideHorizon(context,  const SetGoalDetail(category: "work"));
            }, (MediaQuery.of(context).size.width - 56) / 2),
            commonVerticalGap(),
            commonImageButton('assets/goalFriends.JPG', "Make friends", () {
              commonNavigatorPushPushSlideHorizon(context,  const SetGoalDetail(category: "friends"));
            }, (MediaQuery.of(context).size.width - 56) / 2),
          ]),
          const SizedBox(height: 40),
          commonButtonWhiteBorderRound(
              onPressed: () {
                commonNavigatorPushPushSlideHorizon(context,  MakeMoreSpecific(goalData:null));
              },
              text: 'Other'),
          commonVerticalGap(),
          commonButtonWhiteBorderRound(
              onPressed: () {
                commonNavigatorPushPushSlideHorizon(context,  const DataPreparing());
              },
              text: 'Skip')
        ],
      )
    ]);
  }
}
//
// Widget circleImageButton(String url,String goalCategoryName,WidgetRef ref, BuildContext context){
//   return GestureDetector(
//       onTap:(){
//         ref.read(registerProvider.notifier).setGoalCategory(goalCategoryName);
//         Navigator.of(context).push(
//           PageRouteBuilder(
//             pageBuilder: (context, animation, secondaryAnimation) {
//               return const SetGoalDetail();
//             },
//             transitionsBuilder: (context, animation, secondaryAnimation, child) {
//               return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
//             },
//           ),
//         );
//
//       },
//       child:Column(
//         children: [
//           commonCircleAvatarImage(radius: 40,
//               name: "",
//               image:Image.network(url)),
//           commonText16BlackCenter(goalCategoryName)
//         ],
//       ));
// }
// Widget boxImageButton(String url,String description,String goalCategoryName,WidgetRef ref, BuildContext context){
//   return GestureDetector(
//       onTap:(){
//         ref.read(registerProvider.notifier).setGoalCategory(goalCategoryName);
//         Navigator.of(context).push(
//           PageRouteBuilder(
//             pageBuilder: (context, animation, secondaryAnimation) {
//               return const SetGoalDetail();
//             },
//             transitionsBuilder: (context, animation, secondaryAnimation, child) {
//               return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
//             },
//           ),
//         );
//
//       },
//       child:Column(
//         children: [
//           Stack(
//              alignment: AlignmentDirectional.topStart,
//             children: [
//               SizedBox(
//               height: 180.0,
//               width:150,
//               child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0),
//                       child: Image.network(
//                         url,
//                         fit: BoxFit.cover,
//                       )),),
//               Padding(
//                   padding: const EdgeInsets.only(top: 10.0,left:10),
//               child: commonText16GrayLeft(description)),
//             ],
//           ),
//           commonText16BlackCenter(goalCategoryName)
//         ],
//       ));
// }
