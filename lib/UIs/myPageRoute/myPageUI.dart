import 'package:convas/UIs/myPageRoute/settingPageUI.dart';
import 'package:convas/UIs/openRoom/openRoomListUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/commonValues.dart';
import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../common/provider/userProvider.dart';
import '../login/loginPageUI.dart';
import '../openRoom/createOpenRoomUI.dart';
import 'inquiryRootUI.dart';

class MyPage extends ConsumerWidget {
  MyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black38, width: 0.5))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(children: [
                        commonText20BlackLeftBold(
                            ref.watch(userDataProvider).userData["name"] ?? ""),
                        commonButtonWhiteRoundSquareSmall(
                          text: "Edit Profile",
                          onPressed: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return SettingPage();
                              }),
                            );
                          },
                        )
                      ])),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: commonCircleAvatarImage(
                        radius: 40,
                        image: ref.watch(userDataProvider).mainPhotoData,
                        name: ref.watch(userDataProvider).userData["name"]),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bigIconButton(
                    text: "Logout",
                    icon: Icons.logout,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Information"),
                            content: GestureDetector(
                              onDoubleTap: (){
                                logoutProcess( ref,  context);
                              },
                                child: Container(
                                    color: Colors.white,
                                    child: const Text(
                                        "Only administrator can logout"))),
                            actions: [
                              TextButton(
                                  child: const Text("OK",
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () => Navigator.pop(context),
                                  style: ElevatedButton.styleFrom(
                                    primary: commonColorSecondary,
                                  )),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  bigIconButton(
                    text: "Contact us",
                    icon: Icons.mail_outline,
                    onPressed: () async {
                      commonNavigatorPushSlideHorizon(
                          context, const InquiryRoot());
                    },
                  ),
                  bigIconButton(
                    text: "How to study",
                    icon: Icons.book_rounded,
                    onPressed: () async {
                      commonShowOkInfoDialog(context, "Information",
                          "Explanation of this App is coming soon..");
                      // await Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) {
                      //     return const CalendarEdit(null);
                      //   }),
                      // );
                    },
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bigIconButton(
                    text: "Open room",
                    icon: Icons.add_call,
                    onPressed: () async {
                      commonNavigatorPushSlideHorizon(context, CreateOpenRoom());
                    },
                  ),
                  bigIconButton(
                    text: "Open room list",
                    icon: Icons.meeting_room,
                    onPressed: () async {
                      commonNavigatorPushSlideHorizon(
                          context, OpenRoomList());
                    },
                  ),
                  bigIconButton(
                    text: "How to study",
                    icon: Icons.crop_square_sharp,
                    onPressed: () async {
                      commonShowOkInfoDialog(context, "Information",
                          "Explanation of this App is coming soon..");
                      // await Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) {
                      //     return const CalendarEdit(null);
                      //   }),
                      // );
                    },
                  ),
                ]),
          ),
        ]),
      )),
    );
  }

  Widget bigIconButton(
      {required String text, required IconData icon, Function()? onPressed}) {
    return SizedBox(
      width: 120,
      child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.black54),
                commonText16BlackCenter(text)
              ],
            ),
          ),
          onTap: onPressed),
    );
  }
}

Future<void> logoutProcess(WidgetRef ref, BuildContext context) async {
  await closeStreams(ref);
  await FirebaseAuth.instance.signOut();
  // ログイン画面に遷移＋チャット画面を破棄
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) {
      return LoginPage();
    }),
  );
}
