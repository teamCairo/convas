import 'package:flutter/material.dart';

Widget commonTextBoxBordered(
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

Widget commonTextBoxGray(
    {Function(String)? onChanged,
      TextEditingController? controller}){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40)),
    child: TextField(
      autofocus: true,
      controller: controller,
      decoration: const InputDecoration(border: InputBorder.none),
      onChanged: onChanged
    ),
  );

}
