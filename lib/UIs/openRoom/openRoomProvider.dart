import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../callerCloudFunctions/callTokenGenerator.dart';
import '../../common/otherClass/commonRtmChatChannelMessage.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/openRoomDaoFirebase.dart';
import '../../entityIsar/openRoomEntityIsar.dart';
import '../../config/agora_config.dart' as config;

final openRoomProvider = ChangeNotifierProvider(
  (ref) => OpenRoomNotifier(),
);

class OpenRoomNotifier extends ChangeNotifier {
  AgoraRtmClient? _client;
  late final RtcEngine _engine;
  String _openRoomDocId = "";
  int _screenMode = 9;
  late OpenRoom _openRoomData;
  List<CommonRtmChatChannelMessage> _channelMessageList = [];
  List<String> _joinUserDocIdList = [];
  AgoraRtmChannel? _messageChannel;
  bool _isJoinedChannelMessage = false;
  bool _localVideoStatus = true;
  bool _localAvStatus = true;




  RtcEngine get engine => _engine;

  String get openRoomDocId => _openRoomDocId;

  int get screenMode => _screenMode;

  OpenRoom get openRoomData => _openRoomData;

  List<CommonRtmChatChannelMessage> get channelMessageList =>
      _channelMessageList;

  List<String> get joinUserDocIdList => _joinUserDocIdList;
  bool get isJoinedChannelMessage => _isJoinedChannelMessage;
  bool get localVideoStatus => _localVideoStatus;
  bool get localAvStatus => _localAvStatus;

  Future<void> initialize(String openRoomDocId, WidgetRef ref) async {
    _openRoomDocId = openRoomDocId;
    _screenMode = 1;
    _openRoomData = await selectFirebaseOpenRoomByDocId(_openRoomDocId);
    _channelMessageList = [];
    _joinUserDocIdList = [];
    _engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
    addListeners();
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
    _localVideoStatus = true;
    _localAvStatus = true;

    await joinCallChannel();
    await joinMessageChannel(ref);

    notifyListeners();
  }

  void setScreenMode(int value) {
    _screenMode = value;
  }

  void resetScreen() {
    notifyListeners();
  }

  //
  // void setDescription(String value){
  //   _description=value;
  // }
  //
  // void setEndDateTime(DateTime? value){
  //   _endDateTime=value;
  //   notifyListeners();
  // }
  //
  // void setRoomName(String value){
  //   _roomName=value;
  // }
  Future<void> joinCallChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }

    String tokenAndChannelId =
    await callTokenGenerator(_openRoomDocId);
    // log("■■■■■■■■■■■■■■■■token:" + tokenAndChannelId);
    await _engine.joinChannel(
        tokenAndChannelId, _openRoomDocId, null, 0);
    notifyListeners();
  }

  Future<AgoraRtmChannel?> _createMessageChannel(String name,
      WidgetRef ref) async {
    AgoraRtmChannel? channel = await _client?.createChannel(name);
    if (channel != null) {
      channel.onMemberJoined = (AgoraRtmMember member) {
        addMessage("receive", 'Friend joined', ref);
        channel.onMemberLeft = (AgoraRtmMember member) {
          addMessage("receive", 'Friend left', ref);
        };
        channel.onMessageReceived =
            (AgoraRtmMessage message, AgoraRtmMember member) {
          addMessage("receive", message.text, ref);
        };
      };
      return channel;
    }
    return null;
  }

  Future<void> joinMessageChannel(WidgetRef ref) async {
    try {
      _messageChannel = await _createMessageChannel(_openRoomDocId + "message",ref);
      await _messageChannel?.join();
      addMessage("send", 'Join channel success.', ref);

      _isJoinedChannelMessage = true;
    } catch (errorCode) {
      log('Join channel error: ' + errorCode.toString());
    }
  }

  void addMessage(String sendReceive, String textInfo, WidgetRef ref) {
    String userDocId = "";
    if (sendReceive == "send") {
      userDocId = ref
          .watch(userDataProvider)
          .userData["userDocId"];
    } else {
      userDocId = ref
          .watch(userDataProvider)
          .userData["userDocId"];
    }

    CommonRtmChatChannelMessage tmpMessage = commonRtmChatChannelMessageMakeFromInfo(userDocId, textInfo, ref);
    _channelMessageList.insert(0,tmpMessage);
    notifyListeners();
  }

  void addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {},
      userJoined: (uid, elapsed) {
        // log('userJoined  $uid $elapsed');
        // _joinUserDocIdList.add(uid);
        notifyListeners();
      },
      userOffline: (uid, reason) {
        //log('userOffline  $uid $reason');
        // _friendUserid = null;
        notifyListeners();
      },
      leaveChannel: (stats) {
        //log('leaveChannel ${stats.toJson()}');
        // _isJoinedCall = false;
        // _myUserid = null;
        // _friendUserid = null;
        notifyListeners();
      },
    ));
  }
}
