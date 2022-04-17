
import 'package:flutter/material.dart';

Padding commonText12GrayRight(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Align(
        alignment: Alignment.topRight,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black54,
          ),
        )),
  );
}

Padding commonText14GrayLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black54,
          ),
        )),
  );
}

Padding commonText14Gray(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.black54,
      ),
    ),
  );
}

Padding commonText16GrayRight(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topRight,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black54,
          ),
        )),
  );
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

Padding commonText20GrayLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.black54,
          ),
        )),
  );
}


Padding commonText20BlackCenter(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.black87,
          ),
        )),
  );
}


Padding commonText16BlackCenter(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black87,
          ),
        )),
  );
}

Padding black16TextLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black87,
          ),
        )),
  );
}

Padding commonText16GrayLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black54,
          ),
        )),
  );
}

Padding commonText16Gray(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black54,
          ),
        )),
  );
}

Padding commonText16BlackLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black87,
          ),
        )),
  );
}

Padding commonText20BlackLeftBold(String text) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        )),
  );
}


Text commonText12DeepOrangeLeft(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: Colors.deepOrange,
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

Text commonText16DeepOrangeRight(String text) {
  return Text(
    text,
    textAlign: TextAlign.right,
    style: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: Colors.deepOrange,
    ),
  );
}
Text commonText22DeepOrangeLeftBold(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22,
      color: Colors.deepOrange,
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