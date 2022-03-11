import 'package:algolia/algolia.dart';
import 'package:convas/searchUsersConditionPageUI.dart';
import 'package:convas/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'daoAlgolia/usersDaoAlgolia.dart';

class SearchUsersMainPage extends ConsumerWidget {
  SearchUsersMainPage({
    Key? key,
  }) : super(key: key);

  bool initialProcessFlg=true;



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if(initialProcessFlg==true) {
      initialProcessFlg=false;
      ref.read(searchUsersProvider.notifier).readConditionsFromUserData(ref);
      ref.read(searchUsersProvider.notifier).setSearchProcessingFlgTrue();
      ref.read(searchUsersProvider.notifier).searchUsers(ref);
    }

    return Scaffold(
        body: SafeArea(
            child:Padding(padding:const EdgeInsets.only(top:20,left:14,right:14,bottom:10),
                child:Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(bottom:10.0),
                        child: SizedBox(
                            width:double.infinity,
                            height: 42,
                            child:Row(
                                children:[
                                  Expanded(
                                    child: grayWideIconTextButton(
                                        onPressed: ()async {

                                          await Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) {
                                              return const SearchUsersConditionPage();
                                            }),
                                          );

                                        },
                                        icon: Icons.search,
                                        text: 'Set search conditions'),
                                  ),
                                  IconButton(onPressed:(){
                                    ref.read(searchUsersProvider.notifier).searchUsers(ref);
                                    ref.read(searchUsersProvider.notifier).setSearchProcessingFlgTrue();

                                  },
                                      icon: const Icon(Icons.refresh),
                                  iconSize:26),
                                  IconButton(onPressed:(){
                                  },
                                      icon: const Icon(Icons.upgrade),
                                      iconSize:26),
                                ]
                            )
                        ),
                      ),
                      resultBody(ref)
                    ]
                )
            )
        )
    );
  }

  Widget resultBody(WidgetRef ref){

    if(ref.watch(searchUsersProvider).searchProcessFlg==true) {
      return const Expanded(
          child:Center(
              child:
              CircularProgressIndicator()
          )
      );
    }else {
      return Expanded(
          child:ListView.builder(
              itemCount:ref.watch(searchUsersProvider).searchResultList.length,
              itemBuilder:(BuildContext context,int index){
                return userResultList( context,  ref,ref.watch(searchUsersProvider).searchResultList[index]);
              }
          ));
    }
  }

  Widget userResultList(BuildContext context, WidgetRef ref,SearchHitUsers userData){

    String lastLoginStr="";
    //最終ログイン日付の計算
    int differentDays =DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(userData.lastLoginTime)).inDays;
    if(differentDays==0){
      lastLoginStr="today";
    }else if(differentDays == 1){
      lastLoginStr="yesterday";
    }else{
      lastLoginStr=differentDays.toString()+" days ago";
    }
    //
    // List<Widget> featureList=[];
    // featureList.add(orangeBorderContainer( text:"intermediate"));
    // featureList.add(orangeBorderContainer( text:"cate1"));
    // featureList.add(orangeBorderContainer( text:"cate2"));
    // featureList.add(orangeBorderContainer( text:"cate3"));
    // featureList.add(orangeBorderContainer( text:"cate4"));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5),
      child: GestureDetector(
        onTap:()async{
          // await Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     return FriendProfile(
          //       argumentFriendUserDocId:userData.data["objectID"],
          //     );
          //   }),
          // );
        },
        child: Container(
            color: Colors.white10,
            height:130,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[Padding(
                  padding: const EdgeInsets.only(right:8.0,top:8),
                  child: imageAvatar(radius:32,
                          image:ref.watch(searchUsersProvider).userImages[userData.objectID] ==null
                              ? null
                              : ref.watch(searchUsersProvider).userImages[userData.objectID]!.image,),
                ),
                  Expanded(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Row(children:[
                            black16TextCenter(userData.name),
                            black16TextCenter(userData.age.toString()),
                            // CircleAvatar(radius:10,
                            //     backgroundImage:ref.watch(countryDataProvider).countryData[userData.data["country"]]["imageFile"].image)
                          ]),
                          gray12TextLeft(userData.greeting),
                          // Wrap(children: featureList)
                        ],
                      )
                  ),
                  SizedBox(
                      width:70,
                      child:Column(
                          children:[
                            gray12TextRight(lastLoginStr ),
                          ]
                      )
                  )
                ]
            )
        ),
      ),
    );
  }
}