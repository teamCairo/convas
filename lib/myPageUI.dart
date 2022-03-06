import 'package:convas/settingPageUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/UI/commonUI.dart';
import 'common/provider/userProvider.dart';

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
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Column(children: [
                        blackBigBoldTextLeft(ref.watch(userDataProvider).userData["name"]??""),
                        whiteRoundSquareSmallButton(text:"Edit Profile",
                        onPressed:() async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return SettingPage();
                            }),
                          );
                        },)
                      ])
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: imageAvatar(
                        radius: 40,
                        image:ref.watch(userDataProvider).mainPhotoData
                      ),
                    ),
                  ]),
                ),
              ]),
            )));
  }
}
