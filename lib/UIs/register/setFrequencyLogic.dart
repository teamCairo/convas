import 'package:convas/UIs/register/registerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool checkFrequency(WidgetRef ref) {

  int times = ref.watch(registerProvider).timesAWeek;
  if(times<1||7<times){
    return false;
  }
  return true;
}

Future<Null> selectDateForFrequencyUntil(BuildContext context,WidgetRef ref) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ref.watch(registerProvider).continualUntil!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 999))
  );
  if(picked != null){
    ref.read(registerProvider.notifier).setContinualUntil(picked);
  };
}