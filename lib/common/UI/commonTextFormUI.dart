import 'package:convas/common/commonValues.dart';
import 'package:flutter/material.dart';

Widget commonTextBoxBordered(
    {required String text,
      Function(String)? onChanged,
      String? initialValue,
      bool? passwordSecure,
      int? maxLines,
      int? minLines,
    }) {
  return Column(children: [
    TextFormField(
        initialValue:initialValue,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: commonColorSecondary,width:2 ),
          ),
          focusColor: Colors.black,
          fillColor: Colors.black,
          labelText: text,
          labelStyle: TextStyle(color: commonColorSecondary),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: commonColorSecondary,
          //   ),
          // ),
          border:   OutlineInputBorder(
            borderSide: BorderSide(
              color: commonColorSecondary,
            ),
          ),
          alignLabelWithHint: true,
        ),
        obscureText: passwordSecure??false,
        onChanged: onChanged,
      maxLines: maxLines??1,
      minLines: minLines,
    )
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
        cursorHeight:26,
        keyboardType: (multiLine??false)==false?null:TextInputType.multiline,
        autofocus: true,
      controller: controller,
      decoration: const InputDecoration(
          border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 6,
        ),
      ),
      maxLines: (multiLine??false)==false?1:null,
      textInputAction: (multiLine??false)==false?null:TextInputAction.newline,
      onChanged: onChanged
    ),
  );

}