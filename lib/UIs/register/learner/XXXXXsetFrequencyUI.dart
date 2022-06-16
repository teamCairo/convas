import 'dart:developer';

import 'package:convas/UIs/register/learner/XXXXXsetFrequencyProvider.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/learner/XXXXXsetDayOfWeek.dart';
import 'package:convas/UIs/register/learner/XXXXXsetFrequencyLogic.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/UI/commonPushUI.dart';
import '../dataPreparingUI.dart';

class SetFrequency extends ConsumerWidget {
  SetFrequency({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(setFrequencyProvider.notifier).initialize();
    }
    return commonScaffold(context, ref, MainAxisAlignment.spaceBetween, [
      Column(
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          commonText24BlackBoldCenter(
              "How often do you want to take a lesson?"),
          commonVerticalGap(),
          commonText16GrayCenter(
              "We recommend 3 or more times per week to keep learning"),
          const SizedBox(
            height: 30,
          ),
          // levelArea(ref, context),
          const SizedBox(
            height: 30,
          ),
          levelAreaVer2(ref, context)
        ],
      ),
      commonButtonSecondaryColorRound(
        text: "OK",
        onPressed: () {
          bool checkResult = checkFrequency(ref);
          if (checkResult) {
            commonNavigatorPushSlideHorizon(context, const DataPreparing());
          } else {
            // commonShowOkInfoDialog(
            //     context, "You can set 1～7 as times per week");
          }
        },
      ),
    ]);
  }
}

//
// Widget levelArea(WidgetRef ref, BuildContext context) {
//   double gap = 8;
//   return Row(children: [
//     towerUnit( context, "Mon",ref),
//     SizedBox(width: gap),
//     towerUnit(context, "Tue",ref),
//     SizedBox(width: gap),
//     towerUnit(context, "Wed",ref),
//     SizedBox(width: gap),
//     towerUnit(context, "Thu",ref),
//     SizedBox(width: gap),
//     towerUnit(context, "Fri",ref),
//     SizedBox(width: gap),
//     towerUnit(context, "Sat",ref),
//     SizedBox(width: gap),
//     towerUnit(context, "Sun",ref),
//     const SizedBox(width: 2),
//     Align(
//       alignment: Alignment.topCenter,
//       child: commonText16GrayCenter("min"),
//     )
//   ]);
// }


Widget levelAreaVer2(WidgetRef ref, BuildContext context) {
  double gap = 8;
  return Row(children: [
    towerUnitVer2( context, "Mon",ref),
    SizedBox(width: gap),
    towerUnitVer2(context, "Tue",ref),
    SizedBox(width: gap),
    towerUnitVer2(context, "Wed",ref),
    SizedBox(width: gap),
    towerUnitVer2(context, "Thu",ref),
    SizedBox(width: gap),
    towerUnitVer2(context, "Fri",ref),
    SizedBox(width: gap),
    towerUnitVer2(context, "Sat",ref),
    SizedBox(width: gap),
    towerUnitVer2(context, "Sun",ref),
    const SizedBox(width: 2),
    Align(
      alignment: Alignment.topCenter,
      child: commonText16GrayCenter("min"),
    )
  ]);
}


Widget towerUnitVer2(BuildContext context, String text,WidgetRef ref) {
  int height=120;
  int level =ref.watch(setFrequencyProvider).getLevel(text);
  Color color = Colors.green;
  // Color color = Colors.black12;
  //   if(level<39){
  //     color = Colors.lightGreenAccent;
  //   }else if(level<79){
  //     color = Colors.yellow;
  //
  //   }else{
  //     color = Colors.deepOrange;
  //   }

  return Column(children: [
    commonText16GrayCenter((level).toString()),
    GestureDetector(
      onPanUpdate: (details){
        log(details.localPosition.dy.toString());
        int level = 0;
        if(details.localPosition.dy>0&&details.localPosition.dy<=height){
          level =(height-details.localPosition.dy.toInt())~/10*10;
          // level = (height-details.localPosition.dy.toInt()/10).toInt()*10;
        }else if(details.localPosition.dy<=0){
          level =height;
        }
        ref.read(setFrequencyProvider.notifier).setLevel(text, level);
      },
      child: Container(
        height:height.toDouble(),
        width: (MediaQuery.of(context).size.width - 118) / 7,
        color:Colors.black12,
          child:Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:level.toDouble(),
              width: (MediaQuery.of(context).size.width - 118) / 7,
              color:color,
            ),
          )
      ),
    ),
    commonText16GrayCenter(text)
  ]);
}

Widget towerUnit(BuildContext context, String text,WidgetRef ref) {
  double gap = 2;
  int level =ref.watch(setFrequencyProvider).getLevel(text);
  return Column(children: [
    commonText16GrayCenter((level*20).toString()),
    blockUnit(level, 6, context,ref,text),
    SizedBox(height: gap),
    blockUnit(level, 5, context,ref,text),
    SizedBox(height: gap),
    blockUnit(level, 4, context,ref,text),
    SizedBox(height: gap),
    blockUnit(level, 3, context,ref,text),
    SizedBox(height: gap),
    blockUnit(level, 2, context,ref,text),
    SizedBox(height: gap),
    blockUnit(level, 1, context,ref,text),
    SizedBox(height: gap),
    blockUnit(level, 0, context,ref,text),
    commonText16GrayCenter(text)
  ]);
}

Widget blockUnit(int level, int position, BuildContext context,WidgetRef ref,String text) {
  Color color = Colors.black12;
  double width = (MediaQuery.of(context).size.width - 118) / 7;
  if (level >= position) {

    if(level==0){
      color = Colors.black54;
    }else if(level<3){
      color = Colors.lightGreenAccent;
    }else if(level<5){
      color = Colors.yellow;

    }else{
      color = Colors.deepOrange;

    }
  }

  return GestureDetector(
      onTap: () {
        ref.read(setFrequencyProvider.notifier).setLevel(text, position);
      }, child: Container(width: width, height: 12, color: color));
}
