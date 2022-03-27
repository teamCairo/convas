import 'package:convas/UIs/now/nowPageProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../talk/appointmentRequestUI.dart';

class NowPage extends ConsumerWidget {
  NowPage({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.watch(nowPageProvider.notifier).initializeEditedEvent();
    }

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
              height: 120,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: userPhotosList(ref, context)))),
          Expanded(
            child: SfCalendar(
                timeSlotViewSettings: const TimeSlotViewSettings(
                    timeInterval: Duration(hours: 2)),
                view: CalendarView.timelineDay,
                monthViewSettings: const MonthViewSettings(showAgenda: true),
                dataSource: ref.watch(nowPageProvider).eventDataSource,
                onTap: (calendarTapDetails) async {
                  ref.read(nowPageProvider.notifier).setCalendarTapDetails(calendarTapDetails);
                },
                onViewChanged:(viewChangedDetails) async {
                  ref.read(nowPageProvider.notifier).refleshEventShow(ref,viewChangedDetails.visibleDates[0].add(const Duration(days:-1)), viewChangedDetails.visibleDates[0].add(const Duration(days:1)));
                })
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 200,
            child:eventDetail(ref, context)),
          ),
        ],
      ),
    ));
  }
}

Widget eventDetail(WidgetRef ref,BuildContext context){
  CalendarTapDetails? calendarTapDetails=ref.watch(nowPageProvider).selectedCalendarTapDetails;
  if(calendarTapDetails==null||calendarTapDetails.appointments==null){

    return Container(child:commonText20BlackCenter("Select schedule"));

  }else{

    double radius = 24;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween
        ,children:[Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[commonCircleAvatarUserImage(
            radius: radius,
            context: context,
            name: ref.watch(nowPageProvider).userInfoMap[commonGetAppointmentNotesItemString(calendarTapDetails.appointments![0],"userDocId")]!.name,
            image: ref.watch(nowPageProvider).userInfoMap[commonGetAppointmentNotesItemString(calendarTapDetails.appointments![0],"userDocId")]!.photo,
            userDocId: commonGetAppointmentNotesItemString(calendarTapDetails.appointments![0],"userDocId")),
          commonText16BlackLeft(ref.watch(nowPageProvider).userInfoMap[commonGetAppointmentNotesItemString(calendarTapDetails.appointments![0],"userDocId")]!.name)
    ]),
          commonButtonOrangeRound(text: "Request Call", onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return AppointmentRequest(commonGetAppointmentNotesItemString(calendarTapDetails.appointments![0],"userDocId"),
                    ref.watch(nowPageProvider).userInfoMap[commonGetAppointmentNotesItemString(calendarTapDetails.appointments![0],"userDocId")]!.name
                );
              }),
            );
          })
        ]);
  }

}

List<Widget> userPhotosList(WidgetRef ref, BuildContext context) {
  List<Widget> returnList = [];

  double radius = 24;
  for (int i = 0;
      i < ref.watch(nowPageProvider).userDocIdForShowList.length;
      i++) {
    String userDocId = ref.watch(nowPageProvider).userDocIdForShowList[i];

    returnList.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
          height: radius*2*1.25,
          width: radius*2*1.25,
          decoration:BoxDecoration(
            border: Border.all(color:
            calendarTimelineColors[i]),
            borderRadius: BorderRadius.circular(radius*1.25),
          ),
          child: commonCircleAvatarUserImage(
              radius: radius,
              context: context,
              name: ref.watch(nowPageProvider).userInfoMap[userDocId]!.name,
              image: ref.watch(nowPageProvider).userInfoMap[userDocId]!.photo,
              userDocId: userDocId)),
    ));
  }
  return returnList;
}
