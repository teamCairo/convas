
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendarEditProvider.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonTextUI.dart';

class CalendarEditSelectModeDialog extends ConsumerWidget {
  CalendarEditSelectModeDialog({

    required this.details,
    Key? key}) : super(key: key);
  CalendarTapDetails details;



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _dialogWidth = MediaQuery.of(context).size.width * 3 / 4; // 画面サイズから相対的に大きさを決めている。
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: gray16TextLeft("What do you want to do?"),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          buttonPadding("Edit event","update",ref,context),
                          buttonPadding("Delete event","delete",ref,context),
                          buttonPadding("Add new event","insert",ref,context),
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

Padding buttonPadding(String text,String mode,WidgetRef ref,BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:7.0),
    child: commonButtonOrangeRound(text: text,
        onPressed: (){
          ref.read(calendarEditProvider.notifier).setEditMode(mode);
          Navigator.pop(context);
        }),
  );

}