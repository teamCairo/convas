import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'openRoomProvider.dart';
import 'openRoomWIthoutChatUI.dart';

class OpenRoomRoot extends ConsumerWidget {
  String openRoomDocId;
  OpenRoomRoot(
      {Key? key,
        required this.openRoomDocId,})
      : super(key: key);

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref
          .read(openRoomProvider.notifier)
          .setScreenMode(1);
      ref
          .read(openRoomProvider.notifier)
          .initialize(openRoomDocId,ref);
    }

    if (ref.watch(openRoomProvider).screenMode == 9) {
      //初期処理実行中の場合
      return Scaffold(
          appBar: commonAppbar(""),
          body: Container());
    // } else if (ref.watch(openRoomProvider).screenMode == 1) {
    //   return Scaffold(
    //       appBar: commonAppbar(ref
    //           .watch(openRoomProvider)
    //           .openRoomData.roomName),
    //       body: SafeArea(
    //           child: callRoomWithoutChatUI(ref, appointmentId, context)));
    } else {
      return Scaffold(
          appBar: commonAppbar(ref
              .watch(openRoomProvider)
              .openRoomData.roomName),
          body:
          SafeArea(child: openRoomWithoutChatUI(ref, context)));
    }
  }
}
