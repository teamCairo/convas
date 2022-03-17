
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendarEditProvider.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/provider/userProvider.dart';
import 'daoFirebase/eventsDaoFirebase.dart';

class CalendarEditDeleteDialog extends ConsumerWidget {
  CalendarEditDeleteDialog({

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
          height: _dialogWidth*0.6,
            child: Container(
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(style:BorderStyle.none),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        children: [
                          commonButtonCloseForModal(context),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: commonText16BlackLeft("Are you sure you wanna delete?"),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            commonButtonSmallOrangeRound(text: "Cancel",
                                onPressed: (){
                                  Navigator.pop(context);
                                }),

                            commonButtonSmallOrangeRound(text: "Delete",
                                onPressed: ()async{
                                  await logicalDeleteEventData(details.appointments![0].eventDocId,ref.watch(userDataProvider).userData["userDocId"],"CalendarEditDeleteDialog");
                                  Navigator.pop(context);
                                })

                          ],
                        ),
                      )

                    ]

                ),
              ),
            ),
      ),
    );
  }
}