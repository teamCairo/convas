import 'package:flutter/material.dart';

import '../commonValues.dart';
import '../logic/commonLogicOthers.dart';
import 'commonTextUI.dart';

AppBar commonAppbarWhite(String text) {
  return AppBar(
    backgroundColor: Colors.white10,
    elevation: 0.0,
    title: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.black87,
      ),
    ),
  );
}

Widget commonLogoMain(double size){

  return Container(
    height: size,
    width: size,
    child:Icon(Icons.phone,
    size:size*0.75,
    color:Colors.white60),
    decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(size/2)
    ),
  );

}

//丸角の写真を表示する元ネタ
// Widget _userIconImage() {
//   return new Container(
//       width: 150.0,
//       height: 150.0,
//       decoration: new BoxDecoration(
//           shape: BoxShape.circle,
//           image: new DecorationImage(
//               fit: BoxFit.fill,
//               image: new NetworkImage(
//                   "画像URL")
//           )
//       ));
// }

AppBar commonAppbarTransparent(String text) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.black87,
      ),
    ),
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
        borderRadius: BorderRadius.circular(radius),
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

Future<dynamic> showOkWarningDialog(BuildContext context,  String message)async{
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

Future<dynamic> showOkInfoDialog(BuildContext context,  String message)async{
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title:  const Text("Information"),
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

