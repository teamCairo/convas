import 'dart:core';
import 'dart:io';
import 'dart:math';

import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../../daoIsar/categoryDaoIsar.dart';
import '../../entityIsar/categoryEntityIsar.dart';
import '../commonValues.dart';
import '../provider/userProvider.dart';

Future<void> closeStreams(WidgetRef ref) async {
  // ref.read(categoryDataProvider.notifier).closeStream();
  // ref.read(topicDataProvider.notifier).closeStream();
  ref.read(userDataProvider.notifier).closeStream();
  // ref.read(friendDataProvider.notifier).closeStream();
  // ref.read(chatMessagesDataProvider.notifier).closeStream();
  //TODO 編集必要
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

List<String> fromTextToList(String txt) {
  String workText = txt;
  List<String> outputList = [];
if(txt==""){
  return outputList;
}
  for (; workText.contains(separatingCharacter);) {
    outputList.add(workText.substring(0, workText.indexOf(separatingCharacter)));
    workText = workText.substring(workText.indexOf(separatingCharacter) + separatingCharacter.length);
  }
  outputList.add(workText);

  return outputList;
}

String fromListToTextDot(List<String> codeList){
  String result ="";
  for(int i=0;i<codeList.length;i++){
    if(i!=0){
      result=result+separatingCharacter;
    }
    result=result+codeList[i];
  }

  return result;
}

Future<List<String>> categoryNameListfromText(String text) async{
  List<String> categoriesCodeList= fromTextToList(text);
  List<String> categoriesNameList=[];
  if(categoriesCodeList.isEmpty){
    return categoriesNameList;
  }
  for(int i =0;i<categoriesCodeList.length;i++){
    Category? cate =await selectIsarCategoryById(categoriesCodeList[i]);
    categoriesNameList.add(cate!.categoryName);

  }
return categoriesNameList;

}

String fromCodeListToTextDot(List<String> codeList,masterName,WidgetRef ref){
  String result ="";
  for(int i=0;i<codeList.length;i++){
    if(i!=0){
      result=result+separatingCharacter;
    }
    result=result+getMasterName(masterName, codeList[i], ref);
  }

  return result;
}

Future<File> urlToFile(String imageUrl) async {
// generate random number.
  var rng = Random();
// get temporary directory of device.
  Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
  String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
  File file = File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// call http.get method and pass imageUrl into it to get response.
  http.Response response = await http.get( Uri.parse(imageUrl));
// write bodyBytes received in response to file.
  await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
  //TODO　キャッシュはちゃんと削除するような処理方式に変更？→このメソッドから返った後もファイル使っている？ログイン時などに一括処理？
  return file;
}

String fromDateToYearMonthDayText(DateTime datetime){

  return
    datetime.year.toString() +
        "/" +
        ("00"+datetime.month.toString()).substring(datetime.month.toString().length) +
        "/" +
        ("00"+datetime.day.toString()).substring(datetime.day.toString().length);

}


String fromDateToHourMinuteText(DateTime datetime){

  return
    ("00"+datetime.hour.toString()).substring(datetime.hour.toString().length) +
        ":" +
        ("00"+datetime.minute.toString()).substring(datetime.minute.toString().length);

}

String lastLoginInfo(bool onlineStatus,int lastLoginTime){

  if(onlineStatus){
    return "Online";
  }
  int differentDays = DateTime.now()
      .difference(DateTime.fromMillisecondsSinceEpoch(lastLoginTime))
      .inDays;
  if (differentDays == 0) {
    return "Today";
  } else if (differentDays == 1) {
    return  "Yesterday";
  } else if(differentDays<7){
    return  differentDays.toString() + " days ago";
  }else{
    return DateTime.fromMillisecondsSinceEpoch(lastLoginTime).month.toString()+"/"+DateTime.fromMillisecondsSinceEpoch(lastLoginTime).day.toString();
  }

}