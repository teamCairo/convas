import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';


Future<void> addLog(String column1,String column2,String column3,String column4, String column5,
    String column6,String column7,String column8, String column9,) async{

  final logDirectory = await getApplicationDocumentsDirectory();
  String logPath = '${logDirectory.path}/logfile.txt';
  File textFilePath = File(logPath);
  String logStr=DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())+
      ", "+column1+
      ", "+column2+
      ", "+column3+
      ", "+column4+
      ", "+column5+
      ", "+column6+
      ", "+column7+
      ", "+column8+
      ", "+column9+
      "  \n";


  await textFilePath.writeAsString(logStr,mode:FileMode.append);

}


Future<void> commonLogAddDBProcess({
    required String databaseName,
    required String entityName,
    required String crudType,
    required String methodName,
    required String columnName1,
    required String columnValue1,
    String? columnName2,
    String? columnValue2,
    String? optionString}) async{
  addLog(databaseName+" access",
      entityName,
      crudType,
      columnName1,
      columnValue1,
      columnName2??"",
      columnValue2??"",
      methodName,
      optionString??""
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