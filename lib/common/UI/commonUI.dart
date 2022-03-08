import 'package:flutter/material.dart';

Widget borderedTextBox(
    {required String text,
    Function(String)? onChanged,
    required bool passwordSecure}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(children: [
        TextFormField(
            decoration: InputDecoration(
              labelText: text,
              border: const OutlineInputBorder(),
            ),
            obscureText: passwordSecure,
            onChanged: onChanged)
      ]));
}

const Color themeColorDeep = Colors.orangeAccent;

Widget orangeRoundButton(
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

Widget smallOrangeRoundButton(
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

Widget whiteBorderRoundButton(
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

AppBar whiteAppbar(String text) {
  return AppBar(
    backgroundColor: Colors.white10,
    elevation: 0.0,
    title: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 21,
        color: Colors.black87,
      ),
    ),
  );
}

Padding graySmallestTextRight(String text) {
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

Padding graySmallestTextLeft(String text) {
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

Text orangeSmallestTextLeft(String text) {
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

Padding orangeBorderContainer(String text) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: TextStyle(
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

IconButton graySmallerIconButton(
    {required IconData icon, required Function()? onPressed}) {
  return IconButton(
    icon: Icon(icon),
    iconSize: 28,
    color: Colors.black54,
    onPressed: onPressed,
  );
}

IconButton blackSmallerIconButton(
    {required IconData icon, Function()? onPressed}) {
  return IconButton(
    icon: Icon(icon),
    iconSize: 28,
    color: Colors.black87,
    onPressed: onPressed,
  );
}

ElevatedButton whiteRoundSquareSmallButton(
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


ElevatedButton orangeRoundSquareSmallButton(
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
        elevation:0,
        primary: Colors.orange,
        shape: const StadiumBorder(),
        side: const BorderSide(
          width:0,
          style:BorderStyle.none
        ),
      ));
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