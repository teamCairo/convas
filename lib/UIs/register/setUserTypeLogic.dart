import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/welcomeLeanerUI.dart';
import 'package:convas/UIs/register/welcomeTeacherUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';

void selectLearner(WidgetRef ref,BuildContext context){
  ref.read(registerProvider.notifier).setUserType("1");
  commonNavigatorPushSlideHorizon(context,  WelcomeLearner());
}


void selectTeacher(WidgetRef ref,BuildContext context){
  ref.read(registerProvider.notifier).setUserType("2");
  commonNavigatorPushSlideHorizon(context,  WelcomeTeacher());
}