
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../UIs/register/setUserTypeUI.dart';
import 'insertTestEventsData.dart';
import 'insertTestMastersData.dart';
import 'insertTestUsersData.dart';

SpeedDial testDataMenuSpeedDial(WidgetRef ref,BuildContext context){
  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: const IconThemeData(size: 22.0),
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
          child: const Icon(Icons.calendar_today_outlined),
          backgroundColor: Colors.amberAccent,
          label: "Create test event data",
          onTap: () {
            insertTestEventsData(ref);
          },
          labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      SpeedDialChild(
          child: const Icon(Icons.perm_contact_cal),
          backgroundColor: Colors.teal,
          label: "Create test user data",
          onTap: () {
            insertTestUserData(ref);
          },
          labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      SpeedDialChild(
          child: const Icon(Icons.code),
          backgroundColor: Colors.blue,
          label: "Create test master data",
          onTap: () {
            insertTestMasterData(ref);
          },
          labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      SpeedDialChild(
          child: const Icon(Icons.code),
          backgroundColor: Colors.blue,
          label: "user register",
          onTap: () {
             Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) {
                return const SetUserType();
              }),
            );
          },
          labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
    ],
  );
}