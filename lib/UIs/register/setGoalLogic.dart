import 'package:convas/UIs/register/registerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

selectDate(BuildContext context,WidgetRef ref) async {
  // 1年前から1年後の範囲でカレンダーから日付を選択します。
  DateTime? selectedDate = await showMonthPicker(
    context: context,
    initialDate: ref.watch(registerProvider).goalDeadline!,
    firstDate: DateTime(DateTime.now().year - 1),
    lastDate: DateTime(DateTime.now().year + 1),
  );

  // 選択がキャンセルされた場合はNULL
  if (selectedDate == null) return;

  ref.read(registerProvider.notifier).setGoalDeadline(selectedDate);

}