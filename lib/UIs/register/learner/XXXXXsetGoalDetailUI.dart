import 'package:convas/UIs/register/learner/XXXXXgoalListData.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/UI/commonPushUI.dart';
import '../dataPreparingUI.dart';
import 'XXXXXmakeMoreSpecific.dart';

class SetGoalDetail extends ConsumerWidget {
  const SetGoalDetail({
    required this.category,
    Key? key,
  }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GoalData> goalList = goalListData(category);

    List<Widget> buttonList = [];
    buttonList.add(commonText24BlackBoldCenter("Let's choose your goal!"));
    buttonList.add(commonVerticalGap());
    buttonList.add(commonText16GrayCenter(
        "We recommend you to set a goal to keep learning"));
    buttonList.add(const SizedBox(height: 40));
    for (int i = 0; i < goalList.length; i++) {
      buttonList.add(commonButtonTitleAndTextWhite(
          goalList[i].title, goalList[i].text, 90, () {
        ref.read(registerProvider.notifier).setGoal(goalList[i].text);
        commonNavigatorPushSlideHorizon(context, MakeMoreSpecific(goalData:goalList[i]));
      }));
      buttonList.add(commonVerticalGap());
    }

    return commonScaffold(context, ref, MainAxisAlignment.spaceBetween, [
      Column(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start, children: buttonList),
          Column(
            children: [
              commonButtonWhiteBorderRound(
                  onPressed: () {
                    commonNavigatorPushSlideHorizon(
                        context, MakeMoreSpecific(goalData: null));
                  },
                  text: 'Other'),
              commonVerticalGap(),
              commonButtonWhiteBorderRound(
                  onPressed: () {
                    commonNavigatorPushSlideHorizon(
                        context, const DataPreparing());
                  },
                  text: 'Skip'),
            ],
          )
        ],
      )
    ]);
    //
    // return Scaffold(
    //   appBar: commonAppbar(ref.watch(registerProvider).goalCategory),
    //   body: SafeArea(
    //       child: Column(
    //         children:[
    //           commonText24BlackBoldCenter("Let's choose your goal!"),
    //           const SizedBox(height:8),
    //           Expanded(child:SingleChildScrollView(
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(horizontal:14.0),
    //               child: Column(
    //                 children: [
    //
    //                   goalCard( "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
    //                       "communicate with local on the trip",
    //                       context,
    //                       ref
    //                   ),
    //                   goalCard( "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
    //                       "communicate with local on the trip",
    //                       context,
    //                       ref
    //                   ),
    //                   goalCard( "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
    //                       "communicate with local on the trip",
    //                       context,
    //                       ref
    //                   ),
    //                   goalCard( "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
    //                       "communicate with local on the trip",
    //                       context,
    //                       ref
    //                   ),
    //                   goalCard( "https://st3.depositphotos.com/12982378/15981/i/450/depositphotos_159817756-stock-photo-multiethnic-couple-of-tourists-with.jpg",
    //                       "communicate with local on the trip",
    //                       context,
    //                     ref
    //                   ),
    //
    //                 ],
    //               ),
    //             ),
    //           )),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical:14.0),
    //             child: commonButtonOrangeRound(
    //                 text: "Type by hand",
    //                 onPressed: (){
    //                   ref.read(registerProvider.notifier).setGoal("");
    //                   Navigator.of(context).push(
    //                     PageRouteBuilder(
    //                       pageBuilder: (context, animation, secondaryAnimation) {
    //                         return const MakeMoreSpecific();
    //                       },
    //                       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //                         return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
    //                       },
    //                     ),
    //                   );
    //                 }),
    //           )
    //         ]
    //       )),
    // );
  }
}
//
// Widget goalCard(
//     String url, String description, BuildContext context, WidgetRef ref) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 8.0),
//     child: GestureDetector(
//       onTap: () {
//         ref.read(registerProvider.notifier).setGoal(description);
//         Navigator.of(context).push(
//           PageRouteBuilder(
//             pageBuilder: (context, animation, secondaryAnimation) {
//               return const MakeMoreSpecific();
//             },
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return commonFunctionPushSlideHorizon(
//                   context, animation, secondaryAnimation, child);
//             },
//           ),
//         );
//       },
//       child: SizedBox(
//         height: 250,
//         width: double.infinity,
//         child: Card(
//             clipBehavior: Clip.antiAlias,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(24),
//             ),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//               SizedBox(
//                 height: 150,
//                 width: double.infinity,
//                 child: Image.network(
//                   url,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: commonText16BlackLeft(description))
//             ])),
//       ),
//     ),
//   );
// }
