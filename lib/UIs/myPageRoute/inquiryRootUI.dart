import 'package:convas/UIs/myPageRoute/inquiryProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:convas/common/provider/masterProvider.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import 'inquiryDetailUI.dart';

class InquiryRoot extends ConsumerWidget {
  const InquiryRoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(inquiryProvider.notifier).initialize();

    return commonScaffold(context, ref, MainAxisAlignment.start, [
      commonText24BlackBoldCenter("Thanks for contacting us"),
      const SizedBox(height: 30),
      commonText16GrayLeft("Please choose what you want to tell"),
      const SizedBox(height: 100),
      buttonChooseInquiryType("1", ref, context),
      commonVerticalGap(),
      ref.watch(userDataProvider).userData["userType"]=="1"?buttonChooseInquiryType("2", ref, context):buttonChooseInquiryType("3", ref, context),
      commonVerticalGap(),
      buttonChooseInquiryType("4", ref, context),
      commonVerticalGap(),
      buttonChooseInquiryType("5", ref, context),
    ],
    appBar: commonAppbar("Contact us"));
  }
}

Widget buttonChooseInquiryType(
    String typeCode, WidgetRef ref, BuildContext context) {
  String inquiryTypeName = getMasterName("inquiryType", typeCode, ref);
  return commonButtonSecondaryColorRound(
    text: inquiryTypeName,
    onPressed: () {
      ref.read(inquiryProvider.notifier).setInquiryTypeWithoutRebuild(typeCode);
      commonNavigatorPushSlideHorizon(context, InquiryDetail());
    },
  );
}
