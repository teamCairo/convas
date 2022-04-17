import 'package:convas/UIs/login/rootUI.dart';
import 'package:convas/UIs/register/registerProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../developerLogic/testDataMenuSpeedDial.dart';
import '../register/optionGoalSettingUI.dart';
import '../register/setUserTypeUI.dart';
import 'loginLogic.dart';
import 'loginProvider.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final infoText = ref.watch(infoTextProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(height: 45),
                  commonLogoMain(120),
                  const SizedBox(height: 45),
                  commonTextBoxBordered(
                      text: "E-Mail",
                      onChanged: (String value) {
                        ref.read(emailProvider.state).update((state) => value);
                      },
                      passwordSecure:false
                  ),
                  const SizedBox(height: 20),
                  commonTextBoxBordered(
                      text: "Password(more than 6 letters)",
                      onChanged: (String value) {
                        ref.read(passwordProvider.state).update((state) => value);
                      }, passwordSecure: true),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(infoText),
                  commonButtonOrangeRound(
                    text: "Sign Up",
                    onPressed: () async {
                      try {
                        // メール/パスワードでユーザー登録
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final UserCredential result =
                        await auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // 登録したユーザー情報
                        ref.read(userProvider.state).update((state) => result.user);

                        ref
                            .read(infoTextProvider.state)
                            .update((state) => "登録OK:" + ref.watch(emailProvider));

                        // await insertUserToFirebase(context,ref,email);
                        ref.read(registerProvider.notifier).initialize();
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return const SetUserType();
                          }),
                        );
                      } catch (e) {
                        // 登録に失敗した場合

                        ref
                            .read(infoTextProvider.state)
                            .update((state) => "登録NG:${e.toString()}");
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  commonButtonWhiteBorderRound(
                    text: "Log In",
                    onPressed: () async {
                      try {
                        // メール/パスワードでログイン
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final UserCredential result =
                        await auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // ログインしたユーザー情報
                        ref.read(userProvider.state).update((state) => result.user);
                        await loginCommonProcess(context, ref, email);
                      } catch (e) {
                        // ログインに失敗した場合
                        ref
                            .read(infoTextProvider.state)
                            .update((state) => "ログインに失敗しました:${e.toString()}");
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: testDataMenuSpeedDial(ref)
    );
  }

  Future<void> loginCommonProcess(
      BuildContext context, WidgetRef ref, String email) async {
    await initialProcessLogic(ref,email);

    // ログインに成功した場合
    // チャット画面に遷移＋ログイン画面を破棄
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return const Root();
      }),
    );
  }
}
