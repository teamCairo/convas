import 'package:flutter/material.dart';

Widget commonTextBoxBordered(
    {required String text,
      Function(String)? onChanged,
      String? initialValue,
      required bool passwordSecure}) {
  return Column(children: [
    TextFormField(
        initialValue:initialValue,
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
        ),
        obscureText: passwordSecure,
        onChanged: onChanged)
  ]);
}


Widget commonTextBoxGrayForChat(
    {Function(String)? onChanged,
      TextEditingController? controller,
    bool? multiLine}){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40)),
    child: TextField(
        keyboardType: multiLine??false==false?null:TextInputType.multiline,
        autofocus: true,
      controller: controller,
      decoration: const InputDecoration(border: InputBorder.none),
      maxLines: multiLine??false==false?1:null,
      textInputAction: multiLine??false==false?null:TextInputAction.newline,
      onChanged: onChanged
    ),
  );

}
