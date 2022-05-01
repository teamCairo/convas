import 'package:convas/UIs/talk/appointmentSelectTypeUI.dart';
import 'package:convas/UIs/talk/talkUI.dart';
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
import 'appointmentAnswerBottomSheetUI.dart';
import 'appointmentRequestLogic.dart';
import 'appointmentRequestMessageEditUI.dart';
import 'appointmentRequestProvider.dart';
import 'chatPageUI.dart';

class AppointmentRequest extends ConsumerStatefulWidget {
  AppointmentRequest(
    this.argumentFriendUserDocId,
    this.argumentFriendUserName,
    this.argumentFriendPhoto,
    this.requestDocId,
    this.mode,
    this.fromPage, {
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  final String argumentFriendUserName;
  final Image? argumentFriendPhoto;
  final String requestDocId;
  final String mode;
  final String fromPage;

  //mode "1":register,"2":edit/delete,"3":view

  @override
  AppointmentRequestState createState() => AppointmentRequestState();
}

class AppointmentRequestState extends ConsumerState<AppointmentRequest> {
  @override
  void initState() {
    super.initState();
    //必要に応じ初期処理追加
  }

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref
          .watch(appointRequestProvider.notifier)
          .initializeRequest(widget.mode, widget.requestDocId);
    }

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

        String buttonText = "";
        if (widget.mode == "1") {
          buttonText = "Request";
        } else if (widget.mode == "2") {
          buttonText = "Edit";
        } else {
          buttonText = "Choose calendar otherwise cancel";
        }

        return Scaffold(
          appBar: commonAppbarWhite("Request"),
          body: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 190,
                      child: SfCalendar(
                          //自分と相手の空き時間を表示する
                          view: CalendarView.timelineDay,
                          monthViewSettings:
                              const MonthViewSettings(showAgenda: true),
                          dataSource: EventDataSource(appointmentsList),
                          onTap: (calendarDetails) async {
                            if (widget.mode == "3") {
                              appointmentAnswerBottomSheet(context,calendarDetails, ref,"1",widget.argumentFriendUserDocId,widget.requestDocId,null);
                            } else {
                              await selectCalendarTime(
                                  calendarDetails, ref, context);
                            }
                          }),
                    ),
                    linePadding(context, ref, "Course", "course",
                        ref.watch(appointRequestProvider).courseCodeListText),
                    linePadding(context, ref, "Category", "category",
                        ref.watch(appointRequestProvider).categoryCodeListText),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 8),
                        child: commonText16BlackLeft("Message")),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ref.watch(appointRequestProvider).message,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black54),
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: commonButtonOrangeRoundSquareSmall(
                                  text: "Edit",
                                  onPressed: () async {
                                    if (widget.mode != "3") {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return const AppointmentRequestMessageEdit();
                                        }),
                                      );
                                    } else {}
                                  })),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: commonButtonOrangeRound(
                      text: buttonText,
                      onPressed: () async {
                        if (widget.mode == "1") {
                          await createRequest(
                              widget.argumentFriendUserDocId, ref);
                        } else if (widget.mode == "2") {
                          await editRequest(widget.argumentFriendUserDocId,
                              widget.requestDocId, ref);
                        } else {}
                        if (widget.fromPage == "Chat") {
                          Navigator.pop(context);
                        } else {
                          //TODO トーク画面から来たときとNow画面から来たときで処理を分ける
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return Talk();
                            }),
                          );

                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ChatPage(
                                  chatHeaderDocId: ref
                                      .watch(appointRequestProvider)
                                      .chatHeaderDocId,
                                  friendUserName: widget.argumentFriendUserName,
                                  friendUserDocId:
                                      widget.argumentFriendUserDocId,
                                  friendPhoto: widget.argumentFriendPhoto);
                            }),
                          );
                        }
                      }),
                ),
              ])),
        );
      },
    );
  }

  Widget linePadding(BuildContext context, WidgetRef ref, String displayedItem,
      String databaseItem, String value) {
    String displayedValue;
    List<String> tmpList = fromTextToList(value);

    if (value == "") {
      displayedValue = "Any " + databaseItem;
    } else {
      displayedValue = fromCodeListToTextDot(tmpList, databaseItem, ref);
    }

    return GestureDetector(
      onTap: () {
        if (widget.mode != "3") {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AppointmentSelectType(
                  displayedItem: displayedItem,
                  databaseItem: databaseItem,
                  value: value);
            }),
          );
        }
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
    );
  }
}
