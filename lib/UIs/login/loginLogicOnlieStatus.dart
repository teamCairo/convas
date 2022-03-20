import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/provider/userProvider.dart';
import '../../config/realtime_database_service.dart';

Future<void> updateOnlineStatus(WidgetRef ref,String userDocId)async{

  final RealtimeDatabaseService _realtimeDatabaseService=ref.watch(realtimeDatabaseServiceProvider);
  await _realtimeDatabaseService
      .updateUserPresence(userDocId);

}