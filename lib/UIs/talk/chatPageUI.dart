import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:isar/isar.dart';

import '../../common/UI/commonIconsUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../entityIsar/chatDetailEntityIsar.dart';
import '../../entityIsar/friendEntityIsar.dart';
import '../call/callRoomUI.dart';
import '../findRoute/friendProfileUI.dart';
import '../myPageRoute/calendarEditUI.dart';
import 'appointmentAnswerBottomSheetUI.dart';
import 'appointmentRequestUI.dart';

class ChatPage extends ConsumerWidget {
  String friendUserDocId;
  String friendUserName;
  String chatHeaderDocId;
  Image? friendPhoto;

  ChatPage({
    required this.friendUserDocId,
    required this.friendUserName,
    required this.chatHeaderDocId,
    this.friendPhoto,
    Key? key,
  }) : super(key: key);

  String message = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Friend? friendData =
        ref.watch(friendDataProvider).friendData[friendUserDocId];

    Image? friendImage;
    String friendNameTmp = "";
    if (friendData != null) {
      friendNameTmp = friendData.friendUserName;
      if (friendData.profilePhoto == null) {
        friendData.profilePhoto;
      } else {
        friendImage = Image.memory(friendData.profilePhoto!);
      }
    } else {
      friendImage = friendPhoto;
      friendNameTmp = friendUserName;
    }

    return Scaffold(
        appBar: appbarImageAndButtons(ref, context, friendNameTmp, friendImage),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
              child: buildMessageList(
                  ref.watch(userDataProvider).userData["userDocId"]!,
                  friendUserDocId,
                  chatHeaderDocId,
                  ref),
            ),
          ),
          textInputWidget(ref, context, friendNameTmp, friendImage)
        ])));
  }

  SpeedDial speedDialButton(WidgetRef ref, BuildContext context,
      String friendUserDocId, String friendUserName, Image? friendImage) {
    return SpeedDial(
      elevation: 6,
      buttonSize: const Size(45.0, 45.0),
      childrenButtonSize: const Size(55.0, 55.0),
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22.0),
      curve: Curves.bounceIn,
      // icon:Icons.keyboard_arrow_up,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.call_sharp),
            backgroundColor: Colors.orange,
            label: "call",
            onTap: () {},
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SpeedDialChild(
            child: const Icon(Icons.calendar_today_outlined),
            backgroundColor: Colors.blue,
            label: "appointment",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return AppointmentRequest(
                      friendUserDocId, friendUserName, friendImage,"" , "1","Chat");
                }),
              );
            },
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SpeedDialChild(
            child: const Icon(Icons.mic),
            backgroundColor: Colors.teal,
            label: "voice chat",
            onTap: () {},
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SpeedDialChild(
            child: const Icon(Icons.photo_outlined),
            backgroundColor: Colors.teal,
            label: "send photo",
            onTap: () {},
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SpeedDialChild(
            child: const Icon(Icons.camera_alt_outlined),
            backgroundColor: Colors.teal,
            label: "take photo",
            onTap: () {},
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  AppBar appbarImageAndButtons(WidgetRef ref, BuildContext context,
      String friendName, Image? friendImage) {
    return AppBar(
      leading: IconButton(
        icon: commonCircleAvatarImage(
            image: friendImage, radius: 20, name: friendUserName),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return FriendProfile(
                argumentFriendUserDocId: friendUserDocId,
              );
            }),
          );
        },
      ),
      elevation: 0.6,
      title: commonText20BlackLeftBold(friendName),
    );
  }

  Padding balloon(
      ChatDetail chatDetail, String rightLeft, BuildContext context,WidgetRef ref) {
    //rightLeft="right"or"left"

    List<Widget> widgetList = [];
    widgetList.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: commonText14Gray(chatDetail.message)));
    if (chatDetail.messageType == "3") {
      if (rightLeft == "right") {
        widgetList.add(commonText14Gray("You sent a request"));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "View request", onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AppointmentRequest(friendUserDocId,
                  friendUserName, friendPhoto,chatDetail.referDocId ,"2","Chat");
            }),
          );
        }));
      } else {
        widgetList.add(commonText14Gray("Friend sent a request"));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "View request",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return AppointmentRequest(friendUserDocId,
                      friendUserName, friendPhoto,chatDetail.referDocId ,"3","Chat");
                }),
              );
            }));
      }
    }

    if (chatDetail.messageType == "4") {
      if (rightLeft == "right") {
        widgetList.add(commonText14Gray("You sent a appointment"));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "View appointment", onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return CalendarEdit(friendUserDocId);
            }),
          );
          appointmentAnswerBottomSheet(context,null, ref,"2",friendUserDocId,null,chatDetail.referDocId);
        }));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "Enter call room",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return CallRoom( argumentFriendUserDocId: friendUserDocId, appointmentId: chatDetail.referDocId);
                }),
              );
            }));
      } else {
        widgetList.add(commonText14Gray("Friend sent a appointment"));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "View appointment",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return CalendarEdit(friendUserDocId);
                }),
              );
            }));
        widgetList.add(commonButtonSmallOrangeRound(
            text: "Enter call room",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return CallRoom( argumentFriendUserDocId: friendUserDocId, appointmentId: chatDetail.referDocId);
                }),
              );
            }));
      }
    }

    return Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: commonBalloon(
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widgetList),
            rightLeft));
  }

  Widget textInputWidget(WidgetRef ref, BuildContext context, String friendName,
      Image? friendPhoto) {
    var _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 52,
        child: Row(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: commonTextBoxGray(
                onChanged: (String value) {
                  message = value;
                },
                controller: _controller,
                multiLine: true),
          )),
          commonButtonGraySmallerIcon(
              icon: MyFlutterApp.send,
              onPressed: () async {
                await insertChatDetailsDataMessage(
                  ref: ref,
                  chatHeaderDocId: chatHeaderDocId,
                  friendUserDocId: friendUserDocId,
                  message: message,
                  programId: "chatPageUI",
                );
                _controller.clear();
              }),
          speedDialButton(
              ref, context, friendUserDocId, friendName, friendPhoto)
        ]),
      ),
    );
  }

  Widget buildMessageList(
      String userDocId, String friendUserDocId, String chatHeaderDocId,WidgetRef ref) {
    var isarInstance = Isar.getInstance();
    Query<ChatDetail>? chatDetailDataQuery = isarInstance?.chatDetails
        .filter()
        .chatHeaderDocIdEqualTo(chatHeaderDocId)
        .sortBySendTimeDesc()
        .build();

    return StreamBuilder<List<ChatDetail>>(
      stream: chatDetailDataQuery?.watch(initialReturn: true),
      builder: (context, AsyncSnapshot<List<ChatDetail>> chatDetailsList) {
        if (!chatDetailsList.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (chatDetailsList.hasError) {
          return const Text('Something went wrong');
        }
        return ListView(
          reverse: true,
          // controller: _scrollController,
          children: chatDetailsList.data!.map((ChatDetail chatDetail) {
            if (chatDetail.senderUserDocId == userDocId) {
              return balloon(chatDetail, "right", context,ref);
            } else {
              return balloon(chatDetail, "left", context,ref);
            }
          }).toList(),
        );
      },
    );
  }
}
