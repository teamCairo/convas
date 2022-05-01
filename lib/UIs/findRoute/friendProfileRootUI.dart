import 'package:convas/UIs/findRoute/friendProfileCalendarUI.dart';
import 'package:convas/UIs/findRoute/friendProfileUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

import 'friendProfileProvider.dart';
import 'friendProfileRootProvider.dart';

final _selectedFriendProfileIndexProvider = StateProvider.autoDispose((ref) {
  return 0;
});

class FriendProfileRoot extends ConsumerWidget {
  FriendProfileRoot({
    required this.argumentFriendUserDocId,
    required this.argumentFriendUserName,
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;
  bool initialProcessFlg = true;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(friendProfileDataProvider.notifier).clearFriendProfileData();
      ref.read(friendProfileDataProvider.notifier).readFriendProfileDataFromFirebase(ref, argumentFriendUserDocId);
    }

    ref.read(bottomNavigationBarItemsForFriendProfileProvider.notifier).initialize();
    final _selectedIndex = ref.watch(_selectedFriendProfileIndexProvider);

    return Scaffold(
      body: routeElement(
          _selectedIndex,
          ref),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // これを書かないと3つまでしか表示されない
          items: ref.watch(bottomNavigationBarItemsForFriendProfileProvider.notifier)
              .bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            ref.read(bottomNavigationBarItemsForFriendProfileProvider.notifier)
                .activateButton(_selectedIndex, index);
            ref.read(_selectedFriendProfileIndexProvider.state).update((state) => index);
          }),
    );
  }

  Widget routeElement(
      int selectedIndex, WidgetRef ref) {
    switch (selectedIndex) {
      case 0:
        return FriendProfile(argumentFriendUserDocId: argumentFriendUserDocId);
      default:
        return FriendProfileCalendar(argumentFriendUserDocId: argumentFriendUserDocId,argumentFriendUserName: argumentFriendUserName,);

    }
  }
}
