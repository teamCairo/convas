import 'package:convas/UIs/myPageRoute/calendarEditUI.dart';
import 'package:convas/UIs/talk/appointmentSelectTypeUI.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicList.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../common/otherClass/calendar/commonClassEventDataSource.dart';
import '../../entityIsar/eventEntityIsar.dart';
import '../myPageRoute/calendarEditLogic.dart';
import 'appointmentRequestLogic.dart';
import 'appointmentRequestProvider.dart';

class AppointmentRequest extends ConsumerStatefulWidget {
  AppointmentRequest(
    this.argumentFriendUserDocId,
    this.argumentFriendUserName, {
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;

  @override
  AppointmentRequestState createState() => AppointmentRequestState();
}

class AppointmentRequestState extends ConsumerState<AppointmentRequest> {
  @override
  void initState() {
    super.initState();

    //必要に応じ初期処理追加
  }

  @override
  Widget build(BuildContext context) {
    var isarInstance = Isar.getInstance();
    Query<Event>? eventDataQuery =
        isarInstance?.events.filter().deleteFlgEqualTo(false).build();

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

        List<Appointment> appointmentsList = [];
        for (int i = 0; i < eventsList.data!.length; i++) {
          appointmentsList.add(commonMakeAppointment(
              eventsList.data![i].eventDocId,
              eventsList.data![i].userDocId,
              widget.argumentFriendUserDocId,
              eventsList.data![i].eventName,
              eventsList.data![i].eventType,
              eventsList.data![i].friendUserDocId,
              eventsList.data![i].callChannelId ?? "",
              eventsList.data![i].fromTime!,
              eventsList.data![i].toTime!,
              eventsList.data![i].isAllDay,
              eventsList.data![i].repeat,
              eventsList.data![i].monday,
              eventsList.data![i].tuesday,
              eventsList.data![i].wednesday,
              eventsList.data![i].thursday,
              eventsList.data![i].friday,
              eventsList.data![i].saturday,
              eventsList.data![i].sunday,
              eventsList.data![i].description,
              eventsList.data![i].recurrenceRule,
              null,
              Colors.orangeAccent,
              ""));
        }

        appointmentsList
            .addAll(ref.watch(appointRequestProvider).appointmentList);

        return Scaffold(
          appBar: commonAppbarWhite("Request"),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[
              SizedBox(
                height: 190,
                child: SfCalendar(
                    //自分と相手の空き時間を表示する
                    view: CalendarView.timelineDay,
                    monthViewSettings:
                        const MonthViewSettings(showAgenda: true),
                    dataSource: EventDataSource(appointmentsList),
                    onTap: (calendarDetails) async {
                      await selectCalendarTime(calendarDetails, ref, context);
                    }),
              ),
              linePadding(
                  context,
                  ref,
                  "Course",
                  "course",
                      ref.watch(appointRequestProvider).courseCodeListText),
              linePadding(
                  context,
                  ref,
                  "Category",
                  "category",
                  ref.watch(appointRequestProvider).categoryCodeListText),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                child: commonText16BlackLeft("Message"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                child: TextFormField(
                  maxLines: null,
                  minLines: 5,
                  // テキスト入力のラベルを設定
                  decoration: const InputDecoration(labelText: "input"),
                  initialValue:
                      ref.watch(appointRequestProvider).requestMessage,
                  onChanged: (String value) {
                    ref
                        .read(appointRequestProvider.notifier)
                        .setRequestDescription(value);
                  },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              commonButtonOrangeRound(
                  text: "Request",
                  onPressed: () async{
                    await createRequest(widget.argumentFriendUserDocId, ref);
                    Navigator.pop(context);
                  }),
            ]),
          )),
        );
      },
    );
  }

  Padding linePadding(
      BuildContext context, WidgetRef ref,String displayedItem,String databaseItem, String value) {

    String displayedValue;
    List<String> tmpList = fromTextToList(value);

    if(value==""){
      displayedValue="Any "+databaseItem;
    }else{
      displayedValue = fromCodeListToTextDot(tmpList,databaseItem, ref);
    }

    return Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return  AppointmentSelectType(displayedItem: displayedItem, databaseItem: databaseItem, value: value);
              }),
            );
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    black16TextLeft(displayedItem),
                    commonText16GrayRightEllipsis(displayedValue)
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
