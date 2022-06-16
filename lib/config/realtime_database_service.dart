import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final realtimeDatabaseServiceProvider =
Provider<RealtimeDatabaseService>((ref) {
  return RealtimeDatabaseService();
});

class RealtimeDatabaseService {
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref();

  Future<void> updateUserPresence(String uid) async {

    await _databaseReference.child(uid).update({'presence': true});

    await _databaseReference
        .child(uid)
        .onDisconnect()
        .update({'presence': false});
  }
}
