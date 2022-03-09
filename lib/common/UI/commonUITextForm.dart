import 'package:flutter/material.dart';

Widget borderedTextBox(
    {required String text,
      Function(String)? onChanged,
      String? initialValue,
      required bool passwordSecure}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(children: [
        TextFormField(
            initialValue:initialValue,
            decoration: InputDecoration(
              labelText: text,
              border: const OutlineInputBorder(),
            ),
            obscureText: passwordSecure,
            onChanged: onChanged)
      ]));
}
