import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectPointsDialogProvider = ChangeNotifierProvider(
      (ref) => SelectPointsDialogNotifier(),
);
class SelectPointsDialogNotifier extends ChangeNotifier {
  double _maxPoints=0;
  double _minPoints=0;
  double _chosenPoints=0;
  double get chosenPoints=>_chosenPoints;
  double get maxPoints=>_maxPoints;
  double get minPoints=>_minPoints;

  void initialize(double min, double max) async {
    _minPoints=min;
    _maxPoints=max;
    _chosenPoints=max;
  }

  void setPoints(double chosenPoints){
    _chosenPoints=chosenPoints;
    notifyListeners();
  }

}