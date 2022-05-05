// import 'package:convas/UIs/register/registerLogic.dart';
// import 'package:convas/UIs/register/registerProvider.dart';
// import 'package:convas/UIs/register/learner/setFrequencyUI.dart';
// import 'package:convas/common/UI/commonButtonUI.dart';
// import 'package:convas/common/UI/commonOthersUI.dart';
// import 'package:convas/common/UI/commonTextUI.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../common/UI/commonPushUI.dart';
// import '../dataPreparingUI.dart';
// import 'XXXXXoptionBeFoundByLearnerUI.dart';
//
// class OptionFrequencySetting extends ConsumerWidget {
//   const OptionFrequencySetting({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     return Scaffold(
//       appBar: commonAppbar(""),
//       body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal:14.0),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       const SizedBox(height: 20,),
//                       commonText24BlackBoldCenter("Will you set how often you want to take a lessonList?"),
//                       const SizedBox(height: 20,),
//                       commonText16Gray("We recommend you to set frequency to keep learning"),
//                     ],
//                   ),
//                   Container(height:120,
//                     width:150,
//                     color:Colors.blue,
//                     child:commonText16Gray("image"),
//                   ),
//
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical:8.0),
//                         child:commonButtonWhiteBorderRound(
//                           text: "No, I won't",
//                           onPressed: () async {
//                             await commonShowOkInfoDialog(context, "You can set later easily");
//                             ref.read(registerProvider.notifier).setCanBeFound(false);
//                             Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const OptionBeFoundLearner()),
//                                     (_) => false);
//                           },),),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical:8.0),
//                         child:commonButtonOrangeRound(
//                           text: "Yes, I will",
//                           onPressed: ()  {
//                             Navigator.of(context).push(
//                               PageRouteBuilder(
//                                 pageBuilder: (context, animation, secondaryAnimation) {
//                                   return const SetFrequency();
//                                 },
//                                 transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                                   return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
//                                 },
//                               ),
//                             );
//                           },),),
//                     ],
//                   ),
//
//                 ]),
//           )),
//     );
//   }
// }
