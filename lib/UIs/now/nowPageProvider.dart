import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entityIsar/eventEntityIsar.dart';

final nowPageProvider = ChangeNotifierProvider(
      (ref) => NowPageNotifier(),
);
class NowPageNotifier extends ChangeNotifier {


  List<Event> _eventList =[];
  get eventList => _eventList;


  void initializeEditedEvent(DateTime selectedDateTime){

  }
}

