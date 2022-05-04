import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:convas/UIs/call/callRoomProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/otherClass/commonRtmChatChannelMessage.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/provider/friendProvider.dart';

class CallRoom extends ConsumerWidget {
  String appointmentId;
  String argumentFriendUserDocId;

  CallRoom(
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

    return Scaffold(
        appBar: commonAppbarTransparent(ref
            .watch(friendDataProvider)
            .friendData[argumentFriendUserDocId]!
            .friendUserName),
        body: SafeArea(
          child: Column(
            children: [
              _renderVideo(ref),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonButtonIconCircle(
                      icon: ref.watch(callRoomProvider).localAvStatus
                          ? Icons.mic
                          : Icons.mic_off,
                      color: Colors.black,
                      onPressed: () {
                        ref.read(callRoomProvider.notifier).changeAvMuteMode();
                      },
                      backcolor: Colors.white,
                      size: 20),
                  commonButtonIconCircle(
                      icon: ref.watch(callRoomProvider).isJoinedCall?Icons.call_end:Icons.arrow_forward_outlined,
                      color: Colors.white,
                      showBorder: false,
                      onPressed: () {
                        if (ref.watch(callRoomProvider).isJoinedCall) {
                          ref.read(callRoomProvider.notifier).leaveChannel(ref);
                        } else {
                          ref.read(callRoomProvider.notifier).joinCallChannel();
                        }
                      },
                      backcolor: Colors.red,
                      size: 20),
                  commonButtonIconCircle(
                      icon: ref.watch(callRoomProvider).localVideoStatus
                          ? Icons.videocam
                          : Icons.videocam_off,
                      color: Colors.black,
                      onPressed: () {
                        ref
                            .read(callRoomProvider.notifier)
                            .changeVideoMuteMode();
                      },
                      backcolor: Colors.white,
                      size: 20),
                  commonButtonIconCircle(
                      icon:  Icons.switch_video,
                      color: Colors.black,
                      onPressed: () {
                        ref.read(callRoomProvider.notifier)
                            .changeSwitchCamera();
                      },
                      backcolor: Colors.white,
                      size: 20),
                ],
              ),
              Expanded(child:Container())
              // Expanded(child: chatArea(ref))
            ],
          ),
        ));
  }

  Widget _renderVideo(WidgetRef ref) {
    Widget friendView;

    if (ref.watch(callRoomProvider).friendUserid == null) {
      friendView = const SizedBox(height: 300, width: double.infinity);
    } else {
      friendView = SizedBox(
        height: 300,
        width: double.infinity,
        child: RtcRemoteView.SurfaceView(
          channelId: appointmentId,
          uid: ref.watch(callRoomProvider).friendUserid!,
        ),
      );
    }

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Align(alignment: Alignment.topLeft, child: friendView),
          const Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
                width: 120, height: 120, child: RtcLocalView.SurfaceView()),
          ),
        ],
      ),
    );
  }

  // Widget chatArea(WidgetRef ref) {
  //   var _peerMessageController = TextEditingController();
  //
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height:50,
  //         child:Row(children: <Widget>[
  //         Expanded(
  //             child: Padding(
  //           padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 14.0),
  //           child: commonTextBoxGray(
  //               onChanged: (String value) {
  //               },
  //               controller: _peerMessageController,
  //               multiLine: true),
  //         )),
  //         commonButtonIconCircle(
  //           size: 20,
  //           icon: Icons.send,
  //           onPressed: () async{
  //             await ref.read(callRoomProvider).sendMessage(_peerMessageController.text,ref);
  //             _peerMessageController.clear();
  //             ref.read(callRoomProvider).rebuildUI();
  //           },
  //           color: Colors.white,
  //           backcolor: Colors.orange,
  //           showBorder: false,
  //         )
  //       ]),),
  //       // Padding(
  //       //   padding: const EdgeInsets.symmetric(horizontal:14.0),
  //       //   child: Expanded(
  //       //       child: ListView.builder(
  //       //     reverse: true,
  //       //     // itemExtent: 24,
  //       //     itemBuilder: (context, i) {
  //       //
  //       //       if (ref.watch(callRoomProvider).channelMessageList[i].userDocId == ref.watch(userDataProvider).userData["userDocId"]) {
  //       //         return balloon(ref.watch(callRoomProvider).channelMessageList[i], "right", context,ref);
  //       //       } else {
  //       //         return balloon(ref.watch(callRoomProvider).channelMessageList[i], "left", context,ref);
  //       //       }
  //       //     },
  //       //     itemCount: ref.watch(callRoomProvider).channelMessageList.length,
  //       //   )),
  //       // )
  //     ],
  //   );
  // }
  //
  //
  // Padding balloon(
  //     CommonRtmChatChannelMessage chatMessage, String rightLeft, BuildContext context,WidgetRef ref) {
  //   //rightLeft="right"or"left"
  //
  //   List<Widget> widgetList = [];
  //   widgetList.add(Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: commonText14Gray(chatMessage.message)));
  //
  //
  //   return Padding(
  //       padding: const EdgeInsets.only(bottom: 28.0),
  //       child: commonBalloon(
  //           Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: widgetList),
  //           rightLeft));
  // }


}
