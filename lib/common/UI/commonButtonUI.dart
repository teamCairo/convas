import 'package:flutter/material.dart';

Widget commonButtonCloseForModal(BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    commonButtonGraySmallerIcon(
        icon: Icons.clear,
        onPressed: () {
          Navigator.of(context).pop();
        }),
  ]);
}

Widget commonButtonSingleFooter(
    {required String text, required Function()? onPressed}) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
  child:commonButtonOrangeRound(text:text,onPressed:onPressed));
    }

Widget commonButtonOrangeRound(
    {required String text, required Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: SizedBox(
      width: double.infinity,
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

Widget commonButtonRoundHalf(
    {required String text, required Function()? onPressed, required Color color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: SizedBox(
      width: 150,
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

Widget commonButtonWhiteBorderRound(
    {required String text, required Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: SizedBox(
      width: double.infinity,
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
          primary: Colors.white10,
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.orange, width: 1),
        ),
        onPressed: onPressed,
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
