import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/UI/commonTextUI.dart';

class TextDetails extends ConsumerWidget {
  const TextDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: commonAppbar("Text"),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(children: <Widget>[
              commonText20BlackLeft("Question list for discussion"),
              SizedBox(
                height:150,
                width:double.infinity,
                child: Image.network("https://mba.globis.ac.jp/careernote/assets_c/2021/09/iStock-1280484615%20%281%29%20%281%29%20%281%29-thumb-800x440-302.jpg",
                  fit: BoxFit.cover,),
              ),
              GestureDetector(
                  onTap: (){
                    launch('https://esldiscussions.com/');
                  },
                  child: commonText16BlueLeft("https://mba.globis.ac.jp/careernote/assets_c/2021/09/iStock-1280484615%20%281%29%20%281%29%20%281%29-thumb-800x440-302.jpg")),
              commonText16GrayLeft("This text offers 14,180 English Conversation Questions"),
              commonText16GrayLeft("★memo:Show Level and ... make check list"),

      ]),
          )),
    );
  }
}
