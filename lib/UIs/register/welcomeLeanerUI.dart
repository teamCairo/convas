import 'package:convas/UIs/register/setNameAndPhotoUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonPushUI.dart';

class WelcomeLearner extends ConsumerWidget {
  WelcomeLearner({
    Key? key,
  }) : super(key: key);

  final images = [
    "assets/learnerWelcome1.JPG",
    "assets/learnerWelcome2.JPG",
    "assets/learnerWelcome3.JPG",
    "assets/learnerWelcome4.JPG",
    // "assets/learnerWelcome5.JPG",
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
        [carouselSliderBuilderForSlide(ref, images,MediaQuery.of(context).size.width),
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
