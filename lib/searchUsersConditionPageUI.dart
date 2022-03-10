import 'dart:async';
import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/searchUsersConditionEditNumberDialogUI.dart';
import 'package:convas/searchUsersConditionEditTypeUI.dart';
import 'package:convas/searchUsersProvider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'common/UI/commonOthersUI.dart';
import 'common/UI/commonTextUI.dart';
import 'common/logic/commonLogic.dart';

class SearchUsersConditionPage extends ConsumerWidget {
  const SearchUsersConditionPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        appBar: whiteAppbar("Search conditions"),
        body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: <Widget>[
                    linePadding(context,ref,"Age","searchConditionAge", ref.watch(searchUsersProvider).tmpSearchConditionAge),
                    linePadding(context,ref,"Level","searchConditionLevel", ref.watch(searchUsersProvider).tmpSearchConditionLevel),
                    linePadding(context,ref,"Mother tongue","searchConditionMotherTongue", ref.watch(searchUsersProvider).tmpSearchConditionMotherTongue),
                    linePadding(context,ref,"Country","searchConditionCountry", ref.watch(searchUsersProvider).tmpSearchConditionCountry),
                    linePadding(context,ref,"Gender","searchConditionGender", ref.watch(searchUsersProvider).tmpSearchConditionGender),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        roundHalfButton(text: "Reset",
                            color:Colors.black38,
                            onPressed: (){
                              ref.read(searchUsersProvider.notifier).resetConditions(ref);
                            }),
                        roundHalfButton(text: "Search",
                            color:Colors.orange,
                            onPressed: (){
                              ref.read(searchUsersProvider.notifier).setSearchProcessingFlgTrue();
                              ref.read(searchUsersProvider.notifier).setConditionsToFirebaseAndSearchUsers(ref);
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  )
                ],
              )),);
  }

  Padding linePadding (BuildContext context,WidgetRef ref,String displayedItem,String databaseItem, String value) {

    String displayedValue;
    List<String> tmpList = fromTextToList(value);

    switch (databaseItem) {
      case "searchConditionAge":
        displayedValue = tmpList[0]+"～"+tmpList[1];
        break;

      case "searchConditionLevel":

        if(value==""){
          displayedValue="All level";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"level", ref);
        }
        break;

      case "searchConditionMotherTongue":
        if(value==""){
          displayedValue="All language";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"language", ref);
        }
        break;

      case "searchConditionCountry":
        if(value==""){
          displayedValue="All country";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"country", ref);
        }
        break;

      case "searchConditionGender":
        if(value==""){
          displayedValue="All gender";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"gender", ref);
        }
        break;
      default:
        displayedValue = "";
        break;
    }

    return Padding(
        padding: const EdgeInsets.only(left:14,right:14,bottom:0),
        child: GestureDetector(
          onTap:(){

            if(databaseItem=="searchConditionAge"){

           showDialog<void>(
            context: context,
            builder: (_) {
            return SearchUsersConditionEditNumberDialog(displayedItem: displayedItem, databaseItem: databaseItem, value: value);
            },
            );

          }else{
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return  SearchConditionValueEditType(displayedItem: displayedItem, databaseItem: databaseItem, value: value);
                }),
              );
            }
            },
          child: Container(
            child:Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    black16TextLeft(displayedItem),
                    gray16TextRightEllipsis(displayedValue,200)
              ]),
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 0.5,
                ),
              ),
            ),
          ),
        ));
  }
}
