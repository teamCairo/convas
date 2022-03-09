import 'package:algolia/algolia.dart';
import 'package:convas/searchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';

class Search extends ConsumerWidget {
  Search({
    Key? key,
  }) : super(key: key);

  bool searchProcessFlg=true;



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        appBar: whiteAppbar("Search"),
        body: SafeArea(
            child:Padding(padding:const EdgeInsets.only(top:14,left:14,right:14,bottom:10),
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
                                        onPressed: () {

                                        },
                                        icon: Icons.search,
                                        text: 'Set search conditions'),
                                  ),
                                  SizedBox(
                                      width:40,
                                      child:Align(
                                          alignment:Alignment.center,
                                          child:GestureDetector(
                                              onTap: () async{

                                              },
                                              child: const Icon(
                                                  Icons.upgrade,
                                                  color: Colors.black87,
                                                  size:26
                                              )
                                          )
                                      ))
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

    if(searchProcessFlg==true) {
      searchProcessFlg=false;
      ref.watch(searchUsersProvider.notifier).searchUsers(ref);
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

  Widget userResultList(BuildContext context, WidgetRef ref,AlgoliaObjectSnapshot userData){

    String lastLoginStr="";
    //最終ログイン日付の計算
    int differentDays =DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(userData.data["lastLoginTime"])).inDays;
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
                children:[imageAvatar(radius:32,
                        image:ref.watch(searchUsersProvider).friendImage[userData.data["objectID"]] ==null
                            ? null
                            : ref.watch(searchUsersProvider).friendImage[userData.data["objectID"]]!.image,),
                  Expanded(
                      child:Column(
                        children:[
                          Row(children:[
                            black16TextCenter(userData.data["name"]),
                            // CircleAvatar(radius:10,
                            //     backgroundImage:ref.watch(countryDataProvider).countryData[userData.data["country"]]["imageFile"].image)
                          ]),
                          gray12TextLeft(userData.data["greeting"]),
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