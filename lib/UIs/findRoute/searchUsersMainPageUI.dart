import 'package:convas/UIs/findRoute/searchUsersConditionPageUI.dart';
import 'package:convas/UIs/findRoute/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/commonValues.dart';
import '../../common/logic/commonLogicDate.dart';
import '../../common/logic/commonLogicOthers.dart';
import '../../daoAlgolia/usersDaoAlgolia.dart';
import 'friendProfileRootUI.dart';

class SearchUsersMainPage extends ConsumerWidget {
  SearchUsersMainPage({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProcessFlg == true) {
      initialProcessFlg = false;
      ref.read(searchUsersProvider.notifier).readConditionsFromUserData(ref);
      ref.read(searchUsersProvider.notifier).setSearchProcessingFlgTrue();
      ref.read(searchUsersProvider.notifier).searchUsers(ref);
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 14, right: 14, bottom: 10),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: Row(children: [
                          Expanded(
                            child: commonButtonIconTextGrayWide(
                                onPressed: () async {
                                  commonNavigatorPushSlideHorizon(context,  const SearchUsersConditionPage());

                                },
                                icon: Icons.search,
                                text: 'Search conditions'),
                          ),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(searchUsersProvider.notifier)
                                    .setSearchProcessingFlgTrue();
                                ref
                                    .read(searchUsersProvider.notifier)
                                    .searchUsers(ref);
                              },
                              icon: const Icon(Icons.refresh),
                              iconSize: 26),
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: const Icon(Icons.upgrade),
                          //     iconSize: 26),
                        ])),
                  ),
                  resultBody(ref)
                ]))));
  }

  Widget resultBody(WidgetRef ref) {
    if (ref.watch(searchUsersProvider).searchProcessFlg == true) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    } else {
      return Expanded(
          child: ListView.builder(
              itemCount: ref.watch(searchUsersProvider).searchResultList.length,
              itemBuilder: (BuildContext context, int index) {
                return userResultList(context, ref, index,
                    ref.watch(searchUsersProvider).searchResultList[index]);
              }));
    }
  }

  Widget userResultList(
      BuildContext context, WidgetRef ref, int index, SearchHitUsers userData) {
    for (int i = 0; i < searchUsersImageLoadExtraNumber; i++) {
      if (ref.watch(searchUsersProvider).userImagesLoadStartFlg[index+i] ==null
      &&index+i<ref.watch(searchUsersProvider).searchResultList.length) {
        ref.read(searchUsersProvider.notifier).setFriendPhotoAndCategories(ref, index+i);
      }
    }

    List<Widget> featureList=[];
    if(ref.watch(searchUsersProvider).userCategories[userData.objectID]!=null) {
      ref.watch(searchUsersProvider)
          .userCategories[userData.objectID].forEach((item) {
        featureList.add(commonContainerOrangeBorderRoundSquareSmall(text: item));
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () async {
          commonNavigatorPushSlideHorizon(context,  FriendProfileRoot(
            argumentFriendUserDocId:userData.objectID,
            argumentFriendUserName:userData.name,
          ));
        },
        child: Container(
            color: Colors.white,
            height: 150,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8),
                child: commonCircleAvatarImage(
                    radius: 45,
                    image: ref
                        .watch(searchUsersProvider)
                        .userImages[userData.objectID],
                name:userData.name)
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText16BlackLeft(userData.name),
                              const SizedBox(width:8),
                              commonText16GrayLeft(fromBirthMillisecondsToAge(userData.birthDate).toString()),
                              const SizedBox(width:8),
                              Icon(commonGenderIcon(userData.gender),size:18)
                            ],
                          ),

                          loginLampFromSecondsSmall(userData.lastLoginTime,userData.onlineStatus,true)
                    ]),
                    const SizedBox(height:10),
                    commonText16GrayLeft(userData.description,maxLines: 5),
                ],
              ),
                  )),
            ])),
      ),
    );
  }
}
