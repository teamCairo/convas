import 'package:convas/UIs/register/registerProvider.dart';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:convas/common/UI/commonTextUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonPushUI.dart';
import 'dataPrepareingUI.dart';
import 'package:intl/intl.dart';


class RegisterBirthDateAndGender extends ConsumerWidget {
  const RegisterBirthDateAndGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String birthDatetext="";
    if(ref.watch(registerProvider).birthDate==null){
      birthDatetext="Add your birthdate";
    }else{
      DateFormat outputFormat = DateFormat('yyyy/MM/dd');
      birthDatetext = outputFormat.format(ref.watch(registerProvider).birthDate!);
    }

    return Scaffold(
      appBar: commonAppbar(""),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      commonText24BlackBoldCenter("Set your Info for other teachers and learners!!"),
                      const SizedBox(height: 20),
                    ],
                  ),

                  Column(
                    children: [
                      commonText24BlackBoldLeft("Your gender"),
                      const SizedBox(height: 8),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            genderButton("1", 'Male', Icons.male, ref),
                            genderButton("2", 'Female', Icons.female, ref),
                          ]
                      ),
                      const SizedBox(height: 8),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            genderButton("3", 'Others', Icons.crop_square_sharp, ref),
                            genderButton("4", 'Secret', Icons.lock_outline_rounded, ref),
                          ]
                      )
                    ],
                  ),
                  levelArea(ref),
                  Column(
                    children: [
                      commonText24BlackBoldLeft("Your birthday"),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:commonButtonWhiteBorderRound(
                          text: birthDatetext,
                          onPressed: () async {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1930, 1, 1),
                                maxTime: DateTime.now(),
                                onConfirm: (date) {

                              ref.read(registerProvider.notifier).setBirthDate(date);

                                },
                                currentTime: ref.watch(registerProvider).birthDate??DateTime.now(), locale: LocaleType.en
                            );

                          },),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:commonButtonOrangeRound(
                      text: "OK",
                      onPressed: ()  {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const DataPreparing();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                            },
                          ),
                        );
                      },),),

                ]),
          )),
    );
  }
}

Widget genderButton(String genderCode, String genderName, IconData iconData, WidgetRef ref){

  if(ref.watch(registerProvider).gender==genderCode){

    return commonIconButtonSmallOrangeRound(
        size:const Size(130,40),
        onPressed: () {
          ref.read(registerProvider.notifier).setGender(genderCode);
        },
        text: genderName,
        iconData: iconData);

  }else{

    return commonIconButtonSmallWhiteBorderRound(
        size:const Size(130,40),
        onPressed: () {
          ref.read(registerProvider.notifier).setGender(genderCode);
        },
        text: genderName,
        iconData: iconData);

  }
}

Widget levelArea(WidgetRef ref){

  if(ref.watch(registerProvider).userType=="1"){
    return
      Column(
        children: [
          commonText24BlackBoldLeft("Your English level"),
          const SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                levelButton("1", 'Beginner', Icons.looks_one, ref),
                levelButton("2", 'Intermediate', Icons.looks_two, ref),
              ]
          ),
          const SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                levelButton("3", 'Advanced', Icons.looks_3, ref),
                levelButton("4", 'Native', Icons.looks_4, ref),
              ]
          )
        ],
      );
  }else{
    return Container();
  }
}


Widget levelButton(String levelCode, String levelName, IconData iconData, WidgetRef ref){

  if(ref.watch(registerProvider).level==levelCode){

    return commonIconButtonSmallOrangeRound(
        size:const Size(130,40),
        onPressed: () {
          ref.read(registerProvider.notifier).setLevel(levelCode);
        },
        text: levelName,
        iconData: iconData);

  }else{

    return commonIconButtonSmallWhiteBorderRound(
        size:const Size(130,40),
        onPressed: () {
          ref.read(registerProvider.notifier).setLevel(levelCode);
        },
        text: levelName,
        iconData: iconData);

  }

}