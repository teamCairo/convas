import 'package:convas/UIs/myPageRoute/calendarEditUI.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../common/logic/commonLogicList.dart';
import '../../common/otherClass/calendar/commonClassCalendarEvent.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../common/provider/userProvider.dart';
import '../../entityIsar/eventEntityIsar.dart';
import 'appointmentRequestProvider.dart';

class AppointmentRequest extends ConsumerWidget {
  AppointmentRequest(this.argumentFriendUserDocId, {
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    var isarInstance = Isar.getInstance();
    Query<Event>? eventDataQuery = isarInstance?.events
        .filter()
        .deleteFlgEqualTo(false)
        .build();

    return StreamBuilder<List<Event>>(
      stream: eventDataQuery?.watch(initialReturn: true),
      builder: (context, AsyncSnapshot<List<Event>> eventsList) {
        if (!eventsList.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (eventsList.hasError) {
          return const Text('Something went wrong');
        }

        List<CalendarEvent> calendarEventList=[];
        for(int i=0;i<eventsList.data!.length;i++){
          calendarEventList.add(
              CalendarEvent(eventsList.data![i].eventDocId,
                  eventsList.data![i].userDocId,
                  ref.watch(userDataProvider).userData["name"],
                  eventsList.data![i].eventName,
                  eventsList.data![i].eventType,
                  eventsList.data![i].friendUserDocId,
                  eventsList.data![i].callChannelId,
                  eventsList.data![i].fromTime,
                  eventsList.data![i].toTime,
                  eventsList.data![i].isAllDay,
                  Colors.orangeAccent
              )

          );
        }

        return Scaffold(
          appBar: commonAppbarWhite("Request"),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(
                    height:190,
                    child: SfCalendar(
                      //自分と相手の空き時間を表示する
                        view: CalendarView.timelineDay,
                        monthViewSettings: const MonthViewSettings(showAgenda: true),
                        dataSource: EventDataSource(calendarEventList),
                        onTap: (calendarDetails) async{
                          // await selectCalendarTime(calendarDetails,
                          //     ref, context);
                        }),
                  ),
                  linePadding ( context, ref, "Course", masterNameTextFromCodeText(ref.watch(appointRequestProvider).courseCodeListText,"course",ref)),
                  linePadding ( context, ref, "Topic", masterNameTextFromCodeText(ref.watch(appointRequestProvider).courseCodeListText,"topic",ref)),
                  Padding(
                    padding:const EdgeInsets.symmetric(vertical:30,horizontal:26),
                    child:commonText16BlackLeft("Description"),),
                  Padding(
                    padding:const EdgeInsets.symmetric(vertical:30,horizontal:26),
                    child:TextFormField(
                      maxLines: null,
                      minLines: 5,
                      // テキスト入力のラベルを設定
                      decoration: const InputDecoration(labelText: ""),
                      initialValue:ref.watch(appointRequestProvider).requestDescription,
                      onChanged: (String value) {
                        ref.read(appointRequestProvider.notifier).setRequestDescription(value);
                      },
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),),
                  commonButtonOrangeRound(text: "Request",
                      onPressed: (){

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return CalendarEdit( argumentFriendUserDocId);
                          }),
                        );
                      }),
                ]),
              )),
        );

      },
    );


  }


  Padding linePadding (BuildContext context,WidgetRef ref,String displayedItem, String value) {

    return Padding(
        padding: const EdgeInsets.only(left:14,right:14,bottom:0),
        child: GestureDetector(
          onTap:(){
          },
          child: Container(
            child:Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    black16TextLeft(displayedItem),
                    commonText16GrayRightEllipsis(value)
                    // gray16TextRightEllipsis(displayedValue,200)
                  ]),
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 0.5,
                ),
              ),
            ),
          ),
        ));
  }


}
