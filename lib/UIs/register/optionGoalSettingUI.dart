import 'package:convas/UIs/register/setGoalUI.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import 'optionFrequencySettingUI.dart';

class OptionGoalSetting extends ConsumerWidget {
  const OptionGoalSetting({
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
                commonText20BlackCenter("Will you set a goal?"),
                const SizedBox(height: 20,),
                commonText16Gray("We recommend you"),
                commonText16Gray("to set a goal to keep learning"),
              ],
            ),
        Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:Builder(
                  builder: (context) {
                    return commonButtonOrangeRound(
                      text: "Yes, I will",
                      onPressed: ()  {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const SetGoal();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                            },
                          ),
                        );
                      },);
                  }
                ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:Builder(
                  builder: (context) {
                    return commonButtonOrangeRound(
              text: "No, I won't",
              onPressed: () async {
                    await commonShowOkInfoDialog(context, "You can set later easily");
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const OptionFrequencySetting();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                        },
                      ),
                    );

              },);
                  }
                ),)
            ],
        ),

          ])),
    );
  }
}
