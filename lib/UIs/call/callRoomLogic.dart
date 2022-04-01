import 'package:convas/common/provider/friendProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/commonValues.dart';
import '../../daoFirebase/chatDetailsDaoFirebase.dart';
import '../../entityIsar/friendEntityIsar.dart';

Future<void> initializeProcess(WidgetRef ref, String friendUserDocId, String appointmentDocId) async {

  Friend friendData=  ref.watch(friendDataProvider).friendData[friendUserDocId]!;

  await insertChatDetailsDataMessage(
      ref:ref,
        chatHeaderDocId:friendData.chatHeaderId,
        friendUserDocId:friendUserDocId,
        message:enterRoomMessage,
        messageType:"1",
        referDocId: appointmentDocId,
        programId: "callRoom");
}
