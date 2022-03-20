import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

const int searchConditionAgeMin = 18;
const int searchConditionAgeMax = 100;
const Color themeColorDeep = Colors.orangeAccent;

const platformForCallKotlin = MethodChannel('app.com.convas/app');

const searchUsersImageLoadExtraNumber = 5;


const separatingCharacter = ", ";

const searchConditionLastLoginInDays = 365;

const searchConditionAlmightyWord="Doesn't matter";

const LinearGradient commonLinearGradientForChatBox = LinearGradient(
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    colors: [
      Color.fromARGB(255, 108, 132, 235),
      Color.fromARGB(255, 132, 199, 250),
    ],
    stops: [
      0.0,
      1.0,
    ]);