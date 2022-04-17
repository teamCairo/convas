import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setNameAndBirthdateUI.dart';
import 'package:convas/UIs/register/setTeacherInfo.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';

class SetUserType extends ConsumerWidget {
  const SetUserType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite("Register"),
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    const SizedBox(height: 20,),
                    commonText20BlackCenter("Are you English learner or teacher?"),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:commonButtonOrangeRound(
                        text: "Learner",
                        onPressed: ()  {
                          ref.read(registerProvider.notifier).setUserType("1");
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return const SetNameAndBirthdate();
                              },
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                              },
                            ),
                          );
                        },),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:commonButtonOrangeRound(
                        text: "Teacher",
                        onPressed: ()  {
                          ref.read(registerProvider.notifier).setUserType("2");
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return const SetTeacherInfo();
                              },
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                              },
                            ),
                          );
                        },),)
                  ],
                ),
              ])),
    );
  }
}
