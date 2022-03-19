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
          appBar: commonAppbarTransparent("Friend Profile"),
          body: const Center(child: CircularProgressIndicator()));

    } else {


      return Scaffold(
          appBar: commonAppbarTransparent("Friend Profile"),
          body: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                          colors: [
                            const Color(0xffe4a972).withOpacity(0.6),
                            const Color(0xff9941d8).withOpacity(0.6),
                          ],
                          stops: const [
                            0.0,
                            1.0,
                          ],
                        ),
                      ),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:30.0),
                          child: Center(
                            child: imageAvatar(
                                radius: 110,
                                image: ref
                                    .watch(friendProfileDataProvider)
                                    .friendProfilePhotoData),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(style:BorderStyle.none),
                          borderRadius:const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:14.0,vertical:14),
                            child: Column(
                              children: [
                                SizedBox(
                                    width:double.infinity,
                                    child: commonText22DeepOrangeLeftBold(ref.watch(friendProfileDataProvider).friendProfileData["name"]),),
                                    loginLampSmall(ref.watch(friendProfileDataProvider).friendProfileData["lastLoginTime"],
                                        ref.watch(friendProfileDataProvider).friendProfileData["onlineStatus"],true),
                                commonLineHorizontalGrayThin(10,2),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: black16TextLeft("Greeting")),
                                 Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(ref.watch(friendProfileDataProvider).friendProfileData["greeting"],
                                        overflow: TextOverflow.ellipsis,
                                        style:const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          color: Colors.black54,),
                                      )),
                                commonLineHorizontalGrayThin(10,2),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: black16TextLeft("Categories")),
                                commonWrapMultiLineOrangeBorderRoundList(
                                  categoryNameListFromText(ref.watch(friendProfileDataProvider).friendProfileData["interestingCategories"], ref)
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: black16TextLeft("Courses")),
                                commonWrapMultiLineOrangeBorderRoundList(
                                    categoryNameListFromText(ref.watch(friendProfileDataProvider).friendProfileData["interestingCourses"], ref)
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top:12,bottom: 8),
                                    child: commonText16BlackLeft("Self-Introduction")),
                                 Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(ref.watch(friendProfileDataProvider).friendProfileData["description"],
                                        overflow: TextOverflow.ellipsis,
                                        style:const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          color: Colors.black54,),

                                      )),
                                commonLineHorizontalGrayThin(10,2),
                                Padding(
                                    padding: const EdgeInsets.only(top:12,bottom: 8),
                                    child: commonText16BlackLeft("Personal Info")),
                                linePadding(ref,"Name","name"),
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
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )),
              ),
            ),
            commonButtonSingleFooter(
                  onPressed: () async {
                    if(!ref.watch(friendProfileDataProvider).friendProfileData["friendFlg"]){
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
      displayedValue =getMasterName( databaseItem, value,  ref).name;

    }else if(databaseItem == "motherTongue" ){
      displayedValue =getMasterName( "language", value,  ref).name;

    }else if(databaseItem == "country"||databaseItem == "homeCountry" ){
      displayedValue =getMasterName( "country", value,  ref).name;

    }else if(databaseItem == "birthDate" ){
      displayedValue =fromBirthToAge(value).toString();

    } else {
      displayedValue = value;
    }
    return Padding(
        padding: const EdgeInsets.only(bottom:6),
        child: SizedBox(
          height: 42,
          child: Column(
              mainAxisAlignment:MainAxisAlignment.start
              ,children: [
            SizedBox(
              width: double.infinity,
                child: commonText12DeepOrangeLeft(displayedItem)
            ),
            commonText16GrayLeft(displayedValue),
          ])
        ));
  }
}
