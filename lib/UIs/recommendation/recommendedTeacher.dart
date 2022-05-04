import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonTextUI.dart';

class RecommendedTeacher extends ConsumerWidget {
  RecommendedTeacher({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: commonAppbar("Recommend"),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                  teachersCard(
                      "https://nikkan-spa.jp/wp-content/uploads/2022/01/20220111kh03-550x550.jpg",
                      "Hiroyuki",
                      "Popular",
                      ref,
                      context
                  ),
                  const SizedBox(width:8),
                ],
              ),
            ]),
          )),
    );
  }
}

Widget teachersCard(String url,String description,String goalCategoryName,WidgetRef ref, BuildContext context){

  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: GestureDetector(
      onTap:(){
        //
        // ref.read(registerProvider.notifier).setGoal(description);
        // Navigator.of(context).push(
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation, secondaryAnimation) {
        //       return const MakeMoreSpecific();
        //     },
        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //       return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
        //     },
        //   ),
        // );
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