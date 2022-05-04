import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/UIs/register/learner/setGoalDetailUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';


import '../../../common/UI/commonButtonUI.dart';
import '../../../common/UI/commonPushUI.dart';
import 'optionFrequencySettingUI.dart';

class MakeMoreSpecific extends ConsumerWidget {
  const MakeMoreSpecific({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbar(""),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      commonText24BlackBoldCenter("Make your goal more specific!"),
                      const SizedBox(height:20),
                      commonText16Gray("Think you achieve the goal"),
                      const SizedBox(height:20)
                    ],
                  ),
                  // Column(
                  //   children: [
                  Column(
                    children: [
                      TextFormField(
                        maxLines: 4,
                        minLines: 1,
                        controller: TextEditingController(text:ref.watch(registerProvider).goal),
                        decoration: const InputDecoration(labelText: "Goal"),
                        onChanged: (String value) {
                          ref.read(registerProvider.notifier).setGoal(value);
                        },
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height:8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          commonIconButtonAddHashTagInfo(text: 'Due',
                              iconData: Icons.calendar_today_outlined,
                              color:Colors.cyan,
                              onPressed: () {
                                selectDate(context,ref);
                              }),
                          commonIconButtonAddHashTagInfo(text: 'Destination',
                              iconData: Icons.pin_drop,
                              color:Colors.amberAccent,
                              onPressed: () {  }),
                        ]
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: commonIconButtonSmallWhiteBorderRound(iconData: Icons.share_outlined, text: "Share", onPressed: (){})),
                    ],
                  ),
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:14),
                    child:commonButtonOrangeRound(
                      text: "OK",
                      onPressed: ()  {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const OptionFrequencySetting();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                            },
                          ),
                        );
                      },),)
                  //   ],
                  // ),
                ]),
          )),
    );
  }
}

Widget circleImageButton(String url,String goalCategoryName,WidgetRef ref, BuildContext context){
  return GestureDetector(
      onTap:(){
        ref.read(registerProvider.notifier).setGoalCategory(goalCategoryName);
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const SetGoalDetail();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
            },
          ),
        );

      },
      child:Column(
        children: [
          commonCircleAvatarImage(radius: 40,
              name: "",
              image:Image.network(url)),
          commonText16BlackCenter(goalCategoryName)
        ],
      ));
}
Widget boxImageButton(String url,String description,String goalCategoryName,WidgetRef ref, BuildContext context){
  return GestureDetector(
      onTap:(){
        ref.read(registerProvider.notifier).setGoalCategory(goalCategoryName);
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const SetGoalDetail();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
            },
          ),
        );

      },
      child:Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              SizedBox(
                height: 180.0,
                width:150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    )),),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0,left:10),
                  child: commonText16GrayLeft(description)),
            ],
          ),
          commonText16BlackCenter(goalCategoryName)
        ],
      ));
}

selectDate(BuildContext context,WidgetRef ref) async {
  // 1年前から1年後の範囲でカレンダーから日付を選択します。
  DateTime? selectedDate = await showMonthPicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 3),
  );

  // 選択がキャンセルされた場合はNULL
  if (selectedDate == null) return;

  DateFormat outputFormat = DateFormat('yyyy/MM');
  String dueStr = outputFormat.format(selectedDate);

  ref.read(registerProvider.notifier).setGoalHashTag("Due",dueStr);

}
