import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<void> closeStreams(WidgetRef ref) async {
  // ref.read(categoryDataProvider.notifier).closeStream();
  // ref.read(topicDataProvider.notifier).closeStream();
  // ref.read(userDataProvider.notifier).closeStream();
  // ref.read(friendDataProvider.notifier).closeStream();
  // ref.read(chatMessagesDataProvider.notifier).closeStream();
  //TODO 編集必要
}


List<String> fromTextToList(String txt) {
  String workText = txt;
  List<String> outputList = [];

  for (; workText.contains(',');) {
    outputList.add(workText.substring(0, workText.indexOf(',')));
    workText = workText.substring(workText.indexOf(',') + 1);
  }
  outputList.add(workText);

  return outputList;
}

Future<File> urlToFile(String imageUrl) async {
// generate random number.
  var rng = new Random();
// get temporary directory of device.
  Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
  String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
  File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
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
