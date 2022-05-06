
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonOthersUI.dart';
import 'calendarEditProvider.dart';
import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonTextUI.dart';

class CalendarEditSelectModeDialog extends ConsumerWidget {
  CalendarEditSelectModeDialog({
    required this.details,
    Key? key}) : super(key: key);
  CalendarTapDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return commonDialog( context,  ref,  "Select action", Container(
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
                  commonText16BlackCenter("What do you want to do?"),

                ],
              ),
              Column(
                children: [
                  footerButton("Edit","update",ref,context),
                  footerButton("Delete","delete",ref,context),
                  footerButton("Add","insert",ref,context),
                ],
              ),
            ]

        ),
      ),
    ),
    height:MediaQuery.of(context).size.width);
  }
}

Widget footerButton(String text,String mode,WidgetRef ref,BuildContext context){
  return Column(
    children:[
      commonVerticalGap(),
      commonButtonOrangeRound(text: text, onPressed: (){
        ref.read(calendarEditProvider.notifier).setEditMode(mode);
        Navigator.pop(context);
      })]
  );


}