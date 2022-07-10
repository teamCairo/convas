import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoFirebase/openRoomDaoFirebase.dart';

final createOpenRoomProvider = ChangeNotifierProvider(
      (ref) => CreateOpenRoomNotifier(),
);

class CreateOpenRoomNotifier extends ChangeNotifier {
  String _description = "";
  String _roomName = "";
  DateTime? _endDateTime;

  String get description => _description;
  String get roomName => _roomName;
  DateTime? get endDateTime => _endDateTime;

  void initialize(){
    _description="";
    _roomName = "";
    _endDateTime = null;
  }
  void resetScreen(){
    notifyListeners();
  }

  void setDescription(String value){
    _description=value;
  }

  void setEndDateTime(DateTime? value){
    _endDateTime=value;
    notifyListeners();
  }

  void setRoomName(String value){
    _roomName=value;
  }
  Future<void> insertOpenRoomData(WidgetRef ref)async{
    await insertOpenRoom(
        ref: ref,
        roomName: _roomName,
        categoryDocId: "",
        topicDocId: "",
        description: _description,
        endDateTime: _endDateTime,
        programId: "createOpenRoom");
  }
}