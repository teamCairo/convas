import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SettingEditRadioPageProviderNotifier extends ChangeNotifier {
  String _onRadioGroupValue = "";

  get onRadioGroupValue => _onRadioGroupValue;
  void initialize(String value) {
    _onRadioGroupValue = value;
  }

  void setOnRadioGroupValue(String value) {
    _onRadioGroupValue = value;
    notifyListeners();
  }
}

final settingEditRadioPageProvider = ChangeNotifierProvider(
      (ref) => SettingEditRadioPageProviderNotifier(),
);
