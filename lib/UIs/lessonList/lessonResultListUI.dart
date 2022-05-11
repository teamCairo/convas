import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/commonValues.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../common/otherClass/commonClassAppointment.dart';
import '../../common/provider/friendProvider.dart';
import '../../common/provider/masterProvider.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/appointmentsDaoFirebase.dart';
import '../talk/appointmentRequestViewUI.dart';

class LessonResultList extends ConsumerWidget {
  LessonResultList({
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
      future: selectFirebaseAppointmentResultByUserDocId(
          ref.watch(userDataProvider).userData["userDocId"]),


      builder: (BuildContext context, AsyncSnapshot<List<CommonClassAppointment>> snapshot) {
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

  Widget requestListUnit(BuildContext context, WidgetRef ref, CommonClassAppointment appoint) {
    String durationTimeStr = commonLogicDurationText(appoint.fromTime,appoint.toTime);

    String friendDocId = "";
    if(appoint.senderUserDocId==ref.watch(userDataProvider).userData["userDocId"]){
      friendDocId=appoint.receiverUserDocId;
    }else{
      friendDocId=appoint.senderUserDocId;
    }

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
                        image: ref.watch(friendDataProvider).friendData[friendDocId]!.profilePhoto == null
                            ? null
                            : Image.memory(ref.watch(friendDataProvider).friendData[friendDocId]!.profilePhoto!),
                        name: ref.watch(friendDataProvider).friendData[friendDocId]!.friendUserName),
                  ),
                  Expanded(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: commonText16BlackLeft(ref.watch(friendDataProvider).friendData[friendDocId]!.friendUserName),
                      ),
                      commonText14GrayLeft(durationTimeStr),
                    ]),
                  ),
                  SizedBox(
                      width: 70 * screenAdjustSizeH,
                      child: Column(children:  [
                        commonText14GrayLeft(getMasterData("appointmentStatus", appoint.status, ref).name),
                      ]))
                ]),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return AppointmentRequestView(friendDocId,
                    ref.watch(friendDataProvider).friendData[friendDocId]!.friendUserName,
                    ref.watch(friendDataProvider).friendData[friendDocId]!.profilePhoto==null?null:
                    ref.watch(friendDataProvider).friendData[friendDocId]!.profilePhoto == null
                        ? null
                        : Image.memory(ref.watch(friendDataProvider).friendData[friendDocId]!.profilePhoto!),
                    "" ,appoint.appointmentDocId,"2");
              }),
            );
          },
        ),
      ),
    );
  }
}
