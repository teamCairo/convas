import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
//
// Widget commonButtonCloseForModal(BuildContext context) {
//   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//     commonButtonGraySmallerIcon(
//         icon: Icons.clear,
//         onPressed: () {
//           Navigator.of(context).pop();
//         }),
//   ]);
// }

// Widget commonButtonSingleFooter(
//     {required String text, required Function()? onPressed}) {
//   return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//   child:commonButtonOrangeRound(text:text,onPressed:onPressed));
//     }

Widget commonButtonOrangeRound(
    {required String text, required Function()? onPressed,double? width}) {
  return SizedBox(
    width: width??double.infinity,
    height: 50,
    child: OutlinedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.orange,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.white, width: 0),
      ),
      onPressed: onPressed,
    ),
  );
}

Widget commonButtonOrangeRoundForColorTest(
    {required String text, required Function()? onPressed,double? width,required BuildContext context}) {
  return SizedBox(
    width: width??double.infinity,
    height: 50,
    child: OutlinedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.white, width: 0),
      ),
      onPressed: onPressed,
    ),
  );
}

commonButtonTitleAndTextWhite(String title, String text, double height, Function() onTap){
  return GestureDetector(
      onTap:onTap,
      child: Container(
        width:double.infinity,
        height:height,
        decoration: BoxDecoration(
        color:Colors.white,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              commonText20BlackLeft(title),
              commonText16GrayLeft(text)
            ]
          ),
        )
      ));
}

Widget commonButtonRoundByWidthAndHeight(
    {required String text, required Function()? onPressed, required Color color,required double width,required double height}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: OutlinedButton.styleFrom(
          primary: Colors.white10,
          backgroundColor: color,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.white, width: 0),
        ),
        onPressed: onPressed,
      ),
    ),
  );
}

Widget commonButtonRoundSmall(
    {required String text, required Function()? onPressed, required Color color,required double width}) {
  return SizedBox(
    width: width,
    height: 50,
    child: OutlinedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: color,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.white, width: 0),
      ),
      onPressed: onPressed,
    ),
  );
}

Widget commonButtonRoundOrangeSmall(
    {required String text, required Function()? onPressed,required double width }) {
  return SizedBox(
    width: width,
    height: 50,
    child: OutlinedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.orange,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.white, width: 0),
      ),
      onPressed: onPressed,
    ),
  );
}

Widget commonButtonRoundWhiteSmall(
    {required String text, required Function()? onPressed,required double width }) {
  return SizedBox(
    width: width,
    height: 50,
    child: OutlinedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.orange,
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.orange, width: 1),
      ),
      onPressed: onPressed,
    ),
  );
}

Widget commonButtonSmallOrangeRound(
    {required String text, required Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: SizedBox(
      height: 30,
      child: OutlinedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: OutlinedButton.styleFrom(
          primary: Colors.white10,
          backgroundColor: Colors.orange,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.white, width: 0),
        ),
        onPressed: onPressed,
      ),
    ),
  );
}

Widget commonIconButtonQuestion(
    {required Function()? onTap}) {
  return GestureDetector(
    onTap:onTap,
    child: const Icon(
        Icons.info_outline,
        size:30,
    color:Colors.orange),
  );
}


Widget commonIconButtonSmallOrangeRound(
    {Size? size,required IconData iconData, required String text, required Function()? onPressed}) {
  return ElevatedButton.icon(
    label: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    style: OutlinedButton.styleFrom(
        minimumSize:size,
        primary: Colors.white,
        backgroundColor: Colors.orange,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.white, width: 1),
        elevation:0
    ),
    onPressed: onPressed, icon: Icon(iconData,
      color:Colors.white),
  );
}

Widget commonIconButtonSmallWhiteBorderRound(
    {Size? size,required IconData iconData, required String text, required Function()? onPressed}) {
  return ElevatedButton.icon(
    label: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: Colors.orange,
      ),
    ),
    style: OutlinedButton.styleFrom(
        minimumSize:size,
        primary: Colors.white,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.orange, width: 1),
        elevation:0
    ),
    onPressed: onPressed, icon: Icon(iconData,
      color:Colors.orange),
  );
}

Widget commonButtonWhiteBorderRound(
    {required String text, required Function()? onPressed,double? width}) {
  return SizedBox(
    width: width??double.infinity,
    height: 50,
    child: OutlinedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.orange,
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.orange, width: 1),
      ),
      onPressed: onPressed,
    ),
  );
}



Widget commonIconButtonOrangeRound(
    {required IconData iconData,required String text, required Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        label: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: OutlinedButton.styleFrom(
          primary: Colors.white10,
          backgroundColor: Colors.orange,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.white, width: 0),
            elevation:0
        ),
        onPressed: onPressed, icon: Icon(iconData,
      color:Colors.white),
      ),
    ),
  );
}


Widget commonIconButtonAddHashTagInfo(
    {required IconData iconData,required String text, required Function()? onPressed,required Color color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: SizedBox(
      height: 34,
      child: OutlinedButton.icon(
        label: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: color,
          ),
        ),
        style: OutlinedButton.styleFrom(
            primary: color,
            backgroundColor: Colors.white10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: const BorderSide(color: Colors.black12, width: 1),
            elevation:0
        ),
        onPressed: onPressed, icon: Icon(iconData,
          size:16,
          color:color),
      ),
    ),
  );
}

Widget commonIconButtonWhiteBorderRound(
    {required IconData iconData, required String text, required Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        label: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.orange,
          ),
        ),
        style: OutlinedButton.styleFrom(
          primary: Colors.white10,
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.orange, width: 1),
            elevation:0
        ),
        onPressed: onPressed, icon: Icon(iconData,
      color:Colors.orange),
      ),
    ),
  );
}



Widget commonButtonIconCircle(
    {required IconData icon,
      required Color color,
      required Color backcolor,
      required double size,
      bool? showBorder,
      required Function()? onPressed}) {
  return ElevatedButton(
    child: Icon(icon,
        color:color,
        size:size
    ),
    style: ElevatedButton.styleFrom(
      primary: backcolor,
      onPrimary: Colors.black,
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
          style: (showBorder??true)?BorderStyle.solid:BorderStyle.none,
        ),
      ),
    ),
    onPressed: onPressed,
  );
  return IconButton(
      icon: Icon(icon,
          color:color,
          size:size
      ),
      color:backcolor,
      onPressed: onPressed );
}

Widget commonButtonIconTextGrayWide(
    {required IconData icon,
    required String text,
    required Function()? onPressed}) {
  return TextButton(
      onPressed: onPressed,
      child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children:[
        Icon(icon,
        color:Colors.black54),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black54,
          ),
        )
      ]),
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        side:BorderSide.none,
      ));
}

IconButton commonButtonGraySmallerIcon(
    {required IconData icon, required Function()? onPressed}) {
  return IconButton(
    icon: Icon(icon),
    iconSize: 28,
    color: Colors.black54,
    onPressed: onPressed,
  );
}

IconButton commonButtonBlackSmallerIcon(
    {required IconData icon, Function()? onPressed}) {
  return IconButton(
    icon: Icon(icon),
    iconSize: 28,
    color: Colors.black87,
    onPressed: onPressed,
  );
}

ElevatedButton commonButtonWhiteRoundSquareSmall(
    {required String text, required Function()? onPressed}) {
  return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        side: const BorderSide(),
      ));
}

ElevatedButton commonButtonOrangeRoundSquareSmall(
    {required String text, required Function()? onPressed}) {
  return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.orange,
        shape: const StadiumBorder(),
        side: const BorderSide(width: 0, style: BorderStyle.none),
      ));
}
