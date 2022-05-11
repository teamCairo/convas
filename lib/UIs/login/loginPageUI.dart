import 'package:convas/UIs/register/registerProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../developerLogic/testDataMenuSpeedDial.dart';
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

    return commonScaffoldScroll(
        context,
        ref,
        MainAxisAlignment.start,
        [
          Column(
            children: <Widget>[
              const SizedBox(height: 8),
              commonLogoMain(140),
              commonVerticalGap(),
              commonTextBoxBordered(
                  text: "E-mail",
                  onChanged: (String value) {
                    ref.read(emailProvider.state).update((state) => value);
                  },
                  passwordSecure: false),
              commonVerticalGap(),
              commonTextBoxBordered(
                  text: "Password",
                  onChanged: (String value) {
                    ref.read(passwordProvider.state).update((state) => value);
                  },
                  passwordSecure: true),
            ],
          ),
          Column(
            children: <Widget>[
              Text(infoText),
              commonVerticalGap(),
              commonButtonSecondaryColorRound(
                  text: "Log In",
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    try {
                      // メール/パスワードでログイン
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final UserCredential result =
                          await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // ログインしたユーザー情報
                      ref
                          .read(userProvider.state)
                          .update((state) => result.user);
                      userLocalDataCheckForLogin(email, ref, context,);
                    } catch (e) {
                      // ログインに失敗した場合
                      ref
                          .read(infoTextProvider.state)
                          .update((state) => "ログインに失敗しました:${e.toString()}");
                    }
                  }),
              commonVerticalGap(),
              commonButtonWhiteBorderRound(
                  text: "Sign Up",
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final UserCredential result =
                          await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // 登録したユーザー情報
                      ref
                          .read(userProvider.state)
                          .update((state) => result.user);

                      ref.read(infoTextProvider.state).update(
                          (state) => "登録OK:" + ref.watch(emailProvider));

                      // await insertUserToFirebase(context,ref,email);
                      ref.read(registerProvider.notifier).initialize();
                      userLocalDataCheckForInsert(email, ref, context,);
                    } catch (e) {
                      // 登録に失敗した場合

                      ref
                          .read(infoTextProvider.state)
                          .update((state) => "登録NG:${e.toString()}");
                    }
                  }),
            ],
          ),
        ],
        floatingActionButton: testDataMenuSpeedDial(ref, context));
  }
}