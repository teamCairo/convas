import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/provider/friendProvider.dart';
import '../../daoFirebase/usersDaoFirebase.dart';
import '../../faoFirebaseStorage/usersPhotoFaoFirebase.dart';

final friendProfileDataProvider = ChangeNotifierProvider(
      (ref) => FriendProfileDataNotifier(),
);

class FriendProfileDataNotifier extends ChangeNotifier {
  Map<String, dynamic> _friendProfileData = {};
  get friendProfileData => _friendProfileData;

  Image? _friendProfilePhotoData;
  get friendProfilePhotoData => _friendProfilePhotoData;

  bool _processingFlg=true;
  get processingFlg => _processingFlg;

  void clearFriendProfileData() async {
    _friendProfileData = {};
    _friendProfilePhotoData=null;
    _processingFlg=true;
  }

  Future<void> readFriendProfilePhotoDataFromFirebaseToMemory(WidgetRef ref,String userDocId,String profilePhotoNameSuffix) async {
    _friendProfilePhotoData = await getUsersBigPhoto(userDocId, profilePhotoNameSuffix);
  }


  Future<void> readFriendProfileDataFromFirebase(WidgetRef ref,String friendUserDocId)async {
    _friendProfileData = await selectFirebaseMapUserByUserDocId(friendUserDocId);

    if(ref.watch(friendDataProvider).friendData[friendUserDocId]==null){
      _friendProfileData["friendFlg"] = false;
    }else{
      _friendProfileData["friendFlg"] = true;
    }
    await readFriendProfilePhotoDataFromFirebaseToMemory(ref,friendUserDocId,_friendProfileData["profilePhotoNameSuffix"]);
    _processingFlg=false;
    notifyListeners();

  }

}

