import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

class BottomNavigationBarItemsForFriendProfile extends ChangeNotifier {
  List<BottomNavigationBarItem> _bottomNavigationBarItems = [];

  get bottomNavigationBarItems => _bottomNavigationBarItems;

  void initialize() {
    _bottomNavigationBarItems.clear();
    _bottomNavigationBarItems.add(updateActiveState(0));
    for (var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(updateDeactiveState(i));
    }
  }

  static const _footerItemNames = [
    'Profile',
    'Calendar',
  ];

  static const List _footerIcons = [
    Icons.perm_contact_cal,
    Icons.calendar_today_outlined,
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

final bottomNavigationBarItemsForFriendProfileProvider = ChangeNotifierProvider(
      (ref) => BottomNavigationBarItemsForFriendProfile(),
);
