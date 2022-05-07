import 'package:convas/UIs/myPageRoute/calendarEditProvider.dart';
import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';

class CalendarEditSelectAvailableTypeDialog extends ConsumerWidget {
  const CalendarEditSelectAvailableTypeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonDialog(
      context,
      ref,
      "Availability",
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // commonButtonCloseForModal(context)
          commonText16GrayCenter("Choose availability"),
          Column(
            children: [
              commonButtonOrangeRound(
                  text: getMasterData("eventType", "2", ref).name,
                  onPressed: () {
                    ref.read(calendarEditProvider.notifier).setEventType("2");
                    Navigator.of(context).pop();
                  }),
              commonVerticalGap(),
              commonButtonWhiteBorderRound(
                  text: getMasterData("eventType", "1", ref).name,
                  onPressed: () {
                    ref.read(calendarEditProvider.notifier).setEventType("1");
                    Navigator.of(context).pop();

                  }),
            ],
          ),
        ],
      ),
    );
  }
}
