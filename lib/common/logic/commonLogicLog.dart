import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';


Future<void> addLog(String column1,String column2,String column3,String column4, String column5,
    String column6,String column7,String column8, String column9,) async{

  final logDirectory = await getApplicationDocumentsDirectory();
  String logPath = '${logDirectory.path}/log.txt';
  File textFilePath = File(logPath);

  await textFilePath.writeAsString(DateFormat('yyyy-MM-dd(E) hh:mm:ss').format(DateTime.now()),mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column1,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column2,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column3,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column4,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column5,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column6,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column7,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column8,mode:FileMode.append);
  await textFilePath.writeAsString(", ",mode:FileMode.append);
  await textFilePath.writeAsString(column9,mode:FileMode.append);
  await textFilePath.writeAsString("\n",mode:FileMode.append);

}


Future<void> commonLogAddDBProcess({
    required String databaseName,
    required String entityName,
    required String crudType,
    required String columnName1,
    required String columnValue1,
    String? columnName2,
    String? columnValue2,
    String? columnName3,
    String? columnValue3}) async{
  addLog(databaseName+" access",
      entityName,
      crudType,
      columnName1,
      columnValue1,
      columnName2??"",
      columnValue2??"",
      columnName3??"",
      columnValue3??""
  );
}

Future<void> commonLogAddUserOperation({
  required String screenName,
  required String operatedWidget,
  required String operateType,
  String? optionString1,
  String? optionString2}) async {
  addLog(
      "user operation",
      screenName,
      operatedWidget+" "+operateType,
      optionString1??"",
      optionString2??"",
      "",
      "",
      "",
      ""
  );
}


Future<void> commonLogAddOthers({
  required String processName,
  required String processDescription,
  required String moduleName,
  String? optionString1,
  String? optionString2,
  String? optionString3}) async {
  addLog(
      processName,
      processDescription,
      moduleName,
      optionString1??"",
      optionString2??"",
      optionString3??"",
      "",
      "",
      ""
  );
}