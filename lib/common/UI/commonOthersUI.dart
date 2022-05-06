import 'package:convas/common/provider/masterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UIs/findRoute/friendProfileRootUI.dart';
import '../../UIs/findRoute/friendProfileUI.dart';
import '../commonValues.dart';
import '../logic/commonLogicOthers.dart';
import 'commonTextUI.dart';

AppBar commonAppbar(String text,{Color? color,Widget? leadingWidget, List<Widget>? tailWidgetList}) {
  Color backColor=Colors.white10;
  if(color!=null) {
    backColor=color;
  }
  return AppBar(
    backgroundColor: backColor,
    elevation: 0.0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        leadingWidget ?? Container()
      ],
    ),
    actions:tailWidgetList,
  );
}


AppBar commonAppTabBar({Color? color,PreferredSizeWidget? bottom}) {
  Color backColor=Colors.white10;
  if(color!=null) {
    backColor=color;
  }
  return AppBar(
      toolbarHeight:0,
      backgroundColor: backColor,
      elevation: 0.0,
      bottom:bottom
  );
}

Dialog commonDialog(BuildContext context, WidgetRef ref, String title, Widget child,{double? height,double? width}){
  double _dialogWidth = width??MediaQuery.of(context).size.width * 3 / 4;
  double _dialogHeight = height??MediaQuery.of(context).size.width * 3 / 4;


  return Dialog(
    // insetPadding: const EdgeInsets.all(MediaQuery.of(context).size.width/8),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: SizedBox(
      width: _dialogWidth,
      height: _dialogHeight,
      child: Container(
        decoration: BoxDecoration(
          color:Colors.white,
          border:Border.all(style:BorderStyle.none),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              commonText24BlackBoldCenter(title),
              Expanded(
                child: child,
              ),
            ],

          ),
        ),
      ),
    ),
  );
}
Scaffold commonScaffold(BuildContext context, WidgetRef ref,MainAxisAlignment mainAxisAlignment, List<Widget> children,{Widget? floatingActionButton,PreferredSizeWidget? appBar}){
  return Scaffold(
    appBar:appBar,
      body: SafeArea(
      child: Padding(
      padding: const EdgeInsets.all(20.0),
  child:Column(
    mainAxisAlignment:mainAxisAlignment ,
    children:children
  ))),
      floatingActionButton:floatingActionButton
  );
}


Scaffold commonScaffoldScroll(BuildContext context, WidgetRef ref,MainAxisAlignment mainAxisAlignment, List<Widget> children,{Widget? floatingActionButton,PreferredSizeWidget? appBar}){
  return Scaffold(
      appBar:appBar,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:Column(
                    mainAxisAlignment:mainAxisAlignment ,
                    children:children
                )),
          )),
      floatingActionButton:floatingActionButton
  );
}

Widget commonLogoMain(double size){

  return Container(
    height: size,
    width: size,
    child:Icon(Icons.phone,
    size:size*0.75,
    color:Colors.white60),
    decoration:
    BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(size/2)
    ),
  );

}

Widget commonImageButton(String imagePath, String imageText, Function() onTap,double width){
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
            width: width,
            child:
            Image.asset(imagePath),
            color:Colors.white
        ),
        commonText20BlackCenter(imageText),
      ],
    ),
  );
}

Widget commonVerticalGap(){
  return const SizedBox(height: 16);
}

Widget commonHorizontalGap(){
  return const SizedBox(width: 16);
}
Widget commonCircleAvatarUserImageUpload({Image? image,
  required double radius,
  required String name,
 required Function() onTap}){
  return GestureDetector(
    child: Stack(
      alignment: const Alignment(0.9, 0.9),
      children: [commonCircleAvatarImage(
          radius: radius,
          image:image,
          name:name
      ),
        const Icon(Icons.camera_alt),
      ],
    ),
    onTap: onTap,
  );
}

Widget commonCircleAvatarUserImage({Image? image,
required double radius,
required String userDocId,
required String name,
required BuildContext context}
){
  return GestureDetector(
      onTap: () async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return FriendProfileRoot(
          argumentFriendUserDocId:userDocId,
          argumentFriendUserName:name,
        );
      }),
    );
  },
  child:commonCircleAvatarImage(image:image, radius:radius, name:name)
  );
}
Widget commonCircleAvatarImage({Image? image, required double radius, required String name}) {

  String character="";
  if(image==null){

    if(name.isNotEmpty){
      character=name.substring(0,1).toUpperCase();
    }

    return Container(
      height:radius*2,
      width:radius*2,
      child:Text(character,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: radius,
            color: Colors.white70,
          ),),
      decoration: BoxDecoration(
        color:Colors.amber,
        border: Border.all(
            style:BorderStyle.none),
        borderRadius: BorderRadius.circular(radius*3.2),
      ),
      alignment: Alignment.center, //
    );
  }else{
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: image.image,
    );

  }
}

