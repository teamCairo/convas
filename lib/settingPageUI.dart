import 'package:convas/settingEditDescriptionPageUI.dart';
import 'package:convas/settingEditTextPageUI.dart';
import 'package:convas/settingEditRadioPageUI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/provider/masterProvider.dart';
import 'common/provider/userProvider.dart';



class SettingPage extends ConsumerWidget {
  SettingPage({
    Key? key,
  }) : super(key: key) {
    //コンストラクタ
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
        appBar: commonAppbarWhite("Settings"),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: <Widget>[
                Center(
                  child: imageAvatar(
                    radius: 80,
                      image:ref.watch(userDataProvider).mainPhotoData
                  ),
                ),
                MaterialButton(
                    onPressed: () async{
                      await ref.watch(userDataProvider).setImage(ref);
                    },
                    child: const Text('upload photo') //,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 14.0,bottom: 8),
                    child: black16TextLeft("Greeting")),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(ref.watch(userDataProvider).userData["greeting"],
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black54,),

                      )),),
                Padding(
                    padding: const EdgeInsets.all( 14.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black26,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child:commonButtonOrangeRoundSquareSmall(text:"Edit",
                              onPressed:()async{
                                await Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return SettingEditTextPage(
                                      displayedItem: "Greeting",
                                      databaseItem: "greeting",
                                      value:ref.watch(userDataProvider).userData["greeting"],
                                    );
                                  }),
                                );
                              })
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 14.0,bottom: 8),
                    child: commonText16BlackLeft("Self-Introduction")),
                Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(ref.watch(userDataProvider).userData["description"],
                              overflow: TextOverflow.ellipsis,
                            style:const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black54,),

                        )),
                      ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Container(
                      decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                      ),
                    ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child:commonButtonOrangeRoundSquareSmall(text:"Edit",
                        onPressed:()async{
                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return SettingEditDescriptionPage(
                                value:ref.watch(userDataProvider).userData["description"],
                              );
                            }),
                          );
                        })
                      ),
                    )),

                Padding(
                    padding: const EdgeInsets.only(left: 14.0,bottom: 6),
                    child: commonText16BlackLeft("Personal Info")),
                linePadding(context,ref,"Name","name", ref.watch(userDataProvider).userData["name"]!),
                // linePadding(context,ref,"E-mail","email", ref.watch(userDataProvider).userData["email"]!),
                linePadding(context,ref,"Birth Date","birthDate", ref.watch(userDataProvider).userData["birthDate"]!),
                linePadding(context,ref,"English Level","level", ref.watch(userDataProvider).userData["level"]!),
                linePadding(context,ref,"Occupation","occupation", ref.watch(userDataProvider).userData["occupation"]!),
                linePadding(context,ref,"mother Tongue","motherTongue", ref.watch(userDataProvider).userData["motherTongue"]!),
                linePadding(context,ref,"Country","country", ref.watch(userDataProvider).userData["country"]!),
                linePadding(context,ref,"Town","town", ref.watch(userDataProvider).userData["town"]!),
                linePadding(context,ref,"Home Country","homeCountry", ref.watch(userDataProvider).userData["homeCountry"]!),
                linePadding(context,ref,"Home Town","homeTown", ref.watch(userDataProvider).userData["homeTown"]!),
                linePadding(context,ref,"gender","gender", ref.watch(userDataProvider).userData["gender"]!),
                linePadding(context,ref,"Place I wanna go","placeWannaGo", ref.watch(userDataProvider).userData["placeWannaGo"]!),


              ])),
        ));
  }


  Padding linePadding (BuildContext context,WidgetRef ref,String displayedItem,String databaseItem, dynamic value) {

    String displayedValue;
    if(databaseItem=="gender"){
      displayedValue=ref.watch(masterDataProvider.notifier).genderMasterData[value]!;

    }else if(databaseItem=="level"){
      displayedValue=ref.watch(masterDataProvider.notifier).levelMasterData[value]!;
    }else if(databaseItem=="country"||databaseItem=="homeCountry"){
      displayedValue=ref.watch(masterDataProvider.notifier).countryMasterData[value]!;
    }else if(databaseItem=="motherTongue"){
      displayedValue=ref.watch(masterDataProvider.notifier).languageMasterData[value]!;

    }else if(databaseItem=="birthDate"){

      DateTime birthDate = value;
      displayedValue=birthDate.year.toString()+"/"+birthDate.month.toString()+"/"+birthDate.day.toString();
    }else{
      displayedValue=value;
    }
    return Padding(
        padding: const EdgeInsets.only(left:14,right:14,bottom:6),
        child: Container(
          height: 52,
          child:Column(children:[
            SizedBox(
              width: double.infinity,
              child: commonText12DeepOrangeLeft(displayedItem)
            ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    commonText16BlackLeft(displayedValue),
                    Padding(padding:const EdgeInsets.only(left:5),
                      child:GestureDetector(
                          onTap: () async{

                            if(databaseItem=="gender"
                                ||databaseItem=="level"
                                ||databaseItem=="country"
                                ||databaseItem=="homeCountry"
                                ||databaseItem=="motherTongue"){
                              await Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return SettingEditRadioPage(
                                    displayedItem: displayedItem,
                                    databaseItem: databaseItem,
                                    value:value,
                                  );
                                }),
                              );
                            }else if(databaseItem=="birthDate"){
                              // await Navigator.of(context).push(
                              //   MaterialPageRoute(builder: (context) {
                              //     return SettingEditNumberPage(
                              //       displayedItem: displayedItem,
                              //       databaseItem: databaseItem,
                              //       value:value,
                              //     );
                              //   }),
                              // );
                            }else{
                              await Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return SettingEditTextPage(
                                    displayedItem: displayedItem,
                                    databaseItem: databaseItem,
                                    value:value,
                                  );
                                }),
                              );
                            }
                          },
                          child: const Icon(
                              Icons.edit,
                              color: Colors.black87,
                              size:18
                          )
                      ),)])
          ]),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black26,
                width: 0.5,
              ),
            ),
          ),
        ));
  }
}
