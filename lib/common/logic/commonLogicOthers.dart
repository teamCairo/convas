import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../otherClass/commonHexColor.dart';

String lastLoginInfo(bool onlineStatus, DateTime lastLoginTime) {
  if (onlineStatus) {
    return "Online";
  }
  int differentDays = DateTime.now().difference(lastLoginTime).inDays;
  if (differentDays == 0) {
    return "Today";
  } else if (differentDays == 1) {
    return "Yesterday";
  } else if (differentDays < 7) {
    return differentDays.toString() + " days ago";
  } else {
    return lastLoginTime.month.toString() + "/" + lastLoginTime.day.toString();
  }
}

bool parseBool(String str) {
  if (str.toLowerCase() == 'true') {
    return true;
  } else if (str.toLowerCase() == 'false') {
    return false;
  }

  throw '"$str" can not be parsed to boolean.';
}

double commonWidthHalfButton(BuildContext context) {
  return (MediaQuery.of(context).size.width - 56) / 2;
}

Future<void> commonShowClassDialog(BuildContext context, Widget widget) async {
  showDialog(
      builder: (BuildContext context) {
        return widget;
      },
      context: context);
}

Color commonGetAvailabilityColor(String code) {
  if (code == "1") {
    return CommonHexColor("#F0D099");
  } else if (code == "2") {
    return Colors.orange;
  } else {
    return Colors.black;
  }
}
