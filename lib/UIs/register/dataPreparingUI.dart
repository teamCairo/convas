
import 'package:convas/UIs/register/registerLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';

class DataPreparing extends ConsumerWidget {
  const DataPreparing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    commonRegisterLogic(ref, context);

    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                commonLogoMain(100),
                const SizedBox(height: 30),
                Center(
                    child: commonText16GrayCenter(
                        "We are preparing your data...\ntakes a bit of time")
                ),
              ])
      ),
    );
  }
}