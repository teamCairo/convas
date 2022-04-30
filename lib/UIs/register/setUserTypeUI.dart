import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/setNameAndPhotoUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';

class SetUserType extends ConsumerWidget {
  const SetUserType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  commonLogoMain(120),
                  commonText30BlackBoldCenter("Hi there,"),
                  commonText30BlackBoldCenter("Welcome to convas!!"),
                  const SizedBox(height: 30),
                  commonText20GrayLeft(
                      "Convas helps you keep learning English"),
                  const SizedBox(
                    height: 20,
                  ),
                  commonText20BlackCenter("Are you learner or teacher?"),
                  const SizedBox(height: 30),
                  commonText20BlackLeft("I'm a"),
                ],
              ),
            ),
            Column(
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(registerProvider.notifier).setUserType("2");
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const SetNameAndPhoto();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return commonFunctionPushSlideHorizon(
                                context, animation, secondaryAnimation, child);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: 180.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  "https://www.silhouette-illust.com/wp-content/uploads/2016/10/12158-300x300.jpg",
                                  fit: BoxFit.cover,
                                ))),
                        commonText20BlackCenter("Teacher"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(registerProvider.notifier).setUserType("1");
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const SetNameAndPhoto();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return commonFunctionPushSlideHorizon(
                                context, animation, secondaryAnimation, child);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: 180.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  "https://us.123rf.com/450wm/tuktukdesign/tuktukdesign1802/tuktukdesign180200082/95671918-%E5%AD%A6%E6%A0%A1%E3%80%81%E5%A4%A7%E5%AD%A6%E3%80%81%E5%A4%A7%E5%AD%A6%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AE%E7%94%B7%E5%AD%90%E5%AD%A6%E7%94%9F%E3%82%84%E6%95%99%E5%B8%AB%E3%81%AE%E4%BA%BA%E3%81%AE%E3%83%97%E3%83%AD%E3%83%95%E3%82%A3%E3%83%BC%E3%83%AB%E3%81%AE%E3%82%A2%E3%83%90%E3%82%BF%E3%83%BC%E3%81%A8%E3%81%AE%E6%9C%AC%E3%81%AE%E3%82%A2%E3%82%A4%E3%82%B3%E3%83%B3%E3%83%99%E3%82%AF%E3%83%88%E3%83%AB%E3%80%82%E3%82%B0%E3%83%AA%E3%83%95%E3%83%BB%E3%83%94%E3%82%AF%E3%83%88%E3%82%B0%E3%83%A9%E3%83%A0%E3%83%BB%E3%82%B7%E3%83%B3%E3%83%9C%E3%83%AB%E3%81%AE%E3%82%A4%E3%83%A9%E3%82%B9%E3%83%88%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%A7%E3%81%AE%E6%95%99%E8%82%B2%E3%80%82.jpg?ver=6",
                                  fit: BoxFit.cover,
                                ))),
                        commonText20BlackCenter("Learner")
                      ],
                    ),
                  )
                ]),
              ],
            ),
            const SizedBox(height: 14),
          ])),
    );
  }
}
