import 'package:convas/common/commonValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

import '../../common/UI/commonOthersUI.dart';
import 'lessonAppointmentListUI.dart';
import 'lessonRequestListUI.dart';
import 'lessonResultListUI.dart';

class LessonListRoot extends ConsumerWidget {
  LessonListRoot({
    Key? key,
  }) : super(key: key);

  int selectedLessonListIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: commonAppTabBar(
          bottom: TabBar(
              labelColor:commonColorSecondary,
            unselectedLabelColor:Colors.black54,
            tabs:const  [
              Tab(text: "Request", icon: Icon(Icons.send)),
              Tab(
                  text: "Lesson plan",
                  icon: Icon(Icons.calendar_today_outlined)),
              Tab(text: "Lesson result", icon: Icon(Icons.add_chart)),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            routeElement(0, ref),
            routeElement(1, ref),
            routeElement(2, ref),
          ],
        ),
      ),
    );
  }

  Widget routeElement(int selectedIndex, WidgetRef ref) {
    switch (selectedIndex) {
      case 0:
        return LessonRequestList();
      case 1:
        return LessonAppointmentList();
      default:
        return LessonResultList();
    }
  }
}
