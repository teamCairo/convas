import 'package:convas/searchUsersConditionEditNumberDialogProvider.dart';
import 'package:convas/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'calendarEditProvider.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonTextUI.dart';

class SearchUsersConditionEditNumberDialog extends ConsumerWidget {
  String displayedItem;
  String databaseItem;
  String value;
  SearchUsersConditionEditNumberDialog({
    Key? key,
    required this.displayedItem,
    required this.databaseItem,
    required this.value,}) : super(key: key);

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
                      closeButtonForModal(context),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: black20TextCenter("Age"),
                      ),
                      RangeSlider(
                        labels: RangeLabels(ref.watch(searchUsersConditionEditNumberDialogProvider).start, ref.watch(searchUsersConditionEditNumberDialogProvider).end),
                        values: ref.watch(searchUsersConditionEditNumberDialogProvider).rangeValues,
                        min: ref.watch(searchUsersConditionEditNumberDialogProvider).min,
                        max: ref.watch(searchUsersConditionEditNumberDialogProvider).max,
                        divisions: 1,
                        onChanged: (values) {
                          ref.read(searchUsersConditionEditNumberDialogProvider.notifier).setRangeValues(values);
                        },
                      ),

                      Row(
                        children: [

                          roundButtonByWidthAndHeight(text: 'Cancel',
                              height: 50,
                              color: Colors.black26,
                              width: 70,
                              onPressed: () {
                                Navigator.pop(context);

                              }),

                          roundButtonByWidthAndHeight(text: 'OK',
                              height: 50,
                              color: Colors.orange,
                              width: 70,
                              onPressed: () {
                            ref.read(searchUsersProvider.notifier).setCondition(ref, databaseItem,ref.watch(searchUsersConditionEditNumberDialogProvider).rangeValues.start.toString()
                            +", "
                            +ref.watch(searchUsersConditionEditNumberDialogProvider).rangeValues.end.toString());
                            Navigator.pop(context);

                          }),

                        ],
                      )

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