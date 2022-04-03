import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';

Future<String> messageTokenGenerator(String userDocId) async {
  try {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'messageTokenGenerator');

    dynamic resp = await callable.call({'userDocId': userDocId});


    return resp.data['data']['token'];
  } catch (e) {
    log(e.toString());
    return "";
  }
}