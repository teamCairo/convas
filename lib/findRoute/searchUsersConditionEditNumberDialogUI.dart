import 'package:convas/findRoute/searchUsersConditionEditNumberDialogProvider.dart';
import 'package:convas/findRoute/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/UI/commonButtonUI.dart';
import '../common/UI/commonTextUI.dart';

class SearchUsersConditionEditNumberDialog extends ConsumerWidget {
  String displayedItem;
  String databaseItem;
  String value;
  SearchUsersConditionEditNumberDialog({
    Key? key,
    required this.displayedItem,
    required this.databaseItem,
    required this.value,}) : super(key: key);

  bool initialProcessFlg=true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _dialogWidth = MediaQuery.of(context).size.width * 3 / 4; // 画面サイズから相対的に大きさを決めている。



    if(initialProcessFlg){

      initialProcessFlg=false;
      ref.read(searchUsersConditionEditNumberDialogProvider.notifier).initialize(ref, databaseItem, value);

    }return Dialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // SizedBoxでダイアログそのものの大きさをまずは決めています。
      child: SizedBox(
        width: _dialogWidth,
        height: _dialogWidth,
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
                          Padding(
                            padding: const EdgeInsets.only(right: 14.0,left:14,bottom:35,top:10),
                            child: commonText20BlackCenter("Age"),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SliderTheme(
                                  data: const SliderThemeData(
                                      valueIndicatorColor:Colors.white10,
                            ),
                                  child: RangeSlider(
                                    labels: RangeLabels(ref.watch(searchUsersConditionEditNumberDialogProvider).start.toString(), ref.watch(searchUsersConditionEditNumberDialogProvider).end.toString()),
                                    values: ref.watch(searchUsersConditionEditNumberDialogProvider).rangeValues,
                                    min: ref.watch(searchUsersConditionEditNumberDialogProvider).min.toDouble(),
                                    max: ref.watch(searchUsersConditionEditNumberDialogProvider).max.toDouble(),
                                    divisions: (ref.watch(searchUsersConditionEditNumberDialogProvider).max.toDouble()-ref.watch(searchUsersConditionEditNumberDialogProvider).min.toDouble()).toInt(),
                                    onChanged: (values) {
                                      ref.read(searchUsersConditionEditNumberDialogProvider.notifier).setRangeValues(values);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      commonText16DeepOrangeLeft(ref.watch(searchUsersConditionEditNumberDialogProvider).start.toString()),
                                      commonText16DeepOrangeRight(ref.watch(searchUsersConditionEditNumberDialogProvider).end.toString())
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          commonButtonRoundByWidthAndHeight(text: 'Cancel',
                              height: 40,
                              color: Colors.black26,
                              width: 90,
                              onPressed: () {
                                Navigator.pop(context);

                              }),

                          commonButtonRoundByWidthAndHeight(text: 'OK',
                              height: 40,
                              color: Colors.orange,
                              width: 90,
                              onPressed: () {
                            ref.read(searchUsersProvider.notifier).setCondition(ref, databaseItem,ref.watch(searchUsersConditionEditNumberDialogProvider).rangeValues.start.toInt().toString()
                            +", "
                            +ref.watch(searchUsersConditionEditNumberDialogProvider).rangeValues.end.toInt().toString());
                            Navigator.pop(context);

                          }),

                        ],
                      )

                    ],

            ),
          ),
        ),
      ),
    );
  }
}