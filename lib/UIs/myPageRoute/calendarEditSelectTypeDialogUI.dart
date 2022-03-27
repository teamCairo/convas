import 'package:convas/UIs/myPageRoute/calendarEditProvider.dart';
import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonTextUI.dart';

class CalendarEditSelectTypeDialog extends ConsumerWidget {
  CalendarEditSelectTypeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _dialogWidth = MediaQuery.of(context).size.width * 3 / 4;
    
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // SizedBoxでダイアログそのものの大きさをまずは決めています。
      child: SizedBox(
        width: _dialogWidth,
        height: _dialogWidth*1.5,
        child: Container(
          decoration: BoxDecoration(
            color:Colors.white,
            border:Border.all(style:BorderStyle.none),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Column(
                    children: [
                      commonButtonCloseForModal(context),
                      RadioListTile(
                          title: commonText16GrayLeft(getMasterData("eventType","1", ref).name),
                          value: "1",
                          groupValue: ref.watch(calendarEditProvider).editedEventType,
                          onChanged: (key) => ref.read(calendarEditProvider.notifier).setEventType(key.toString()),
                          controlAffinity:ListTileControlAffinity.trailing
                      ),
                      RadioListTile(
                          title: commonText16GrayLeft(getMasterData("eventType","2", ref).name),
                          value: "2",
                          groupValue: ref.watch(calendarEditProvider).editedEventType,
                          onChanged: (key) => ref.read(calendarEditProvider.notifier).setEventType(key.toString()),
                          controlAffinity:ListTileControlAffinity.trailing
                      ),
                      commonButtonOrangeRound(
                          text: "OK", onPressed: (){
                        Navigator.of(context).pop();
                      })

                    ],
                  ),
                ]

            ),
          ),
        ),
      ),
    );
  }
}