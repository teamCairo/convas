import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import '../login/rootUI.dart';
import 'dataPrepareingUI.dart';


class RegisterBirthDateAndGender extends ConsumerWidget {
  const RegisterBirthDateAndGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite(""),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      commonText24BlackBoldCenter("Set your Info for other teachers or learners!!"),
                      const SizedBox(height: 20),
                    ],
                  ),

                  Column(
                    children: [
                      commonText24BlackBoldCenter("Your gender"),
                      const SizedBox(height: 8),
                      Row(
                        children:[commonIconButtonSmallWhiteBorderRound(
                            onPressed: () {

                            },
                            text: 'Female',
                            iconData: Icons.male),
                          commonIconButtonSmallWhiteBorderRound(
                              onPressed: () {

                              },
                              text: 'Male',
                              iconData: Icons.female)
                        ]
                      )
                    ],
                  ),
                  Column(
                    children: [
                      commonText24BlackBoldCenter("Your birthday"),
                      const SizedBox(height: 8),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:commonButtonOrangeRound(
                      text: "OK",
                      onPressed: ()  {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const DataPreparing();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                            },
                          ),
                        );
                      },),),

                ]),
          )),
    );
  }
}
