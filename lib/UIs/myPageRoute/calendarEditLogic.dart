import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import 'calendarEditUI.dart';
import 'calendarEditDeleteDialogUI.dart';
import 'calendarEditProvider.dart';
import 'calendarEditSelectModeDialogUI.dart';

Future<void> selectCalendarTime(CalendarTapDetails calendarDetails,
    WidgetRef ref, BuildContext context) async {
  if (calendarDetails.appointments == null) {
    ref.read(calendarEditProvider.notifier).setEditMode("insert");
    ref
        .read(calendarEditProvider.notifier)
        .initializeEditedEvent(calendarDetails.date!);
    _fabPressed(context, calendarDetails, ref);
  } else {
    ref.read(calendarEditProvider.notifier).setEditMode("cancel");

    await showDialog<void>(
      context: context,
      builder: (_) {
        return CalendarEditSelectModeDialog(details: calendarDetails);
      },
    );

    if (ref.watch(calendarEditProvider).editMode == "delete") {
      await showDialog<void>(
        context: context,
        builder: (_) {
          return CalendarEditDeleteDialog(details: calendarDetails);
        },
      );
    } else if (ref.watch(calendarEditProvider).editMode == "update") {
      ref
          .read(calendarEditProvider.notifier)
          .setEditedEventInfo(calendarDetails.appointments![0]);
      _fabPressed(context, calendarDetails, ref);
    } else if (ref.watch(calendarEditProvider).editMode == "insert") {
      ref
          .read(calendarEditProvider.notifier)
          .initializeEditedEvent(calendarDetails.date!);
      _fabPressed(context, calendarDetails, ref);
    }
  }
}

void _fabPressed(
    BuildContext context, CalendarTapDetails calendarDetails, WidgetRef ref) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, StateSetter setState) {
          return SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonButtonCloseForModal(context),
                commonTextBoxBordered(
                  text: "title",
                  initialValue: ref.watch(calendarEditProvider).editedEventName,
                  onChanged: (String value) {
                    ref
                        .read(calendarEditProvider.notifier)
                        .setEditedEventName(value);
                  },
                  passwordSecure: false,
                ),
                dateTimeRow(ref, context, "from", setState),
                dateTimeRow(ref, context, "to", setState),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: commonButtonOrangeRound(
                      text: ref.watch(calendarEditProvider).editMode == "insert"
                          ? "Create Event"
                          : "Update Event",
                      onPressed: () async {
                        if (ref.watch(calendarEditProvider).editMode ==
                            "insert") {
                          await ref
                              .read(calendarEditProvider.notifier)
                              .insertEditedEvent(ref);
                        } else {
                          await ref
                              .read(calendarEditProvider.notifier)
                              .updateEditedEvent(ref);
                        }
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          );
        },
      );
    },
  );
}
