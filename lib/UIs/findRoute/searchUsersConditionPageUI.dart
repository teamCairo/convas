import 'package:convas/common/UI/commonButtonUI.dart';
import 'package:convas/UIs/findRoute/searchUsersConditionEditNumberDialogUI.dart';
import 'package:convas/UIs/findRoute/searchUsersConditionEditRadioUI.dart';
import 'package:convas/UIs/findRoute/searchUsersConditionEditTypeUI.dart';
import 'package:convas/UIs/findRoute/searchUsersProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonPushUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/logic/commonLogicList.dart';

class SearchUsersConditionPage extends ConsumerWidget {
  const SearchUsersConditionPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        appBar: commonAppbar("Search conditions"),
        body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: <Widget>[
                    linePadding(context,ref,"Age","searchConditionAge", ref.watch(searchUsersProvider).tmpSearchConditionAge),
                    // linePadding(context,ref,"Level","searchConditionLevel", ref.watch(searchUsersProvider).tmpSearchConditionLevel),
                    // linePadding(context,ref,"Mother tongue","searchConditionMotherTongue", ref.watch(searchUsersProvider).tmpSearchConditionMotherTongue),
                    linePadding(context,ref,"Country","searchConditionCountry", ref.watch(searchUsersProvider).tmpSearchConditionCountry),
                    linePadding(context,ref,"Gender","searchConditionGender", ref.watch(searchUsersProvider).tmpSearchConditionGender),
                    linePadding(context,ref,"Home Country","searchConditionHomeCountry", ref.watch(searchUsersProvider).tmpSearchConditionHomeCountry),
                    // linePadding(context,ref,"Last login","searchConditionLoginTime", ref.watch(searchUsersProvider).tmpSearchConditionLoginTime),
                    // linePadding(context,ref,"Favorite categories","searchConditionCategories", ref.watch(searchUsersProvider).tmpSearchConditionCategories),
                    // linePadding(context,ref,"Favorite courses","searchConditionCourses", ref.watch(searchUsersProvider).tmpSearchConditionCourses),
                    // linePadding(context,ref,"Teacher/User","searchConditionUserType", ref.watch(searchUsersProvider).tmpSearchConditionUserType),

                  ]),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        commonButtonGrayRound(width:(MediaQuery.of(context).size.width - 56) / 2,
                            text: "Reset",
                            onPressed: (){
                              ref.read(searchUsersProvider.notifier).resetConditions(ref);
                            }),
                        commonHorizontalGap(),
                        commonButtonSecondaryColorRound(text: "Search",
                            onPressed: (){
                              ref.read(searchUsersProvider.notifier).setSearchProcessingFlgTrue();
                              ref.read(searchUsersProvider.notifier).setConditionsToFirebaseAndSearchUsers(ref);
                              Navigator.pop(context);
                            },
                        width:(MediaQuery.of(context).size.width - 56) / 2),
                      ],
                    ),
                  )
                ],
              )),);
  }

  Widget linePadding (BuildContext context,WidgetRef ref,String displayedItem,String databaseItem, String value) {

    String displayedValue;
    List<String> tmpList = fromTextToList(value);

    switch (databaseItem) {
      case "searchConditionAge":
        displayedValue = tmpList[0]+"～"+tmpList[1];
        break;

      case "searchConditionLevel":

        if(value==""){
          displayedValue="Any level";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"level", ref);
        }
        break;

      case "searchConditionMotherTongue":
        if(value==""){
          displayedValue="Any language";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"language", ref);
        }
        break;

      case "searchConditionCountry":
        if(value==""){
          displayedValue="Any country";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"country", ref);
        }
        break;

      case "searchConditionGender":
        if(value==""){
          displayedValue="Any gender";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"gender", ref);
        }
        break;

      case "searchConditionHomeCountry":
        if(value==""){
          displayedValue="Any country";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"country", ref);
        }
        break;

      case "searchConditionLoginTime":
        if(value==""){
          displayedValue="Any time";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"lastLogin", ref);
        }
        break;

      case "searchConditionCategories":
        if(value==""){
          displayedValue="Any category";
        }else{
          displayedValue = fromListToTextDot(masterNameListFromText(ref.watch(searchUsersProvider).tmpSearchConditionCategories,"category",ref));
        }
        break;

      case "searchConditionCourses":
        if(value==""){
          displayedValue="Any course";
        }else{
          displayedValue = fromListToTextDot(masterNameListFromText(ref.watch(searchUsersProvider).tmpSearchConditionCourses,"course",ref));
        }
        break;

      case "searchConditionUserType":
        if(value==""){
          displayedValue="Any type";
        }else{
          displayedValue = fromCodeListToTextDot(tmpList,"userType", ref);
        }
        break;

      default:
        displayedValue = "";
        break;
    }

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal:20,vertical:16),
            child: GestureDetector(
              onTap:(){

                if(databaseItem=="searchConditionAge"){

                  showDialog<void>(
                    context: context,
                    builder: (_) {
                      return SearchUsersConditionEditNumberDialog(displayedItem: displayedItem, databaseItem: databaseItem, value: value);
                    },
                  );

                }else if(databaseItem=="searchConditionLoginTime"){

                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return  SearchConditionValueEditRadio(displayedItem: displayedItem, databaseItem: databaseItem, value: value);
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                      },
                    ),
                  );

              }else{

                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return  SearchConditionValueEditType(displayedItem: displayedItem, databaseItem: databaseItem, value: value);
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return commonFunctionPushSlideHorizon(context, animation, secondaryAnimation, child);
                      },
                    ),
                  );
                }
                },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    black16TextLeft(displayedItem),
                    commonText16GrayRightEllipsis(displayedValue)
                    // gray16TextRightEllipsis(displayedValue,200)
              ]),
            )),
        commonLineHorizontalGrayThin(0,0)
      ],
    );
  }
}
