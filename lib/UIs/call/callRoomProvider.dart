import 'package:convas/daoFirebase/appointmentsDaoFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/otherClass/commonClassAppointment.dart';
import '../../common/provider/friendProvider.dart';
import '../../entityIsar/friendEntityIsar.dart';

final callRoomProvider = ChangeNotifierProvider(
      (ref) => CallRoomNotifier(),
);

class CallRoomNotifier extends ChangeNotifier {

  Friend? _friendData;
  Friend? get friendData => _friendData;

  CommonAppointment? _appointmentData;
  CommonAppointment? get appointmentData => _appointmentData;

  Future<void> initialize(String friendUserDocId, String appointmentDocId, WidgetRef ref)async{

    _friendData=  ref.watch(friendDataProvider).friendData[friendUserDocId]!;
    _appointmentData= await selectFirebaseAppointmentByAppointmentDocId(appointmentDocId);

  }


}

