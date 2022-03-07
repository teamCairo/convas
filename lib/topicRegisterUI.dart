import 'package:convas/topicRegisterLogic.dart';
import 'package:convas/topicRegisterProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/UI/commonUI.dart';
import 'common/provider/userProvider.dart';
import 'daoFirebase/topicsDaoFirebase.dart';

class TopicRegister extends ConsumerWidget {
  TopicRegister({
    Key? key,
  }) : super(key: key) {
    topicEditingController = TextEditingController(text: '');
  }

  TextEditingController? topicEditingController;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicName = ref.watch(topicNameProvider);

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
                      child: imageAvatar(
                        radius: 80,
                        image:
                        ref.watch(topicImagePhotoFileProvider).topicImagePhotoFile == null
                            ? null
                            : Image.file(ref
                            .watch(topicImagePhotoFileProvider)
                            .topicImagePhotoFile!),
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () async {
                        await setTopicImage(ref);
                      },
                      child: const Text('写真アップロード') //,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: TextFormField(
                      // テキスト入力のラベルを設定
                      decoration: const InputDecoration(labelText: "Topic Name"),
                      controller: topicEditingController,
                      onChanged: (String value) {
                        ref.read(topicNameProvider.state).update((state) => value);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton(
                    items: ref.watch(categoryItemsProvider).categoryItems,
                    value: ref.watch(categoryItemsProvider).selectedCategoryItem,
                    onChanged: (value) => {
                      ref
                          .watch(categoryItemsProvider.notifier)
                          .setCategoryItemId(value.toString())
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:14.0),
                child: orangeRoundButton(
                  text:"Register",
                  onPressed:() async {
                    if (await checkTopicData(context,ref,ref.watch(topicNameProvider))) {
                      await insertTopic(ref,
                        topicName,
                        ref.watch(categoryItemsProvider).selectedCategoryItem,
                        ref.watch(topicImagePhotoFileProvider).topicImagePhotoFile,
                          ref.watch(userDataProvider).userData["userDocId"],
                        "topicResister");
                      ref.watch(categoryItemsProvider.notifier)
                          .clearCategoryItemsNotifier();

                      ref.read(topicNameProvider.state).update((state) => "");
                      topicEditingController =  TextEditingController(text: '');

                      ref.watch(topicImagePhotoFileProvider.notifier)
                          .clearTopicImagePhotoFile();

                      await showOkInfoDialog(context,"data has been inserted");
                    }
                  },),
              )
            ])));
  }

}
