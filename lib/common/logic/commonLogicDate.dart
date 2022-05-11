import 'dart:core';

import "package:intl/intl.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/chatDetailProvider.dart';
import '../provider/eventProvider.dart';
import '../provider/friendProvider.dart';
import '../provider/userProvider.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> closeStreams(WidgetRef ref) async {
  ref.read(userDataProvider.notifier).closeStream();
  ref.read(friendDataProvider.notifier).closeStream();
  ref.read(eventDataProvider.notifier).closeStream();
  ref.read(chatDetailDataProvider.notifier).closeStream();
  //TODO 編集必要
}

String commonLogicDurationText(DateTime? from, DateTime? to){
  String fromStr="";
  String toStr="";
  if (from == null||to==null) {
    return "";
  } else {

    initializeDateFormatting("ja_JP");
    fromStr= DateFormat('yyyy/MM/dd HH:mm', "ja_JP").format(from);

    if(DateTime(from.year,from.month,from.day)==DateTime(to.year,to.month,to.day)){
      toStr= DateFormat('HH:mm', "ja_JP").format(to);
  }else{
      toStr= DateFormat('MM/dd HH:mm', "ja_JP").format(to);
    }

    return fromStr+" ～ "+toStr;
  }

}

int commonLogicFromBirthMillisecondsToAge(int birthDateMilliSeconds){

  return commonLogicFromBirthToAge(DateTime.fromMillisecondsSinceEpoch(birthDateMilliSeconds));

}

int commonLogicFromBirthToAge(DateTime birthDate){

  if(DateTime(DateTime.now().year,birthDate.month,birthDate.day).isAfter(DateTime.now())){
    return DateTime.now().year-birthDate.year-1;
  }else{
    return DateTime.now().year-birthDate.year;
  }
}

DateTime birthDateMaxFromAge(int age){
  return DateTime(DateTime.now().year-age,DateTime.now().month,DateTime.now().day);

}

DateTime birthDateMinFromAge (int age){
  return DateTime(DateTime.now().year-age-1,DateTime.now().month,DateTime.now().day).add(const Duration(days:1));

}


String fromDateToYearMonthDayText(DateTime datetime){

  return
    datetime.year.toString() +
        "/" +
        ("00"+datetime.month.toString()).substring(datetime.month.toString().length) +
        "/" +
        ("00"+datetime.day.toString()).substring(datetime.day.toString().length);

}

String fromDateToMonthDayText(DateTime datetime){

  return
    datetime.month.toString() +
        "/" +datetime.day.toString();

}

String fromDateToYearMonthDayHourMin(DateTime? time) {
  if (time == null) {
    return "";
  } else {
    initializeDateFormatting("ja_JP");

    var formatter = DateFormat('yyyy/MM/dd HH:mm', "ja_JP");
    var formatted = formatter.format(time); // DateからString
    return formatted;
  }
}



String fromDateToHourMinuteText(DateTime datetime){

  return
    ("00"+datetime.hour.toString()).substring(datetime.hour.toString().length) +
        ":" +
        ("00"+datetime.minute.toString()).substring(datetime.minute.toString().length);

}

String fromLastTimeToText(DateTime lastMessageTime){
  DateTime today =DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  DateTime lastDay =DateTime(lastMessageTime.year,lastMessageTime.month,lastMessageTime.day);
  if(today==lastDay){
    return fromDateToHourMinuteText(lastMessageTime);
  }else{
    return fromDateToMonthDayText(lastMessageTime);
  }
  String todayStr=DateFormat('MM/dd', "ja_JP").format(DateTime.now());

}