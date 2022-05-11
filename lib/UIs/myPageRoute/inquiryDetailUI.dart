import 'package:convas/UIs/myPageRoute/inquiryProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonTextFormUI.dart';
import '../../entityIsar/masterEntityIsar.dart';

class InquiryDetail extends ConsumerWidget {
  InquiryDetail({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg = true;
  List<DropdownMenuItem<String>> dropdownItems = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      if (ref.watch(inquiryProvider).inquiryType == "1") {
        setDropdownItems(ref);
        ref
            .read(inquiryProvider.notifier)
            .setInquiryCategory(dropdownItems[0].value!);
      }
    }
    return commonScaffoldScroll(
          context,
          ref,
          MainAxisAlignment.start,
          [
            // const SizedBox(height: 30),
            // commonText16GrayLeft("Please choose what you want to tell"),
            const SizedBox(height: 30),
            ref.watch(inquiryProvider).inquiryType == "1"
                ? categoryDropDown(ref, "inquiryCategoryForBug")
                : Container(),
            commonVerticalGap(),
            freeText(ref),
            commonVerticalGap(),
            commonButtonSecondaryColorRound(
              text: "OK",
              onPressed: ()async {
                FocusScope.of(context).requestFocus(FocusNode());
                String insertedDocId = await ref.read(inquiryProvider.notifier).insertInquiry(ref);
                await commonShowOkInfoDialog(context, "Thanks", "Thank you for your help\nYour inquiry was successfully sent");
                Navigator.pop(context);
                Navigator.pop(context);

              },
            )
          ],
          appBar: commonAppbar(getMasterName(
              "inquiryType", ref.watch(inquiryProvider).inquiryType, ref))
    );
  }

  void setDropdownItems(WidgetRef ref) {
    Map<String, Master> master = getMasterMap("inquiryCategoryForBug", ref);
    master.forEach((key, value) {
      dropdownItems.add(DropdownMenuItem(
        child: commonText16GrayLeft(value.name),
        value: key,
      ));
    });
  }

  Widget categoryDropDown(WidgetRef ref, String masterGroupCode) {
    return Column(
      children: [
        commonText16GrayLeft("Choose function"),
        commonVerticalGap(),
        DropdownButtonFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.black54),
              hintText: "Choose function",
          fillColor: Colors.white,),
          value: ref.watch(inquiryProvider).inquiryCategory,
          onChanged: (value) {
            ref
                .read(inquiryProvider.notifier)
                .setInquiryCategory(value.toString());
          },
          items: dropdownItems,
        )
      ],
    );
  }
}

Widget freeText(WidgetRef ref) {
  return commonTextBoxBordered(
    text: "Inquiry detail",
    initialValue: ref.watch(inquiryProvider).freeText,
    onChanged: (String value) {
      ref.read(inquiryProvider.notifier).setFreeTextWithoutRebuild(value);
    },
    maxLines: 20,
    minLines: 7,
  );
}
