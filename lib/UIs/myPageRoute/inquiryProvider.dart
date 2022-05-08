import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../daoFirebase/inquiryDaoFirebase.dart';

final inquiryProvider = ChangeNotifierProvider(
      (ref) => InquiryNotifier(),
);
class InquiryNotifier extends ChangeNotifier {

  String _inquiryType = "";
  String get inquiryType => _inquiryType;

  String _inquiryCategory = "";
  String get inquiryCategory => _inquiryCategory;

  String _freeText = "";
  String get freeText => _freeText;

  String _reportedUserDocId = "";
  String get reportedUserDocId => _reportedUserDocId;

  void initialize() async {
    _inquiryType = "";
    _inquiryCategory = "";
    _freeText = "";
    _reportedUserDocId="";
  }

  void setReportedUserDocId(String userDocId){
    _reportedUserDocId=userDocId;
  }
  void setInquiryTypeWithoutRebuild(String code){
    _inquiryType=code;
  }

  void setInquiryCategory(String code){
    _inquiryCategory=code;
  }

  void setFreeTextWithoutRebuild(String text){
    _freeText=text;
  }

  Future<String> insertInquiry(WidgetRef ref)async{
    return await insertInquiryData(ref:ref,
      inquiryType: _inquiryType,
      inquiryCategory:_inquiryCategory ,
      freeText:_freeText ,
      reportedUserDocId:_reportedUserDocId ,
      programId: "inquiryDetail"
    );
  }

}