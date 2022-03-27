import 'package:convas/UIs/myPageRoute/settingPageUI.dart';
import 'package:convas/UIs/myPageRoute/topicRegisterUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../developerLogic/insertTestEventsData.dart';
import '../../developerLogic/insertTestMastersData.dart';
import '../../developerLogic/insertTestUsersData.dart';
import '../../developerLogic/testDataMenuSpeedDial.dart';
import 'calendarEditUI.dart';
import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../common/provider/userProvider.dart';
import 'conceptUI.dart';
import 'editInterestUI.dart';
import 'editInterestingCourseUI.dart';
import '../login/loginPageUI.dart';

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
                              ref.watch(userDataProvider).userData["name"] ??
                                  ""),
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
                      child:
                      commonCircleAvatarImage(
                          radius: 40,
                          image: ref.watch(userDataProvider).mainPhotoData,
                          name:ref.watch(userDataProvider).userData["name"]),
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
                        await closeStreams(ref);
                        await FirebaseAuth.instance.signOut();
                        // ログイン画面に遷移＋チャット画面を破棄
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "Edit Interest",
                      icon: Icons.star,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return EditInterest();
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "Register topic",
                      icon: Icons.add_photo_alternate_outlined,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return TopicRegister();
                          }),
                        );
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
                      text: "Edit course",
                      icon: Icons.widgets_outlined,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return EditInterestingCourse();
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "Edit Calendar",
                      icon: Icons.calendar_today,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const CalendarEdit(null);
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "Help",
                      icon: Icons.question_mark,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return TopicRegister();
                          }),
                        );
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
                      text: "History",
                      icon: Icons.timeline_rounded,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return EditInterestingCourse();
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "Payment",
                      icon: Icons.attach_money,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const CalendarEdit( null);
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "Concept",
                      icon: Icons.vpn_key,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return Concept();
                          }),
                        );
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
                      text: "Contact",
                      icon: Icons.mail_outline,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return EditInterestingCourse();
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "",
                      icon: Icons.attach_money,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const CalendarEdit(null);
                          }),
                        );
                      },
                    ),
                    bigIconButton(
                      text: "",
                      icon: Icons.vpn_key,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return TopicRegister();
                          }),
                        );
                      },
                    ),
                  ]),
            )
          ]),
        )),
        floatingActionButton: testDataMenuSpeedDial(ref));
  }

  Widget bigIconButton(
      {required String text, required IconData icon, Function()? onPressed}) {
    return SizedBox(
      width:120,
      child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [Icon(icon, size: 50
              ,color:Colors.black54),
                commonText16BlackCenter(text)],
            ),
          ),
          onTap: onPressed),
    );
  }
}
