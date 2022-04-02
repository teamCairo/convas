
import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
//https://supunawa.medium.com/agora-voice-video-calls-with-cloud-functions-in-flutter-c7dc4243af9a
Future<String> callTokenGenerator(String channelId) async{
  try{
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('callTokenGenerator');

    dynamic resp=await callable.call({'channelId': channelId });


    return resp.data['data']['token'];
  }catch(e){
    log(e.toString());
    return "";
  }
}