import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'daoFirebase/friendDaoFirebase.dart';

Future<void> insertFriend(WidgetRef ref,String friendUserDocId) async{
  await insertFriendsData(ref, friendUserDocId, "friendProfile");
}