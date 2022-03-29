import 'package:convas/UIs/talk/appointmentRequestProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';

class AppointmentRequestMessageEdit extends ConsumerWidget {
  const AppointmentRequestMessageEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar:
      commonAppbarWhite("Message"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding:const EdgeInsets.symmetric(vertical:30,horizontal:10),
                child:TextFormField(
                  maxLines: null,
                  minLines: 7,
                  // テキスト入力のラベルを設定
                  decoration: const InputDecoration(labelText: "Message"),
                  initialValue:ref.watch(appointRequestProvider).requestMessage,
                  onChanged: (String value) {
                    ref.read(appointRequestProvider).setRequestMessage(value);
                  },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30,horizontal: 10),
                child: commonButtonOrangeRound(text:"OK", onPressed: () async{
                  Navigator.pop(context);
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
