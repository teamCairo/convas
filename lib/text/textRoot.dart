import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/UI/commonTextUI.dart';

class TextRoot extends ConsumerWidget {
  TextRoot({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbarWhite("Text"),
      body: SafeArea(
          child: Column(children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width:8),
                textCard(
                    "https://mba.globis.ac.jp/careernote/assets_c/2021/09/iStock-1280484615%20%281%29%20%281%29%20%281%29-thumb-800x440-302.jpg",
                    "Question list",
                    "Popular",
                    ref,
                    context
                ),
                const SizedBox(width:8),
                textCard(
                    "https://chanto.jp.net/wchtp/wp-content/uploads/4b13641e0c95c478a0e1536b53bf8119.jpg",
                    "Ice break",
                    "Popular",
                    ref,
                    context
                ),
                const SizedBox(width:8),
              ],
            ),

          ])),
    );
  }
}


Widget textCard(String url,String description,String goalCategoryName,WidgetRef ref, BuildContext context){

  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: GestureDetector(
      onTap:(){

      },
      child: SizedBox(
        height:250,
        width:160,
        child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  SizedBox(
                    height:150,
                    width:double.infinity,
                    child: Image.network(url,
                      fit: BoxFit.cover,),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: commonText16BlackLeft(description))
                ]
            )),
      ),
    ),
  );

}