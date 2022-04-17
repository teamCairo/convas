import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setDayOfWeek.dart';
import 'package:convas/UIs/register/setFrequencyLogic.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/UI/commonPushUI.dart';


class SetFrequency extends ConsumerWidget {
  const SetFrequency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    String continueUntilDate = outputFormat.format(ref.watch(registerProvider).continualUntil!);

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
                      const SizedBox(height: 20,),
                      commonText20BlackCenter(
                          "How often do you want to take a lesson?"),
                      const SizedBox(height: 20,),
                      commonText16Gray(
                          "We recommend 3 or more times per week to keep learning"),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: TextFormField(
                          // テキスト入力のラベルを設定
                          decoration: const InputDecoration(labelText: "Times"),
                          onChanged: (String value) {
                            if (value == "") {
                              ref.watch(registerProvider.notifier)
                                  .setTimesAWeek(0);
                            } else {
                              ref.watch(registerProvider.notifier)
                                  .setTimesAWeek(int.parse(value));
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      commonText20BlackCenter("times per week"),
                      // commonText16Gray("We recommend you"),
                    ],
                  ),
                  Row(children: [
                    commonText20BlackCenter(continueUntilDate),
                    const SizedBox(width: 6),
                    commonButtonSmallOrangeRound(
                        text: "Select",
                        onPressed: () => selectDateForFrequencyUntil(context, ref)
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: commonButtonOrangeRound(
                      text: "OK",
                      onPressed: () {
                        bool checkResult = checkFrequency(ref);
                        if (checkResult) {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) {
                                return const SetDayOfWeek();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return commonFunctionPushSlideHorizon(
                                    context, animation, secondaryAnimation,
                                    child);
                              },
                            ),
                          );
                        } else {
                          commonShowOkInfoDialog(
                              context, "You can set 1～7 as times per week");
                        }
                      },),),

                ]),
          )),
    );
  }
}
