import 'package:convas/UIs/register/registerLogic.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setDayOfWeek.dart';
import 'package:convas/UIs/register/setFrequencyLogic.dart';
import 'package:convas/UIs/register/setNameAndBirthdateLogic.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/UI/commonPushUI.dart';

class SetTeacherInfo extends ConsumerWidget {
  const SetTeacherInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    String birthDate;
    if(ref.watch(registerProvider).birthDate==null){
      birthDate ="          ";
    }else{
      birthDate = outputFormat.format(ref.watch(registerProvider).birthDate!);
    }

    return Scaffold(
      appBar: commonAppbarWhite("Register"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  commonText20BlackCenter(
                      "Set your information"),
                  const SizedBox(
                    height: 20,
                  ),
                  // commonText16Gray(
                  //     "We recommend "),
                ],
              ),

              Column(
                children: [
                  TextFormField(
                    // テキスト入力のラベルを設定
                    decoration: const InputDecoration(labelText: "Name"),
                    onChanged: (String value) {
                      ref.watch(registerProvider.notifier).setName(value);
                    },
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: commonText14OrangeLeft("BirthDate")),
                  ),
                  Row(children: [
                    Column(
                      children: [
                        commonText20BlackCenter(birthDate),
                        Container(height:2,
                            width:110,
                            color:Colors.orange),
                      ],
                    ),
                    const SizedBox(width: 6),
                    commonButtonSmallOrangeRound(
                        text: "Select",
                        onPressed: () => selectDateForBirthDate(context, ref))
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commonButtonOrangeRound(
                  text: "OK",
                  onPressed: () {
                    registerLogic(ref,context);
                  },
                ),
              ),
            ]),
      )),
    );
  }
}
