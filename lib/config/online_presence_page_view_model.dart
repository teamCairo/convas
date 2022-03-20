import 'package:convas/config/realtime_database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/userProvider.dart';

final onlinePresencePageViewModelProvider =
Provider<OnlinePresencePageViewModel>((ref) {
  return OnlinePresencePageViewModel(
      ref.watch(realtimeDatabaseServiceProvider)
  );
});

class OnlinePresencePageViewModel {
  OnlinePresencePageViewModel(this._realtimeDatabaseService);
  final RealtimeDatabaseService _realtimeDatabaseService;

  Future<void> updateUserPresence(WidgetRef ref) async {
    await _realtimeDatabaseService
        .updateUserPresence(ref.watch(userDataProvider).userData["userDocId"]);
  }
}
