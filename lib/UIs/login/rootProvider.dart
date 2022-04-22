import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

class BottomNavigationBarItems extends ChangeNotifier {
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
    'Top',
    'Find',
    'Talk',
    'Text',
    'MyPage',
  ];

  static const List _footerIcons = [
    Icons.star,
    Icons.search,
    Icons.message_outlined,
    Icons.book,
    Icons.work_outline,
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
