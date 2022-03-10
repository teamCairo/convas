import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUsersConditionEditTypeNotifier extends ChangeNotifier {
  Map<String, String> _masterMap = {};
  get masterMap => _masterMap;

  Map<String, bool> _masterBoolMap = {};
  get masterBoolMap => _masterBoolMap;

  void initialize(
      WidgetRef ref, String databaseItem, String value) async {
    _masterBoolMap = {};

    switch (databaseItem) {
      case "searchConditionLevel":
        _masterMap = getMasterMap("level", ref);
        break;
      case "searchConditionMotherTongue":
        _masterMap = getMasterMap("language", ref);
        break;
      case "searchConditionCountry":
        _masterMap = getMasterMap("country", ref);
        break;
      case "searchConditionGender":
        _masterMap = getMasterMap("gender", ref);
        break;
    }

    if (_masterMap.isEmpty) {
    } else {
      _masterMap.forEach((key, value) {
        if (value.contains(key)) {
          _masterBoolMap[key] = true;
        } else {
          _masterBoolMap[key] = false;
        }
      });
    }

    notifyListeners();
  }

  void setBool(String key, bool value) {
    _masterBoolMap[key] = !value;
    notifyListeners();
  }
}

final searchUsersConditionEditTypeProvider =
    ChangeNotifierProvider((ref) => SearchUsersConditionEditTypeNotifier());
