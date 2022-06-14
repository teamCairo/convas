import 'package:convas/UIs/call/callRoomProvider.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import '../../common/provider/friendProvider.dart';
import 'callRoomWithChatUI.dart';
import 'callRoomWithoutChatUI.dart';

class CallRoomRoot extends ConsumerWidget {
  String appointmentId;
  String argumentFriendUserDocId;

  CallRoomRoot(
      {Key? key,
      required this.appointmentId,
      required this.argumentFriendUserDocId})
      : super(key: key);

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref
          .read(callRoomProvider.notifier)
          .initialize(argumentFriendUserDocId, appointmentId, ref);
    }

    if (ref.watch(callRoomProvider).screenMode == 1) {
      return Scaffold(
          appBar: commonAppbar(ref
              .watch(friendDataProvider)
              .friendData[argumentFriendUserDocId]!
              .friendUserName),
          body: SafeArea(
              child: callRoomWithoutChatUI(ref, appointmentId, context)));
    } else {
      return Scaffold(
          appBar: commonAppbar(ref
              .watch(friendDataProvider)
              .friendData[argumentFriendUserDocId]!
              .friendUserName),
          body:
              SafeArea(child: callRoomWithChatUI(ref, appointmentId, context)));
    }
  }
}
