import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:convas/common/otherClass/commonClassRequest.dart';
import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/logic/commonLogicDate.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/requestsDaoFirebase.dart';
import '../talk/appointmentRequestViewUI.dart';

class LessonRequestList extends ConsumerWidget {
  LessonRequestList({
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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    screenAdjustSizeH = MediaQuery.of(context).size.height * 0.0011;

    return FutureBuilder(
      future: selectFirebaseRequestByUserDocId(
          ref.watch(userDataProvider).userData["userDocId"]),
      builder: (BuildContext context, AsyncSnapshot<List<CommonClassRequest>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return requestListUnit(context, ref, snapshot.data![index]);
              });
        } else {
          return const Text("No data found");
        }
      },
    );
  }

  Widget requestListUnit(BuildContext context, WidgetRef ref, CommonClassRequest request) {
    String durationTimeStr = commonLogicDurationText(request.from,request.to);

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: commonCircleAvatarImage(
                        radius: 30 * screenAdjustSizeH,
                        image: ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.profilePhoto == null
                            ? null
                            : Image.memory(ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.profilePhoto!),
                        name: ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.friendUserName),
                  ),
                  Expanded(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: commonText16BlackLeft(ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.friendUserName),
                      ),
                      commonText14GrayLeft(durationTimeStr),
                    ]),
                  ),
                  SizedBox(
                      width: 70 * screenAdjustSizeH,
                      child: Column(children: [
                        commonText14GrayLeft(getMasterData("requestStatus", request.status, ref).name),
                      ]))
                ]),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return AppointmentRequestView(request.senderUserDocId,
                    ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.friendUserName,
                    ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.profilePhoto==null?null:
                    Image.memory(ref.watch(friendDataProvider).friendData[request.senderUserDocId]!.profilePhoto!),
                    request.requestDocId ,"","1");
              }),
            );
          },
        ),
      ),
    );
  }
}
