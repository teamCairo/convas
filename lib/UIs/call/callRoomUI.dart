import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/provider/friendProvider.dart';
import '../../config/agora_config.dart' as config;
import 'callRoomLogic.dart';


class CallRoom extends ConsumerWidget {
  String appointmentId;
  String argumentFriendUserDocId;
  CallRoom({Key? key,
    required this.appointmentId,
    required this.argumentFriendUserDocId
  }) : super(key: key){
    _initEngine();
  }

  late final RtcEngine _engine;
  // String channelId = "";
  bool isJoined = false,
      switchCamera = true,
      switchRender = true;
  List<int> remoteUid = [];
  // bool initialProcessFlg=true;

  void dispose() {
    _engine.destroy();
  }

  Future<void> _initEngine() async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
    _addListeners();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
    await initializeProcess(ref, argumentFriendUserDocId, appointmentId);
    await _joinChannel();//TODO　トークンゲット処理を追加
  }

  void _addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        log('joinChannelSuccess $channel $uid $elapsed');
        isJoined = true;
      },
      userJoined: (uid, elapsed) {
        log('userJoined  ${uid} ${elapsed}');
        remoteUid.add(uid);
      },
      userOffline: (uid, reason) {
        log('userOffline  ${uid} ${reason}');
        remoteUid.removeWhere((element) => element == uid);
      },
      leaveChannel: (stats) {
        log('leaveChannel ${stats.toJson()}');
        isJoined = false;
        remoteUid.clear();
      },
    ));
  }

  Future<void> _joinChannel() async{

    if (defaultTargetPlatform == TargetPlatform.android) {
      await  [Permission.microphone, Permission.camera].request();
    }
    await _engine.joinChannel("006dc60d629dee640809f2bdc5e5a2b1697IADxPKbGTZAqT8z1VdGNsbw/ZrsK9mDQkoO7JJMVM7ALzV3TjE8AAAAAEABg4SwUzyJIYgEAAQDOIkhi", appointmentId, null, 0);

  }

  Future<void> _leaveChannel(WidgetRef ref)async  {
    await _engine.leaveChannel();
  }


  void _switchCamera() {
    _engine.switchCamera().then((value) {
      switchCamera = !switchCamera;
    }).catchError((err) {
      log('switchCamera $err');
    });
  }

  void _switchRender() {
    switchRender = !switchRender;
    remoteUid = List.of(remoteUid.reversed);
  }



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    // if (initialProcessFlg){
    //   initialProcessFlg=false;
    // }


    return Scaffold(
        appBar:AppBar(title:Container(
            child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(ref.watch(friendDataProvider).friendData[argumentFriendUserDocId]!.friendUserName,
                    style: const TextStyle(color: Colors.black87),),
                  Container(
                      width: 40,
                      child: Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () async {

                              },
                              child: Icon(Icons.widgets_outlined,
                                  color: Colors.black87, size: 26))))


                ]
            ))),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Text(appointmentId),
                  Container(
                    height: 40,
                    child: ElevatedButton(
                      onPressed:(){
                        if(isJoined) {
                          _leaveChannel(ref);
                        } else {
                          _joinChannel();
                        }

                      } ,
                      child: Text('${isJoined ? 'Leave' : 'Join'} channel'),
                    ),
                  ),
                  Row(children: [_renderVideo()],)
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: _switchCamera,
                      child: Text('Camera ${switchCamera ? 'front' : 'rear'}'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _renderVideo() {
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
                children: List.of(remoteUid.map(
                      (e) =>
                      GestureDetector(
                        onTap: _switchRender,
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
