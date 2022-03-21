import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conceptProvider = ChangeNotifierProvider(
      (ref) => ConceptNotifier(),
);
class ConceptNotifier extends ChangeNotifier {

  int _activeIndex =0;
  get activeIndex => _activeIndex;

  setActiveIndex(int index){
    _activeIndex=index;
    notifyListeners();
  }

}

