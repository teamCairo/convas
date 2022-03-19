import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../daoFirebase/friendsDaoFirebase.dart';

Future<void> insertFriend(WidgetRef ref,String friendUserDocId) async{
  await insertFriendsData(ref, friendUserDocId, "friendProfile");
}