import 'package:convas/UIs/myPageRoute/topicRegisterLogic.dart';
import 'package:convas/UIs/myPageRoute/topicRegisterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/UI/commonButtonUI.dart';
import '../../common/UI/commonOthersUI.dart';
import '../../common/UI/commonTextUI.dart';
import '../../common/provider/userProvider.dart';
import '../../daoFirebase/topicsDaoFirebase.dart';

class TopicRegister extends ConsumerWidget {
  TopicRegister({
    Key? key,
  }) : super(key: key) {
    topicEditingController = TextEditingController(text: '');
  }

  TextEditingController? topicEditingController;

  bool initialProcessFlg = true;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if(initialProcessFlg){
      initialProcessFlg=false;
      ref.read(topicRegisterProvider.notifier).initialize(ref);
    }

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Center(
                      child: commonCircleAvatarImage(
                        radius: 80,
                        image:
                        ref.watch(topicRegisterProvider).topicImagePhotoFile == null
                            ? null
                            : Image.file(ref
                            .watch(topicRegisterProvider)
                            .topicImagePhotoFile!),
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () async {
                        await setTopicImage(ref);
                      },
                      child: const Text('Upload photo') //,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: TextFormField(
                      // テキスト入力のラベルを設定
                      decoration: const InputDecoration(labelText: "Topic Name"),
                      controller: topicEditingController,
                      onChanged: (String value) {
                        ref.read(topicRegisterProvider.notifier).setTopicName(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
      Padding(
          padding: const EdgeInsets.only(left:14,right:14,bottom:6),
          child: Container(
            height: 70,
            child:Column(children:[
              SizedBox(
                  width: double.infinity,
                  child: commonText16BlackLeft("Category Name")
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    commonText16BlackLeft(
                      ref.watch(topicRegisterProvider).categoryItemName),
                    Padding(padding:const EdgeInsets.only(left:5),
                      child:GestureDetector(
                          onTap: () async{
                            showDialog<void>(
                              context: context,
                              builder: (_) {
                                return SelectCategoryDialog();
                              },
                            );

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
          ))
                  
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:14.0),
                child: commonButtonOrangeRound(
                  text:"Register",
                  onPressed:() async {
                    if (await checkTopicData(context,ref,ref.watch(topicRegisterProvider).topicName)) {
                      await insertFirebaseTopic(ref,
                          ref.watch(topicRegisterProvider).topicName,
                          ref.watch(topicRegisterProvider).categoryItemDocId,
                        ref.watch(topicRegisterProvider).topicImagePhotoFile,
                          ref.watch(userDataProvider).userData["userDocId"],
                        "topicResister");
                      ref.watch(topicRegisterProvider.notifier)
                          .initialize(ref);

                      topicEditingController =  TextEditingController(text: '');

                      await showOkInfoDialog(context,"data has been inserted");
                    }
                  },),
              )
            ])));
  }

}

class SelectCategoryDialog extends ConsumerWidget {
  SelectCategoryDialog({Key? key}) : super(key: key);


  List<Widget> radioTileList = [];
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    radioTileList=[];
    ref.watch(topicRegisterProvider).categoryMap.forEach((key, value) {
      radioTileList.add(RadioListTile(
          title: Text(value),
          value: key.toString(),
          groupValue: ref.watch(topicRegisterProvider).categoryItemDocId,
          onChanged: (key) => ref.read(topicRegisterProvider.notifier).setCategoryItemDocId(key.toString(),value),
          controlAffinity:ListTileControlAffinity.trailing
      ),);

    });
    final _dialogWidth = MediaQuery.of(context).size.width * 3 / 4; // 画面サイズから相対的に大きさを決めている。
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // SizedBoxでダイアログそのものの大きさをまずは決めています。
      child: SizedBox(
        width: _dialogWidth,
        height: _dialogWidth*1.5,
          child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  border:Border.all(style:BorderStyle.none),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        children:radioTileList
                      ),
                      commonButtonOrangeRound(text: "OK",
                          onPressed: (){
                      Navigator.pop(context);
                      })
                    ]

                  ),
                ),
              ),
            )
      ),
    );
  }
}

