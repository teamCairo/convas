import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

import '../../common/provider/userProvider.dart';

class BottomNavigationBarItems extends ChangeNotifier {
  List<BottomNavigationBarItem> _bottomNavigationBarItems = [];

  get bottomNavigationBarItems => _bottomNavigationBarItems;

  void initialize(WidgetRef ref) {

    // if(ref.watch(userDataProvider).userData["userType"]=="1"){
    //   _footerItemNames = [
    //     'Find',
    //     'Talk',
    //     'Lesson',
    //     'My page',
    //   ];
    //   _footerIcons = [
    //     Icons.search,
    //     Icons.message_outlined,
    //     Icons.add_chart,
    //     Icons.work_outline,
    //   ];
    // }else{
      _footerItemNames = ['Calendar',
        'Find',
        'Talk',
        'Lesson',
        'My page',
      ];
      _footerIcons = [Icons.calendar_today_outlined,
        Icons.search,
        Icons.message_outlined,
        Icons.add_chart,
        Icons.work_outline,
      ];

    // }



    _bottomNavigationBarItems.clear();
    _bottomNavigationBarItems.add(updateActiveState(0));
    for (var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(updateDeactiveState(i));
    }

  }

  List _footerItemNames = [
  ];

  List  _footerIcons = [
  ];

  /// インデックスのアイテムをアクティベートする
  BottomNavigationBarItem updateActiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
      ),
      label:
      _footerItemNames[index],
    );
  }

  BottomNavigationBarItem updateDeactiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
      ),
      label:
      _footerItemNames[index],);
  }

  void activateButton(int beforeSelectedIndex, int newSelectedIndex) {
    _bottomNavigationBarItems[beforeSelectedIndex] =
        updateDeactiveState(beforeSelectedIndex);
    _bottomNavigationBarItems[newSelectedIndex] =
        updateActiveState(newSelectedIndex);

    notifyListeners();
  }
}

final bottomNavigationBarItemsProvider = ChangeNotifierProvider(
      (ref) => BottomNavigationBarItems(),
);
