import 'package:convas/UIs/register/registerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<Null> selectDateForBirthDate(BuildContext context,WidgetRef ref) async {
  DateTime initialDate;
  if(ref.watch(registerProvider).birthDate==null){
    initialDate=DateTime.now().add(const Duration(days: -3650));
  }else{
    initialDate=ref.watch(registerProvider).birthDate!;
  }
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now().add(const Duration(days:-30000)),
      lastDate: DateTime.now().add(const Duration(days: -3650))
  );
  if(picked != null){
    ref.read(registerProvider.notifier).setBirthDate(picked);
  };
}