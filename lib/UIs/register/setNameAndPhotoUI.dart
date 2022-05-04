import 'package:convas/UIs/register/learner/optionGoalSettingUI.dart';
import 'package:convas/UIs/register/registerBirthDateAndGenderUI.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextFormUI.dart';

class SetNameAndPhoto extends ConsumerWidget {
  const SetNameAndPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbar(""),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  commonText24BlackBoldCenter("Edit your photo and name"),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    child: Stack(
                      alignment: const Alignment(0.9, 0.9),
                      children: [commonCircleAvatarImage(
                          radius: 80,
                          image:ref.watch(registerProvider).photo==null?null:Image.file(ref.watch(registerProvider).photo!),
                          name:""
                      ),
                        const Icon(Icons.camera_alt),
                      ],
                    ),
                    onTap: () async=> await ref.watch(registerProvider).setPhoto(ref),
                  ),
                  const SizedBox(height:50),
                  commonTextBoxBordered(
                      text: "Name",
                      onChanged: (String value) {
                        ref.watch(registerProvider.notifier).setName(value);
                      },
                      passwordSecure:false
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top:8.0),
                  //   child: Align(
                  //       alignment: Alignment.topLeft,
                  //       child: commonText14OrangeLeft("BirthDate")),
                  // ),
                  // Row(children: [
                  //   Column(
                  //     children: [
                  //       commonText20BlackCenter(birthDate),
                  //       Container(height:2,
                  //           width:110,
                  //           color:Colors.orange),
                  //     ],
                  //   ),
                  //   const SizedBox(width: 6),
                  //   commonButtonSmallOrangeRound(
                  //       text: "Select",
                  //       onPressed: () => selectDateForBirthDate(context, ref))
                  // ]),
                ],
              ),
              Column(
                children: [
                  commonButtonOrangeRound(
                    text: "Next",
                    onPressed: () {
                      if(ref.watch(registerProvider).userType=="1"){
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const OptionGoalSetting();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(
                                  context, animation, secondaryAnimation, child);
                            },
                          ),
                        );

                      }else{
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const RegisterBirthDateAndGender();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(
                                  context, animation, secondaryAnimation, child);
                            },
                          ),
                        );

                      }
                    },
                  ),
                  const SizedBox(height:14)
                ],
              ),
            ]),
      )),
    );
  }
}
