import 'dart:core';

import "package:intl/intl.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/eventProvider.dart';
import '../provider/friendProvider.dart';
import '../provider/userProvider.dart';

Future<void> closeStreams(WidgetRef ref) async {
  // ref.read(topicDataProvider.notifier).closeStream();
  ref.read(userDataProvider.notifier).closeStream();
  ref.read(friendDataProvider.notifier).closeStream();
  ref.read(eventDataProvider.notifier).closeStream();
  // ref.read(chatMessagesDataProvider.notifier).closeStream();
  //TODO 編集必要
}

int fromBirthMillisecondsToAge(int birthDateMilliSeconds){

  return fromBirthToAge(DateTime.fromMillisecondsSinceEpoch(birthDateMilliSeconds));

}

int fromBirthToAge(DateTime birthDate){

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

String fromDateToYearMonthText(DateTime datetime){

  return
    datetime.year.toString() +
        "/" +
        ("00"+datetime.month.toString()).substring(datetime.month.toString().length);

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
    return fromDateToYearMonthText(lastMessageTime);
  }
  String todayStr=DateFormat('MM/dd', "ja_JP").format(DateTime.now());

}