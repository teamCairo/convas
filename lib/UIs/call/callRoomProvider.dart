import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:convas/daoFirebase/appointmentsDaoFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../callerCloudFunctions/callTokenGenerator.dart';
import '../../common/commonValues.dart';
import '../../common/otherClass/commonClassAppointment.dart';
import '../../common/provider/friendProvider.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../../config/agora_config.dart' as config;

final callRoomProvider = ChangeNotifierProvider.autoDispose(
      (ref) => CallRoomNotifier(),
);

class CallRoomNotifier extends ChangeNotifier {

  late final Friend _friendData;
  Friend get friendData => _friendData;

  late final CommonAppointment _appointmentData;
  CommonAppointment get appointmentData => _appointmentData;
  late final RtcEngine _engine;
  RtcEngine get engine => _engine;

  bool _isJoined = false;
  bool get isJoined => _isJoined;

  bool _switchCamera = true;
  bool get switchCamera => _switchCamera;

  bool _switchRender = true;
  bool get switchRender => _switchRender;

  List<int> _remoteUid = [];
  List<int> get remoteUid => _remoteUid;

  Future<void> initialize(String friendUserDocId, String appointmentDocId, WidgetRef ref)async{
    _engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
    _addListeners();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);

    _friendData=  ref.watch(friendDataProvider).friendData[friendUserDocId]!;
    _appointmentData= await selectFirebaseAppointmentByAppointmentDocId(appointmentDocId);

    await insertChatDetailsDataMessage(
        ref:ref,
        chatHeaderDocId:ref.watch(callRoomProvider).friendData.chatHeaderId,
        friendUserDocId:friendUserDocId,
        message:enterRoomMessage,
        messageType:"1",
        referDocId: appointmentDocId,
        programId: "callRoom");

    await joinChannel();

  }

  void _addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        log('joinChannelSuccess $channel $uid $elapsed');
        _isJoined = true;
        notifyListeners();
      },
      userJoined: (uid, elapsed) {
        log('userJoined  $uid $elapsed');
        _remoteUid.add(uid);
        notifyListeners();
      },
      userOffline: (uid, reason) {
        log('userOffline  $uid $reason');
        _remoteUid.removeWhere((element) => element == uid);
        notifyListeners();
      },
      leaveChannel: (stats) {
        log('leaveChannel ${stats.toJson()}');
        _isJoined = false;
        _remoteUid.clear();
        notifyListeners();
      },

    ));
  }

  Future<void> joinChannel() async{

    if (defaultTargetPlatform == TargetPlatform.android) {
      await  [Permission.microphone, Permission.camera].request();
    }

    String tokenAndChannelId = await callTokenGenerator(_appointmentData.appointmentDocId);
    log("■■■■■■■■■■■■■■■■token:"+tokenAndChannelId);
    await _engine.joinChannel(tokenAndChannelId, _appointmentData.appointmentDocId, null, 0);
    notifyListeners();

  }


  Future<void> leaveChannel()async  {
    await _engine.leaveChannel();
    notifyListeners();
  }


  void changeSwitchCamera() {
    _engine.switchCamera().then((value) {
      _switchCamera = !_switchCamera;
    }).catchError((err) {
      log('switchCamera $err');
    });
  }

  void changeSwitchRender() {
    _switchRender = !_switchRender;
    _remoteUid = List.of(_remoteUid.reversed);
  }


}

