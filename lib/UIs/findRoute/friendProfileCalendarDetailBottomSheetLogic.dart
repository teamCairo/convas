import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'friendProfileCalendarDetailBottomSheetProvider.dart';
import 'friendProfileCalendarDetailBottomSheetUI.dart';

Future<void> selectCalendarTimeOnFriendProfile(CalendarTapDetails calendarDetails,
    WidgetRef ref, BuildContext context, String frienduserDocId)async {
    ref
        .read(friendProfileCalendarDetailBottomSheetProvider.notifier)
        .initialize(calendarDetails.date!);
    friendProfileCalendarDetailBottomSheet(context, calendarDetails, ref, frienduserDocId);

}