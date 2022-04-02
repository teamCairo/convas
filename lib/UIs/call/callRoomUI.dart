import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:convas/UIs/call/callRoomProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
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
        appBar: commonAppbarTransparent(ref.watch(friendDataProvider).friendData[argumentFriendUserDocId]!.friendUserName),
        body: SafeArea(
          child: Column(
            children: [
              _renderVideo(ref),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
                     commonButtonSmallOrangeRound(
                       text: '${ref.watch(callRoomProvider).isJoined ? 'Leave' : 'Join'} channel',
                       onPressed:(){
                         if(ref.watch(callRoomProvider).isJoined) {
                           ref.read(callRoomProvider.notifier).leaveChannel();
                         } else {
                           ref.read(callRoomProvider.notifier).joinChannel();
                         }
                       } ,
                     ),

                     commonButtonSmallOrangeRound(
                       onPressed: (){ref.read(callRoomProvider.notifier).changeSwitchCamera();},
                       text: 'Camera ${ref.watch(callRoomProvider).switchCamera ? 'front' : 'rear'}',
                     ),
                   ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  commonButtonIconCircle(
                      icon: ref.watch(callRoomProvider).localAvStatus?Icons.mic:Icons.mic_off,
                      color: Colors.black,
                      onPressed: (){
                        ref.read(callRoomProvider.notifier).changeAvMuteMode();
                      }, backcolor: Colors.white, size: 20),
                  commonButtonIconCircle(
                      icon: Icons.call_end,
                      color: Colors.white,
                      onPressed: (){
                        ref.read(callRoomProvider.notifier).leaveChannel();
                      },backcolor: Colors.red, size: 20),
                  commonButtonIconCircle(
                      icon: ref.watch(callRoomProvider).localVideoStatus?Icons.videocam:Icons.videocam_off,
                      color: Colors.black,
                      onPressed: (){
                        ref.read(callRoomProvider.notifier).changeVideoMuteMode();
                      },backcolor: Colors.white, size: 20),
                ],
              ),
            ],
          ),
        )
    );
  }

  Widget _renderVideo(WidgetRef ref) {
    Widget friendView;

    if(ref.watch(callRoomProvider).friendUserid==null){
      friendView=const SizedBox(
        height: 300,
        width: double.infinity
      );
    }else{
      friendView = SizedBox(
        height: 300,
        width: double.infinity,
        child: RtcRemoteView.SurfaceView(
          channelId:appointmentId,
          uid: ref.watch(callRoomProvider).friendUserid!,
        ),
      );
    }

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: friendView
          ),
        const Align(
        alignment: Alignment.topLeft,
        child:SizedBox(
              width: 120,
              height: 120,
              child: RtcLocalView.SurfaceView()),),
        ],
      ),
    );
  }
}
