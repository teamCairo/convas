import 'package:flutter/material.dart';

AppBar whiteAppbar(String text) {
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

CircleAvatar imageAvatar({Image? image, required double radius}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: Colors.white,
    backgroundImage: image?.image,
  );
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

Padding orangeBorderRoundSquareSmall({required String text}){
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

Widget loginLampFromSecondsSmall(int epochTimeMilliSeconds,bool onlineStatus){
  return loginLampFromSeconds(epochTimeMilliSeconds,onlineStatus,8);
}

Widget loginLampFromSeconds(int epochTimeMilliSeconds,bool onlineStatus,double size){

  Color? lampColor;

  if(onlineStatus){
    lampColor=Colors.green;
  }
  int differentDays = DateTime.now()
      .difference(DateTime.fromMillisecondsSinceEpoch(epochTimeMilliSeconds))
      .inDays;
  if (differentDays <= 7) {
    lampColor=Colors.amberAccent;
  }else{
    lampColor=Colors.grey;
  }

return Icon(Icons.circle,
    color:lampColor,
   size:size);

}