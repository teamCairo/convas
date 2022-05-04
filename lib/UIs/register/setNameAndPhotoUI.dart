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
    return commonScaffold(context, ref, MainAxisAlignment.start, [
      commonText24BlackBoldCenter("Edit your photo and name"),
      const SizedBox(height: 30),
      commonCircleAvatarUserImageUpload(
          radius: 80,
          image: ref.watch(registerProvider).photo == null
              ? null
              : Image.file(ref.watch(registerProvider).photo!),
          name: "",
          onTap: () async {
            await ref.watch(registerProvider).setPhoto(ref);
          }),
      const SizedBox(height: 30),
      commonTextBoxBordered(
          text: "Name",
          onChanged: (String value) {
            ref.watch(registerProvider.notifier).setName(value);
          },
          passwordSecure: false),
      commonVerticalGap(),
      commonButtonOrangeRound(
        text: "Next",
        onPressed: () {
          if (ref.watch(registerProvider).userType == "1") {
            commonNavigatorPushPushSlideHorizon(context,  const OptionGoalSetting());
          } else {
            commonNavigatorPushPushSlideHorizon(context,  const RegisterBirthDateAndGender());
          }
        },
      )
    ]);
  }
}
