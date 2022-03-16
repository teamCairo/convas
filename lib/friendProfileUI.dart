import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/logic/commonLogic.dart';
import 'common/provider/masterProvider.dart';
import 'friendProfileLogic.dart';
import 'friendProfileProvider.dart';

class FriendProfile extends ConsumerWidget {
  FriendProfile({
    required this.argumentFriendUserDocId,
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;
  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg) {
      initialProcessFlg = false;
      ref.read(friendProfileDataProvider.notifier).clearFriendProfileData();
      ref.read(friendProfileDataProvider.notifier).readFriendProfileDataFromFirebase(ref, argumentFriendUserDocId);
    }

    if (ref.watch(friendProfileDataProvider).processingFlg){
      return Scaffold(
          appBar: whiteAppbar("Friend Profile"),
          body: const Center(child: CircularProgressIndicator()));

    } else {
      return Scaffold(
          appBar: whiteAppbar("Friend Profile"),
          body: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: SafeArea(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Center(
                          child: imageAvatar(
                              radius: 80,
                              image: ref
                                  .watch(friendProfileDataProvider)
                                  .friendProfilePhotoData),
                        ),
                      ),
                      linePadding(ref,"Name","name",),
                      linePadding(ref, "E-mail", "email"),
                      linePadding(ref, "Age", "birthDate"),
                      linePadding(ref, "English Level", "level"),
                      linePadding(ref, "Occupation", "occupation"),
                      linePadding(ref, "Mother Tongue", "motherTongue"),
                      linePadding(ref, "Country", "country"),
                      linePadding(ref, "Town", "town"),
                      linePadding(ref, "Home Country", "homeCountry"),
                      linePadding(ref, "Home Town", "homeTown"),
                      linePadding(ref, "Gender", "gender"),
                      linePadding(ref, "Place I wanna go", "placeWannaGo"),
                      linePadding(ref, "Greeting", "greeting"),
                      linePadding(ref, "Description", "description"),
                    ])),
              ),
            ),
            singleFooterButton(
                  onPressed: () async {
                    if(ref.watch(friendProfileDataProvider).friendProfileData["friendFlg"]){
                      await insertFriend(ref, argumentFriendUserDocId);
                    }
                    // await Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (context) {
                    //     return ChatPage(
                    //         friendUserDocId:argumentFriendUserDocId
                    //         ,friendUserName:ref.watch(friendProfileDataProvider).friendProfileData["name"]
                    //     );
                    //   }),
                    // );
                  },
                  text: ref.watch(friendProfileDataProvider).friendProfileData["friendFlg"]
                      ? "Talk":"add to Friends",
                )
          ]));
    }
  }

  Padding linePadding(WidgetRef ref, String displayedItem, String databaseItem) {
    dynamic value = ref.watch(friendProfileDataProvider).friendProfileData[databaseItem];
    String displayedValue;
    if (databaseItem == "gender" || databaseItem == "level"){
      displayedValue =getMasterName( databaseItem, value,  ref);

    }else if(databaseItem == "motherTongue" ){
      displayedValue =getMasterName( "language", value,  ref);

    }else if(databaseItem == "country"||databaseItem == "homeCountry" ){
      displayedValue =getMasterName( "country", value,  ref);

    }else if(databaseItem == "birthDate" ){
      displayedValue =fromBirthToAge(value).toString();

    } else {
      displayedValue = value;
    }
    return Padding(
        padding: const EdgeInsets.only(left:14,right:14,bottom:6),
        child: SizedBox(
          height: 52,
          child: Column(children: [
            SizedBox(
              width: double.infinity,
                child: deepOrange12TextLeft(displayedItem)
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gray16TextLeft(displayedValue),
            ]),
          ])
        ));
  }
}
