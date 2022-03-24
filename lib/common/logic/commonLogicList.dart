
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commonValues.dart';
import '../provider/masterProvider.dart';

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

String masterNameTextFromCodeText(String codeText,String masterGroupCode,WidgetRef ref){
  return fromListToTextDot(masterNameListFromText(codeText,masterGroupCode, ref));
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

List<String> masterNameListFromText(String text,String masterGroupCode,WidgetRef ref){
  List<String> coursesCodeList= fromTextToList(text);
  List<String> coursesNameList=[];
  if(coursesCodeList.isEmpty){
    return coursesNameList;
  }
  for(int i =0;i<coursesCodeList.length;i++){
    coursesNameList.add(getMasterData(masterGroupCode, coursesCodeList[i], ref).name);
  }
  return coursesNameList;

}


String fromCodeListToTextDot(List<String> codeList,masterName,WidgetRef ref){
  String result ="";
  for(int i=0;i<codeList.length;i++){
    if(i!=0){
      result=result+separatingCharacter;
    }
    result=result+getMasterData(masterName, codeList[i], ref).name;
  }

  return result;
}