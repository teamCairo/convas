import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import '../login/rootUI.dart';


class RegisterFinished extends ConsumerWidget {
  const RegisterFinished({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite("Register"),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      commonText20BlackCenter("Setting has been done!!"),
                      const SizedBox(height: 20,),
                      commonText16Gray("Now, you can use our service"),
                    ],
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:commonButtonOrangeRound(
                      text: "OK",
                      onPressed: ()  {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const Root();
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
