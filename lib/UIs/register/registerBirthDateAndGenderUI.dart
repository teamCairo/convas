import 'package:convas/UIs/register/learner/setGoalUI.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import 'dataPreparingUI.dart';
import 'package:intl/intl.dart';

class RegisterBirthDateAndGender extends ConsumerWidget {
  const RegisterBirthDateAndGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String birthDatetText = "";
    if (ref.watch(registerProvider).birthDate == null) {
      birthDatetText = "Add your birthdate";
    } else {
      DateFormat outputFormat = DateFormat('yyyy/MM/dd');
      birthDatetText =
          outputFormat.format(ref.watch(registerProvider).birthDate!);
    }

    double widthHalfButton = (MediaQuery.of(context).size.width-56)/2;

    return commonScaffold(context, ref, MainAxisAlignment.spaceBetween, [
      Column(
        children: [
          commonText24BlackBoldLeft("Your gender"),
          commonVerticalGap(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            genderButton("1", 'Male',ref,widthHalfButton),
            commonHorizontalGap(),
            genderButton("2", 'Female',  ref,widthHalfButton),
          ]),
          commonVerticalGap(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            genderButton("3", 'Others', ref,widthHalfButton),
            commonHorizontalGap(),
            genderButton("4", 'Secret', ref,widthHalfButton),
          ]),
          const SizedBox(height:30),
          levelArea(ref,widthHalfButton),
          commonText24BlackBoldLeft("Your birthday"),
          commonVerticalGap(),
          commonButtonWhiteBorderRound(
            text: birthDatetText,
            onPressed: () async {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1940, 1, 1),
                  maxTime: DateTime.now(), onConfirm: (date) {
                    ref.read(registerProvider.notifier).setBirthDate(date);
                  },
                  currentTime:
                  ref.watch(registerProvider).birthDate ?? DateTime.now(),
                  locale: LocaleType.en);
            },
          ),
        ],
      ),
      commonButtonSecondaryColorRound(
        text: "OK",
        onPressed: () {
    if (ref.watch(registerProvider).userType == "1") {
      commonNavigatorPushPushSlideHorizonReplacement(context,  const SetGoal());

    }else{
      commonNavigatorPushPushSlideHorizonReplacement(context,  const DataPreparing());

    }
        },
      ),
    ]);
  }
}

Widget genderButton(
    String genderCode, String genderName, WidgetRef ref,double width) {
  if (ref.watch(registerProvider).gender == genderCode) {
    return commonButtonSecondaryColorRound(
        onPressed: () {
          ref.read(registerProvider.notifier).setGender(genderCode);
        },
        text: genderName,
        width:width
    );
  } else {
    return commonButtonRoundWhiteSmall(
        width:width,
        onPressed: () {
          ref.read(registerProvider.notifier).setGender(genderCode);
        },
        text: genderName);
  }
}

Widget levelArea(WidgetRef ref, double width) {
  if (ref.watch(registerProvider).userType == "1") {
    return Column(
      children: [
        commonText24BlackBoldLeft("Your English level"),
        commonVerticalGap(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          levelButton("1", 'Beginner', ref,width),
          commonHorizontalGap(),
          levelButton("2", 'Intermediate', ref,width),
        ]),
        commonVerticalGap(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          levelButton("3", 'Advanced', ref,width),
          commonHorizontalGap(),
          levelButton("4", 'Native', ref,width),
        ]),
        const SizedBox(height:30),
      ],
    );
  } else {
    return Container();
  }
}

Widget levelButton(
    String levelCode, String levelName, WidgetRef ref,double width) {
  if (ref.watch(registerProvider).level == levelCode) {
    return commonButtonSecondaryColorRound(
        width:width,
        onPressed: () {
          ref.read(registerProvider.notifier).setLevel(levelCode);
        },
        text: levelName);
  } else {
    return commonButtonRoundWhiteSmall(
        width:width,
        onPressed: () {
          ref.read(registerProvider.notifier).setLevel(levelCode);
        },
        text: levelName);
  }
}
