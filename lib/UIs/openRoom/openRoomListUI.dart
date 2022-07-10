import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonPushUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/provider/userProvider.dart';
import '../../daoFirebase/openRoomDaoFirebase.dart';
import 'openRoomRootUI.dart';

class OpenRoomList extends ConsumerWidget {
  OpenRoomList({
    Key? key,
  }) : super(key: key);

  double screenHeight = 1;
  double screenWidth = 1;
  double screenAdjustSizeH = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: commonAppTabBar(),
      body: buildTalkList(
          context, ref, ref.watch(userDataProvider).userData["userDocId"]!),
    );
  }

  Widget buildTalkList(BuildContext context, WidgetRef ref, String userDocId) {
    // screenHeight = MediaQuery.of(context).size.height;
    // screenWidth = MediaQuery.of(context).size.width;
    // screenAdjustSizeH = MediaQuery.of(context).size.height * mediaQueryScreenHeightCoefficient;

    return FutureBuilder(
      future: selectFirebaseOpenRoomSortByCreateDate(),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.size,
              itemBuilder: (BuildContext context, int index) {
                return openRoomListUnit(context, ref, snapshot.data.docs[index]);
              });
        } else {
          return const Text("No data found");
        }
      },
    );
  }

  Widget openRoomListUnit(BuildContext context, WidgetRef ref,  DocumentSnapshot dSnapshot) {
    //
    // String friendDocId = "";
    // if(appoint.senderUserDocId==ref.watch(userDataProvider).userData["userDocId"]){
    //   friendDocId=appoint.receiverUserDocId;
    // }else{
    //   friendDocId=appoint.senderUserDocId;
    // }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0 * screenAdjustSizeH),
      child: SizedBox(
        height: 70,
        child: GestureDetector(
          child: Container(
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: commonText16BlackLeft(dSnapshot.get("roomName")),
                      ),
                      commonText14GrayLeft(dSnapshot.get("description")),
                    ]),
                  ),
                  // SizedBox(
                  //     width: 70 * screenAdjustSizeH,
                  //     child: Column(children:  [
                  //       commonText14GrayLeft(getMasterData("appointmentStatus", appoint.status, ref).name),
                  //     ]))
                ]),
          ),
          onTap: () {
            commonNavigatorPushSlideHorizon(context, OpenRoomRoot(openRoomDocId: dSnapshot.id));

          },
        ),
      ),
    );
  }
}
