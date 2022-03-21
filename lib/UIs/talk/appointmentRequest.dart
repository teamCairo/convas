import 'package:convas/UIs/myPageRoute/calendarEditUI.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/provider/userProvider.dart';

class AppointmentRequest extends ConsumerWidget {
  AppointmentRequest(this.argumentFriendUserDocId, {
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: commonAppbarWhite("Concept"),
      body: SafeArea(
          child: Column(children: <Widget>[
            commonButtonOrangeRound(text: "Edit available time",
                onPressed: (){

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CalendarEdit( argumentFriendUserDocId);
                    }),
                  );
            })
          ])),
    );
  }
}