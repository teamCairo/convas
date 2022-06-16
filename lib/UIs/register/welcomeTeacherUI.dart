import 'package:convas/UIs/register/setNameAndPhotoUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextUI.dart';

class WelcomeTeacher extends ConsumerWidget {
  WelcomeTeacher({
    Key? key,
  }) : super(key: key);

  final images = [
    "assets/teacherWelcome1.JPG",
    "assets/teacherWelcome2.JPG",
    "assets/teacherWelcome3.JPG",
    "assets/teacherWelcome4.JPG",
    // "assets/teacherWelcome5.JPG",
  ];

  bool initialProcessFlg=true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(conceptForSlideProvider).initialize();

    }
    return commonScaffoldScroll(
        context,
        ref,
        MainAxisAlignment.start,
        [
          // commonText30BlackBoldLeft("You can teach English and get money"),
          commonText30BlackBoldLeft("You can teach English here"),
          commonVerticalGap(),
          carouselSliderBuilderForSlide(ref, images,MediaQuery.of(context).size.width),
          commonVerticalGap(),
          buildIndicatorForSlide(ref,images.length),
          commonVerticalGap(),
          commonButtonSecondaryColorRound(
            text: "Next",
            onPressed: () async {
              commonNavigatorPushSlideHorizon(context, const SetNameAndPhoto());
            },
          )
        ],);
  }
}
