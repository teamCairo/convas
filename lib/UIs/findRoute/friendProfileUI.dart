import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../common/provider/masterProvider.dart';
import 'friendProfileLogic.dart';
import 'friendProfileProvider.dart';

class FriendProfile extends ConsumerWidget {
  const FriendProfile({
    required this.argumentFriendUserDocId,
    Key? key,
  }) : super(key: key);
  final String argumentFriendUserDocId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(friendProfileDataProvider).processingFlg) {
      return Scaffold(
          appBar: commonAppbar("Profile"),
          body: const Center(child: CircularProgressIndicator()));
    } else {
      return Scaffold(
          appBar: commonAppbar("Profile"),
          body: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: SafeArea(
                    child: Container(
                  decoration: BoxDecoration(
                    gradient: commonGetLinearGradientTeacher(ref
                        .watch(friendProfileDataProvider)
                        .friendProfileData["userType"]),
                  ),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          commonCircleAvatarImage(
                              radius: 110,
                              image: ref
                                  .watch(friendProfileDataProvider)
                                  .friendProfilePhotoData,
                              name: ref
                                  .watch(friendProfileDataProvider)
                                  .friendProfileData["name"]),
                          // Container(
                          //   height: 220,
                          //   width: 50,
                          //   child: Column(children: [
                          //     const SizedBox(height: 22),
                          //     Icon(
                          //         commonGenderIcon(ref
                          //             .watch(friendProfileDataProvider)
                          //             .friendProfileData["gender"]),
                          //         size: 20),
                          //     IconButton(
                          //         onPressed: () {},
                          //         icon: const Icon(Icons.star_border))
                          //   ]),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(25),
                          //     color: Colors.white,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(style: BorderStyle.none),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          commonVerticalGap(),
                          Row(
                            children: [
                              commonHorizontalGap(),
                              commonText22SecondaryColorLeftBold(ref
                                  .watch(friendProfileDataProvider)
                                  .friendProfileData["name"]),
                              const SizedBox(width: 8),
                              commonText16GrayLeft(fromBirthToAge(ref
                                      .watch(friendProfileDataProvider)
                                      .friendProfileData["birthDate"])
                                  .toString()),
                              const SizedBox(width: 8),
                              Icon(
                                  commonGenderIcon(ref
                                      .watch(friendProfileDataProvider)
                                      .friendProfileData["gender"]),
                                  size: 18)
                            ],
                          ),
                          Row(
                            children: [
                              commonHorizontalGap(),
                              loginLampSmall(
                                  ref
                                      .watch(friendProfileDataProvider)
                                      .friendProfileData["lastLoginTime"],
                                  ref
                                      .watch(friendProfileDataProvider)
                                      .friendProfileData["onlineStatus"],
                                  true),
                            ],
                          ),
                          ref
                              .watch(friendProfileDataProvider)
                              .friendProfileData["userType"]=="2"?Column(
                            children: [
                              commonLineHorizontalGrayThin(16, 16),
                              Row(
                                children: [
                                  commonHorizontalGap(),
                                  commonText16BlackLeft("Self introduction"),
                                ],
                              ),
                              commonVerticalGap(),
                              Row(
                                children: [
                                  commonHorizontalGap(),
                                  Flexible(
                                    child: Text(
                                      ref
                                          .watch(friendProfileDataProvider)
                                          .friendProfileData["description"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ):Container(),
                          commonLineHorizontalGrayThin(16, 16),
                          Row(
                            children: [
                              commonHorizontalGap(),
                              commonText16BlackLeft("Personal Info"),
                            ],
                          ),
                          commonVerticalGap(),
                          linePadding(ref, "Name", "name"),
                          linePadding(ref, "Gender", "gender"),
                          linePadding(ref, "Age", "birthDate"),
                          ref
                              .watch(friendProfileDataProvider)
                              .friendProfileData["userType"]=="1"?linePadding(ref, "English Level", "level"):Container(),
                          ref
                              .watch(friendProfileDataProvider)
                              .friendProfileData["userType"]=="2"?Column(
                            children: [
                              linePadding(ref, "Occupation", "occupation"),
                              linePadding(ref, "Mother Tongue", "motherTongue"),
                              linePadding(ref, "Country", "country"),
                              linePadding(ref, "Town", "town"),
                              linePadding(ref, "Home Country", "homeCountry"),
                              linePadding(ref, "Home Town", "homeTown"),
                            ],
                          ):Container(),
                        ],
                      ),
                    ),
                  ]),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: commonButtonOrangeRound(
                onPressed: () async {
                  await insertFriendAndMoveToChatPage(
                      ref, context, argumentFriendUserDocId);
                },
                text: ref
                        .watch(friendProfileDataProvider)
                        .friendProfileData["friendFlg"]
                    ? "Talk"
                    : "Send message",
              ),
            )
          ]));
    }
  }

  Widget linePadding(WidgetRef ref, String displayedItem, String databaseItem) {
    dynamic value =
        ref.watch(friendProfileDataProvider).friendProfileData[databaseItem];
    String displayedValue;
    if (databaseItem == "gender" || databaseItem == "level") {
      displayedValue = getMasterData(databaseItem, value, ref).name;
    } else if (databaseItem == "motherTongue") {
      displayedValue = getMasterData("language", value, ref).name;
    } else if (databaseItem == "country" || databaseItem == "homeCountry") {
      displayedValue = getMasterData("country", value, ref).name;
    } else if (databaseItem == "birthDate") {
      displayedValue = fromBirthToAge(value).toString();
    } else {
      displayedValue = value;
    }
    return Row(
      children: [
        commonHorizontalGap(),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText12SecondaryColorLeft(displayedItem),
              commonText16GrayLeft(displayedValue),
              commonVerticalGap()
            ]),
      ],
    );
  }
}
