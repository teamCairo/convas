import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/logic/commonLogicDate.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../entityIsar/friendEntityIsar.dart';
import 'chatPageUI.dart';

class Talk extends ConsumerWidget {
  Talk({
    Key? key,
  }) : super(key: key);

  double screenHeight=1;
  double screenWidth=1;
  double screenAdjustSizeH=1;


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: commonAppbarWhite('Talk'),
      body: buildTalkList(context,ref,ref.watch(userDataProvider).userData["userDocId"]!),
    );
  }

  Widget buildTalkList(BuildContext context,WidgetRef ref,String userDocId) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    screenAdjustSizeH = MediaQuery.of(context).size.height * 0.0011;

    List<Friend>  friendList =ref.read(friendDataProvider.notifier).getFriendList();

    return ListView.builder(
        itemCount:friendList.length,
        itemBuilder:(BuildContext context,int index){
          return talkListUnit( context,  ref,friendList[index]);
        }
    );

  }

  Widget talkListUnit(BuildContext context,WidgetRef ref,Friend friendData) {

    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0*screenAdjustSizeH),
      child: SizedBox(
        height: 70,
        child: GestureDetector(
          child: Container(
            color:Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: commonCircleAvatarImage(
                        radius: 35*screenAdjustSizeH,
                        image:friendData.profilePhoto==null?null:Image.memory(friendData.profilePhoto!)),
                  ),
                  Expanded(child:Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: commonText16BlackLeft(
                                friendData.friendUserName
                              ),
                          ),
                          commonText14GrayLeft(
                              friendData.lastMessageContent,
                            ),
                        ]),
                    ),
                  SizedBox(
                      width: 60*screenAdjustSizeH,
                      child: Column(children: [
                        commonText14GrayLeft(
                          fromLastTimeToText(friendData.lastMessageTime)
                        ),
                      ]))
                ]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(friendUserDocId:friendData.friendUserDocId
                    ,friendUserName:friendData.friendUserName, chatHeaderDocId: friendData.chatHeaderId),
              ),
            );
          },
        ),
      ),
    );
  }
}