Future<dynamic> commonShowOkWarningDialog(BuildContext context,  String message)async{
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title:  const Text("Warning"),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

Future<dynamic> commonShowOkInfoDialog(BuildContext context, String title, String message)async{
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title:  Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

Future<dynamic> commonShowOkNgInfoDialog(BuildContext context,  String message, Function()? onPressed)async{
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title:  const Text("Information"),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("OK"),
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}

Widget commonContainerOrangeBorderRoundSquareSmall({required String text}){
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Container(
      child:Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(text,
          style:const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color:Colors.orange,
        border: Border.all(
        style:BorderStyle.none),
        borderRadius: BorderRadius.circular(20),
      ),),
  );
}

Widget commonWrapMultiLineOrangeBorderRoundList(List<String> textList){

  List<Widget> tmpList=[];
  if(textList.isEmpty){
    tmpList.add(commonContainerOrangeBorderRoundSquareSmall(text:"Not registered"));
  }
  for(int i=0;i<textList.length;i++){
    tmpList.add(commonContainerOrangeBorderRoundSquareSmall( text:textList[i]));
  }

  return SizedBox(
    width:double.infinity,
      child: Wrap(children: tmpList,));
}

Widget loginLampFromSecondsSmall(int epochTimeMilliSeconds,bool onlineStatus,bool textShow){
  return loginLampFromSeconds(epochTimeMilliSeconds,onlineStatus,8, textShow);
}

Widget loginLampSmall(DateTime lastLoginTime,bool onlineStatus,bool textShow){
  return loginLamp(lastLoginTime,onlineStatus,8, textShow);
}

Widget loginLamp(DateTime lastLoginTime,bool onlineStatus,double size,bool textShow){

  Color? lampColor;

  if(onlineStatus){
    lampColor=Colors.green;
  }else {
    int differentDays = DateTime
        .now()
        .difference(lastLoginTime)
        .inDays;
    if (differentDays <= 7) {
      lampColor = Colors.amberAccent;
    } else {
      lampColor = Colors.grey;
    }
  }

  Icon lampIcon= Icon(Icons.circle,
      color:lampColor,
      size:size);

  if(textShow){
    String lastLoginStr = lastLoginInfo(onlineStatus,lastLoginTime);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:4,right: 4.0),
          child: lampIcon,
        ),
        commonText12GrayRight(lastLoginStr),
      ],
    );
  }else{
    return(lampIcon);
  }
}

Widget loginLampFromSeconds(int epochTimeMilliSeconds,bool onlineStatus,double size,bool textShow){

  return loginLamp(DateTime.fromMillisecondsSinceEpoch(epochTimeMilliSeconds), onlineStatus, size, textShow);

}
Widget commonLineHorizontalGrayThin(double upperPadding,double bottomPadding){
  return Padding(
    padding: EdgeInsets.only(top:upperPadding,bottom:bottomPadding),
    child: Container(
      height:0.5,
      width:double.infinity,
      color:Colors.black26
    ),
  );
}

Widget commonBalloonRight(Widget child){
  return Align(
      alignment: Alignment.centerRight,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              gradient: commonLinearGradientForChatBox),
          child: child));
}


Widget commonBalloon(Widget child,String rightLeft){
  if(rightLeft=="right"){
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                gradient: commonLinearGradientForChatBox),
            child: child));

  }else{
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                gradient: commonLinearGradientForChatBox),
            child: child));

  }

}

Widget commonImageCountry(String countryCode,double height, WidgetRef ref){

  if(countryCode==""){
    return SizedBox(
        height:height);
  }else{
    return SizedBox(
        height:height,
        child:Image.memory(getMasterData("country", countryCode, ref).optionFile1!));
  }

}

Widget commonCheckBoxList(String displayItemName,bool value,{required void Function(bool?)  onChanged}){
  return CheckboxListTile(
    title: commonText16GrayLeft(displayItemName),
    value: value,
    onChanged:onChanged ,
    controlAffinity: ListTileControlAffinity.trailing,
  );
}

