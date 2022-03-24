
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appointRequestProvider = ChangeNotifierProvider(
      (ref) => AppointRequestNotifier(),
);
class AppointRequestNotifier extends ChangeNotifier {

  String _courseCodeListText = "";
  String get courseCodeListText => _courseCodeListText;

  String _requestDescription = "";
  String get requestDescription => _requestDescription;

  void initialize(WidgetRef ref){
    //修正モードのときは、もとのデータを取得

  }

  void setRequestDescription(String inputValue){
    _requestDescription=inputValue;

  }


}