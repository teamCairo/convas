import 'dart:async';
import 'package:convas/UIs/login/rootUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../daoIsar/settingDaoIsar.dart';
import '../../entityIsar/settingEntityIsar.dart';
import 'loginLogic.dart';
import 'loginPageUI.dart';


class LoginAutoPage extends ConsumerWidget  {
  const LoginAutoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    autoLoginProcess(context,ref);

    return  Scaffold(
      body: SafeArea(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                commonLogoMain(100),
                const SizedBox(height: 30),
                Center(
                  child: commonText16Gray("logging in...")
                ),
              ])
      ),
    );
  }

  Future<void> autoLoginProcess(BuildContext context, WidgetRef ref)async {

    Setting? tmpSetting = await selectIsarSettingByCode("localUserInfo");

    if (tmpSetting != null) {
      await initialProcessLogic(ref, tmpSetting.stringValue1!);
      // ログインに成功した場合
      // チャット画面に遷移＋ログイン画面を破棄
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const Root();
        }),
      );
    } else {
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return LoginPage();
          }));
    }
  }
}