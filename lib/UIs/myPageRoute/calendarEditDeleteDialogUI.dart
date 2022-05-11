import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/otherClass/calendar/commonLogicInterfaceAppointment.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/eventsDaoFirebase.dart';

class CalendarEditDeleteDialog extends ConsumerWidget {
  CalendarEditDeleteDialog({

    required this.details,
    Key? key}) : super(key: key);
  CalendarTapDetails details;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonDialog(
      context,
      ref,
      "Delete available time",
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText16GrayCenter("Are you sure you wanna delete?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              commonButtonWhiteBorderRound(text: "Cancel",
                  width:(MediaQuery.of(context).size.width * 3 / 8)-18,
                  onPressed: (){
                    Navigator.pop(context);
                  }),

              commonButtonSecondaryColorRound(text: "Delete",
                  width:(MediaQuery.of(context).size.width * 3 / 8)-18,
                  onPressed: ()async{
                    await logicalDeleteEventData(commonGetAppointmentNotesItemString(details.appointments![0],"eventDocId"),ref.watch(userDataProvider).userData["userDocId"],"CalendarEditDeleteDialog");
                    Navigator.pop(context);
                  })

            ],
          ),
        ],
      ),
      height:MediaQuery.of(context).size.width * 1 / 2
    );
  }
}