import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUsersConditionEditRadioNotifier extends ChangeNotifier {
  Map<String, String> _masterMap = {};
  get masterMap => _masterMap;
  String _onRadioGroupValue = "";

  get onRadioGroupValue => _onRadioGroupValue;
  void initializeRadioValue(String value) {
    _onRadioGroupValue = value;
  }

  void setOnRadioGroupValue(String value) {
    _onRadioGroupValue = value;
    notifyListeners();
  }

  void initialize(
      WidgetRef ref, String databaseItem, String inputValue) async {
    _masterMap = getMasterMap("lastLogin",ref);
    initializeRadioValue(inputValue);
    notifyListeners();
  }
}

final searchUsersConditionEditRadioProvider =
ChangeNotifierProvider((ref) => SearchUsersConditionEditRadioNotifier());
