
import 'package:flutter/material.dart';

import '../commonValues.dart';

Widget commonText12GrayRight(String text) {
  return Align(
      alignment: Alignment.topRight,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.black54,
        ),
      ));
}

Widget commonText14GrayLeft(String text) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.black54,
        ),
      ));
}

Widget commonText14Gray(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.black54,
    ),
  );
}

Widget commonText16GrayRight(String text) {
  return Align(
      alignment: Alignment.topRight,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.black54,
        ),
      ));
}

Widget commonText16GrayLeftEllipsis(String text) {
  return Expanded(
    child: Text(
      text,
      textAlign:TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black54,
      ),
    ),
  );
}

Widget commonText16GrayRightEllipsis(String text) {
  return Expanded(
          child: Text(
            text,
            textAlign:TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
  );
}

Widget commonText20GrayLeft(String text) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.black54,
        ),
      ));
}


Widget commonText20BlackLeft(String text) {
  return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.black87,
        ),
      ));
}
Widget commonText20BlackCenter(String text) {
  return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.black87,
        ),
      ));
}



Widget commonText30BlackBoldLeft(String text) {
  return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30,
          color: Colors.black87,
        ),
      ));
}


Widget commonText30BlackBoldCenter(String text) {
  return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30,
          color: Colors.black87,
        ),
      ));
}


Widget commonText24BlackBoldCenter(String text) {
  return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Colors.black87,
        ),
      ));
}

Widget commonText24BlackBoldLeft(String text) {
  return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Colors.black87,
        ),
      ));
}


Widget commonText16BlackCenter(String text) {
  return Align(
      alignment: Alignment.topCenter,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.black87,
        ),
      ));
}

Widget black16TextLeft(String text) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black87,
        ),
      ));
}

Widget commonText16BlueLeft(String text) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.blueAccent,
        ),
      ));
}

Widget commonText16GrayLeft(String text,{int? maxLines}) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black54,
        ),
        maxLines: maxLines,
      ));
}

Widget commonText16GrayCenter(String text) {
  return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black54,
        ),
      ));
}

Widget commonText16BlackLeft(String text) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.black87,
        ),
      ));
}

Widget commonText20BlackLeftBold(String text) {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black87,
        ),
      ));
}


Text commonText12SecondaryColorLeft(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style:  TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: commonColorSecondary,
    ),
  );
}


Text commonText14OrangeLeft(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Colors.orange,
    ),
  );
}

Text commonText16DeepOrangeLeft(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: Colors.deepOrange,
    ),
  );
}

Text commonText16SecondaryColorRight(String text) {
  return Text(
    text,
    textAlign: TextAlign.right,
    style:  TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: commonColorSecondary,
    ),
  );
}
Text commonText22SecondaryColorLeftBold(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style:  TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: commonColorSecondary,
    ),
  );
}



Padding commonText13OrangeBorderContainer(String text) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.orange,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}