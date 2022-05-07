import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import 'calendarEditDeleteDialogUI.dart';
import 'calendarEditDetailUI.dart';
import 'calendarEditProvider.dart';
import 'calendarEditSelectModeDialogUI.dart';

Future<void> selectCalendarTime(CalendarTapDetails calendarDetails,
    WidgetRef ref, BuildContext context) async {
  if (calendarDetails.appointments == null) {
    ref.read(calendarEditProvider.notifier).setEditMode("insert");
    ref
        .read(calendarEditProvider.notifier)
        .initializeEditedEvent(calendarDetails.date!);
    commonNavigatorPushSlideHorizon(
        context, CalendarEditDetail(calendarDetails: calendarDetails));
  } else {
    ref.read(calendarEditProvider.notifier).setEditMode("cancel");

    String eventType = commonGetAppointmentNotesItemString(
        calendarDetails.appointments!.first, "eventType");
    // String callChannelId = commonGetAppointmentNotesItemString(calendarDetails.appointments!.first,"callChannelId");
    // String friendUserDocId = commonGetAppointmentNotesItemString(calendarDetails.appointments!.first,"friendUserDocId");

    if (eventType == "5") {
      //自分から登録したアポの場合
      // appointmentAnswerBottomSheet(context,null, ref,"2",friendUserDocId,null,callChannelId);
    } else if (eventType == "6") {
      // appointmentAnswerBottomSheet(context,null, ref,"3",friendUserDocId,null,callChannelId);

    } else {
      await showDialog<void>(
        context: context,
        builder: (_) {
          return CalendarEditSelectModeDialog(details: calendarDetails);
        },
      );

      if (ref.watch(calendarEditProvider).editMode == "delete") {
        await commonShowClassDialog(
            context, CalendarEditDeleteDialog(details: calendarDetails));
      } else if (ref.watch(calendarEditProvider).editMode == "update") {
        ref
            .read(calendarEditProvider.notifier)
            .setEditedEventInfo(calendarDetails.appointments![0]);
        commonNavigatorPushSlideHorizon(
            context, CalendarEditDetail(calendarDetails: calendarDetails));
      } else if (ref.watch(calendarEditProvider).editMode == "insert") {
        ref
            .read(calendarEditProvider.notifier)
            .initializeEditedEvent(calendarDetails.date!);
        commonNavigatorPushSlideHorizon(
            context, CalendarEditDetail(calendarDetails: calendarDetails));
      }
    }
  }
}

Future<bool> checkEventData(BuildContext context, WidgetRef ref) async {
  if (ref
      .watch(calendarEditProvider)
      .editedDateTimeFrom!
      .isAfter(ref.watch(calendarEditProvider).editedDateTimeTo!)) {
    await commonShowOkWarningDialog(
        context, "End time is earlier than start time");
    return false;
  } else if ((ref
          .watch(calendarEditProvider)
          .editedDateTimeTo!
          .difference(ref.watch(calendarEditProvider).editedDateTimeFrom!)
          .inHours) >=
      24) {
    await commonShowOkWarningDialog(
        context, "Time should be shorter than 24 hours");
    return false;
  }
  return true;
}
