import 'package:convas/UIs/openRoom/createOpenRoomProvider.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonTextFormUI.dart';
import 'package:intl/intl.dart';

class CreateOpenRoom extends ConsumerWidget {
  CreateOpenRoom({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg= true;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(createOpenRoomProvider.notifier).initialize();
    }

    String closeDateText = "";
    if (ref.watch(createOpenRoomProvider).endDateTime == null) {
      closeDateText = "Add close date";
    } else {
      DateFormat outputFormat = DateFormat('yyyy/MM/dd');
      closeDateText =
          outputFormat.format(ref.watch(createOpenRoomProvider).endDateTime!);
    }

    return commonScaffoldScroll(
        context,
        ref,
        MainAxisAlignment.start,
        [
          Column(
            children: <Widget>[
              commonTextBoxBordered(
                  text: "Room name",
                  initialValue: ref.watch(createOpenRoomProvider).roomName,
                  onChanged: (String value) {
                    ref
                        .read(createOpenRoomProvider.notifier)
                        .setRoomName(value);
                  },
                  passwordSecure: false),
              commonVerticalGap(),
              commonTextBoxBordered(
                text: "Description",
                initialValue: ref.watch(createOpenRoomProvider).description,
                onChanged: (String value) {
                  ref
                      .read(createOpenRoomProvider.notifier)
                      .setDescription(value);
                },
                maxLines: 20,
                minLines: 7,
              ),
              commonVerticalGap(),
              commonButtonWhiteBorderRound(
                text: closeDateText,
                onPressed: () async {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime.now().add(const Duration(days: 7)),
                      onConfirm: (date) {
                    ref
                        .read(createOpenRoomProvider.notifier)
                        .setEndDateTime(date);
                  },
                      currentTime:
                          ref.watch(createOpenRoomProvider).endDateTime ??
                              DateTime.now(),
                      locale: LocaleType.en);
                },
              ),
              commonVerticalGap(),
              commonButtonSecondaryColorRound(
                  text: "Create room",
                  onPressed: () async {
                    await ref
                        .read(createOpenRoomProvider.notifier)
                        .insertOpenRoomData(ref);

                    await commonShowOkInfoDialog(context,
                        "Successful creation",
                        "You created new open room!!");

                    ref
                        .read(createOpenRoomProvider.notifier)
                        .initialize();

                    ref
                        .read(createOpenRoomProvider.notifier)
                        .resetScreen();

                  }),
            ],
          ),
        ],
        appBar: commonAppbar("Create open room"));
  }
}
