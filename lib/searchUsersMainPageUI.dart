import 'package:convas/searchUsersConditionPageUI.dart';
import 'package:convas/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/commonValues.dart';
import 'common/logic/commonLogic.dart';
import 'daoAlgolia/usersDaoAlgolia.dart';
import 'friendProfileUI.dart';

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
                            child: grayWideIconTextButton(
                                onPressed: () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return const SearchUsersConditionPage();
                                    }),
                                  );
                                },
                                icon: Icons.search,
                                text: 'Set search conditions'),
                          ),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(searchUsersProvider.notifier)
                                    .searchUsers(ref);
                                ref
                                    .read(searchUsersProvider.notifier)
                                    .setSearchProcessingFlgTrue();
                              },
                              icon: const Icon(Icons.refresh),
                              iconSize: 26),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.upgrade),
                              iconSize: 26),
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

    String lastLoginStr = lastLoginInfo(userData.onlineStatus,userData.lastLoginTime);

    List<Widget> featureList=[];
    if(ref.watch(searchUsersProvider).userCategories[userData.objectID]!=null) {
      ref.watch(searchUsersProvider)
          .userCategories[userData.objectID].forEach((item) {
        featureList.add(orangeBorderRoundSquareSmall(text: item));
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return FriendProfile(
                argumentFriendUserDocId:userData.objectID,
              );
            }),
          );
        },
        child: Container(
            color: Colors.white10,
            height: 100,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8),
                child: imageAvatar(
                    radius: 32,
                    image: ref
                        .watch(searchUsersProvider)
                        .userImages[userData.objectID])
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
                      black16TextCenter(userData.name),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:4,right: 4.0),
                                child: loginLampFromSecondsSmall(userData.lastLoginTime,userData.onlineStatus),
                              ),
                              gray12TextRight(lastLoginStr),
                            ],
                          ),
                    ]),
                    gray14TextLeft(userData.greeting),
                    Padding(
                        padding: const EdgeInsets.only(top:3.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: featureList
                            )))
                ],
              ),
                  )),
            ])),
      ),
    );
  }
}
