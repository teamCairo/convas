import 'package:convas/UIs/login/rootProvider.dart';
import 'package:convas/UIs/findRoute/searchUsersMainPageUI.dart';
import 'package:convas/UIs/recommendation/recommendedTeacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

import '../../text/textRoot.dart';
import '../myPageRoute/myPageUI.dart';
import '../talk/talkUI.dart';

final _selectedIndexProvider = StateProvider.autoDispose((ref) {
  return 0;
});

class Root extends ConsumerWidget {
  const Root({
    Key? key,
  }) : super(key: key) ;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.read(bottomNavigationBarItemsProvider.notifier).initialize();
    final _selectedIndex = ref.watch(_selectedIndexProvider);

    return Scaffold(
      body: routeElement(
          _selectedIndex,
          ref),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // これを書かないと3つまでしか表示されない
          items: ref.watch(bottomNavigationBarItemsProvider.notifier)
              .bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.black,
          onTap: (int index) {
            ref.read(bottomNavigationBarItemsProvider.notifier)
                .activateButton(_selectedIndex, index);
            ref.read(_selectedIndexProvider.state).update((state) => index);
          }),
    );
  }

  Widget routeElement(
      int selectedIndex, WidgetRef ref) {
    switch (selectedIndex) {
      case 0:
        return RecommendedTeacher();
      case 1:
        return SearchUsersMainPage();
      case 2:
        return Talk();
      case 3:
        return TextRoot();
      default:
        return MyPage();
    }
  }
}
