import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

const int searchConditionAgeMin = 18;
const int searchConditionAgeMax = 100;
const Color themeColorDeep = Colors.orangeAccent;

const platformForCallKotlin = MethodChannel('app.com.convas/app');

const searchUsersImageLoadExtraNumber = 5;

const mediaQueryScreenHeightCoefficient = 0.0011;

const separatingCharacter = ", ";

const searchConditionLastLoginInDays = 365;

const searchConditionAlmightyWord="Doesn't matter";


const appointmentSelectTypeAlmightyWord="Anything";

const enterRoomMessage="Entered the call room";

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
const calendarTimelineMaxPeople =10;

const List<Color> calendarTimelineColors = [Color(0xFF0F8644),
  Color(0xFFF0F000),
  Color(0xF22040D0),
  Color(0xF540F000),
  Color(0xFFF0F000),
  Color(0xF22040D0),
  Color(0xF540F000),
  Color(0xFFF0F000),
  Color(0xF22040D0),
  Color(0xF540F000),
];

const Color calendarColorForMe = Colors.orangeAccent;


const separatingCharacter5at = "@@@@@";

const eventNameForAppointment = "call appointment";