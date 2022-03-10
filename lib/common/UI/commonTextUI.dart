
import 'package:flutter/material.dart';

Padding gray12TextRight(String text) {
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

Padding gray12TextLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Align(
        alignment: Alignment.topLeft,
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

Padding gray16TextRight(String text) {
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


Padding gray16TextRightEllipsis(String text,double width) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width:width,
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
        )),
  );
}

Padding gray20TextLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black54,
          ),
        )),
  );
}


Padding black20TextCenter(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black87,
          ),
        )),
  );
}

Padding gray20TextRight(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topRight,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black54,
          ),
        )),
  );
}
Padding gray16TextLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topLeft,
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
Padding black16TextCenter(String text) {
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
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black87,
          ),
        )),
  );
}
Padding black18TextLeft(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black87,
          ),
        )),
  );
}

Padding black20BoldTextLeft(String text) {
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


Text deepOrange12TextLeft(String text) {
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

Text deepOrange16TextLeft(String text) {
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

Text deepOrange16TextRight(String text) {
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



Padding orangeBorderContainerText(String text) {
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