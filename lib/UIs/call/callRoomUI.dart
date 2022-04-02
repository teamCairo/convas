import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:convas/UIs/call/callRoomProvider.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import '../../common/provider/friendProvider.dart';


class CallRoom extends ConsumerWidget {
  String appointmentId;
  String argumentFriendUserDocId;
  CallRoom({Key? key,
    required this.appointmentId,
    required this.argumentFriendUserDocId
  }) : super(key: key);

  bool initialProcessFlg=true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if (initialProcessFlg){
      initialProcessFlg=false;
      ref.read(callRoomProvider.notifier).initialize(argumentFriendUserDocId, appointmentId, ref);
    }


    return Scaffold(
        appBar:commonAppbarWhite(ref.watch(friendDataProvider).friendData[argumentFriendUserDocId]!.friendUserName),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 40,
                    child: ElevatedButton(
                      onPressed:(){
                        if(ref.watch(callRoomProvider).isJoined) {
                          ref.read(callRoomProvider.notifier).leaveChannel();
                        } else {
                          ref.read(callRoomProvider.notifier).joinChannel();
                        }

                      } ,
                      child: Text('${ref.watch(callRoomProvider).isJoined ? 'Leave' : 'Join'} channel'),
                    ),
                  ),
                  Row(children: [_renderVideo(ref)],)
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: (){ref.read(callRoomProvider.notifier).changeSwitchCamera();},
                      child: Text('Camera ${ref.watch(callRoomProvider).switchCamera ? 'front' : 'rear'}'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _renderVideo(WidgetRef ref) {
    return SizedBox(
      height: 100,
      width: 120,
      child: Stack(
        children: [
          const RtcLocalView.SurfaceView(),
          Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.of(ref.watch(callRoomProvider).remoteUid.map(
                      (e) =>
                      GestureDetector(
                        onTap:(){ ref.watch(callRoomProvider).switchRender;},
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: RtcRemoteView.SurfaceView(
                            channelId:appointmentId,
                            uid: e,
                          ),
                        ),
                      ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
