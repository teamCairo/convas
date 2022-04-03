import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:convas/common/provider/userProvider.dart';
import 'package:convas/daoFirebase/appointmentsDaoFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtm/agora_rtm.dart';
import '../../callerCloudFunctions/callTokenGenerator.dart';
import '../../callerCloudFunctions/messageTokenGenerator.dart';
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
  AgoraRtmClient? _client;
  late final Friend _friendData;
  Friend get friendData => _friendData;
  late final CommonAppointment _appointmentData;
  CommonAppointment get appointmentData => _appointmentData;
  late final RtcEngine _engine;
  RtcEngine get engine => _engine;
  bool _isJoinedCall = false;
  bool get isJoinedCall => _isJoinedCall;
  bool _isJoinedMessage = false;
  bool get isJoinedMessage => _isJoinedMessage;
  bool _switchCamera = true;
  bool get switchCamera => _switchCamera;
  bool _switchRender = true;
  bool get switchRender => _switchRender;
  int? _myUserid;
  int? get myUserid => _myUserid;
  bool _localVideoStatus = true;
  bool get localVideoStatus => _localVideoStatus;
  bool _localAvStatus = true;
  bool get localAvStatus => _localAvStatus;
  int? _friendUserid;
  int? get friendUserid => _friendUserid;
  List<String> _infoStrings =[];
  List<String> get infoStrings => _infoStrings;

  Future<void> initialize(
      String friendUserDocId, String appointmentDocId, WidgetRef ref) async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
    _addListeners();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
    _localVideoStatus = true;


    _friendData = ref.watch(friendDataProvider).friendData[friendUserDocId]!;
    _appointmentData =
        await selectFirebaseAppointmentByAppointmentDocId(appointmentDocId);

    await insertChatDetailsDataMessage(
        ref: ref,
        chatHeaderDocId: ref.watch(callRoomProvider).friendData.chatHeaderId,
        friendUserDocId: friendUserDocId,
        message: enterRoomMessage,
        messageType: "1",
        referDocId: appointmentDocId,
        programId: "callRoom");

    await createMessageClient(ref);

    if (_isJoinedCall == false) {
      await joinChannel();
    }
  }

  void _addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        log('joinChannelSuccess $channel $uid $elapsed');
        _isJoinedCall = true;
        notifyListeners();
      },
      userJoined: (uid, elapsed) {
        log('userJoined  $uid $elapsed');
        _friendUserid = uid;
        notifyListeners();
      },
      userOffline: (uid, reason) {
        log('userOffline  $uid $reason');
        _friendUserid = null;
        notifyListeners();
      },
      leaveChannel: (stats) {
        log('leaveChannel ${stats.toJson()}');
        _isJoinedCall = false;
        _myUserid = null;
        _friendUserid = null;
        notifyListeners();
      },
    ));
  }

  Future<void> joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }

    String tokenAndChannelId =
        await callTokenGenerator(_appointmentData.appointmentDocId);
    log("■■■■■■■■■■■■■■■■token:" + tokenAndChannelId);
    await _engine.joinChannel(
        tokenAndChannelId, _appointmentData.appointmentDocId, null, 0);
    notifyListeners();
  }

  Future<void> leaveChannel() async {
    await _engine.leaveChannel();
    notifyListeners();
  }

  Future<void> changeAvMuteMode() async {
    _localAvStatus = !_localAvStatus;
    await _engine.muteLocalAudioStream(_localAvStatus);
    notifyListeners();
  }

  Future<void> changeVideoMuteMode() async {
    _localVideoStatus = !_localVideoStatus;
    await _engine.muteLocalVideoStream(_localVideoStatus);
    notifyListeners();
  }

  void changeSwitchCamera() {
    _engine.switchCamera().then((value) {
      _switchCamera = !_switchCamera;
    }).catchError((err) {
      log('switchCamera $err');
    });
  }

  Future<void> createMessageClient(WidgetRef ref) async {

    _infoStrings =[];
    _client = await AgoraRtmClient.createInstance(config.appId);
    _client?.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      _log("Peer msg: " + peerId + ", msg: " + (message.text));
    };
    _client?.onConnectionStateChanged = (int state, int reason) {
      log('Connection state changed: ' +
          state.toString() +
          ', reason: ' +
          reason.toString());
      if (state == 5) {
        _client?.logout();
        log('Logout.');
        _isJoinedMessage = false;
      }
    };
    _client?.onLocalInvitationReceivedByPeer =
        (AgoraRtmLocalInvitation invite) {
      log('Local invitation received by peer: ${invite.calleeId}, content: ${invite.content}');
    };
    _client?.onRemoteInvitationReceivedByPeer =
        (AgoraRtmRemoteInvitation invite) {
      log('Remote invitation received by peer: ${invite.callerId}, content: ${invite.content}');
    };

    String token = await messageTokenGenerator(ref.watch(userDataProvider).userData["userDocId"]);

    await _client?.login(
        token, ref.watch(userDataProvider).userData["userDocId"]);
  }

  void _log(String info) {
    infoStrings.insert(0, info);
    notifyListeners();
  }
  void rebuildUI() {
    notifyListeners();
  }

  Future<void> sendMessage(String textMessage)async{
    String text=textMessage;
    if (text.isNotEmpty) {
      try {
        AgoraRtmMessage message = AgoraRtmMessage.fromText(text);
        _log(message.text);
        await _client?.sendMessageToPeer(_friendData.friendUserDocId, message, false);
        _log('Send peer message success.');
      } catch (errorCode) {
        _log('Send peer message error: ' + errorCode.toString());
      }
    }
  }

}
