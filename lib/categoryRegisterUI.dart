import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'categoryRegisterLogic.dart';
import 'categoryRegisterProvider.dart';
import 'common/UI/commonButtonUI.dart';
import 'common/UI/commonOthersUI.dart';
import 'daoFirebase/categoriesDaoFirebase.dart';

class CategoryRegister extends ConsumerWidget {
  CategoryRegister({
    Key? key,
  }) : super(key: key) {
    categoryNameEditingController = TextEditingController(text: '');
  }

  TextEditingController? categoryNameEditingController;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryName = ref.watch(categoryNameProvider);

    return Scaffold(
        body: SafeArea(
            child: Column(children: [
              Center(
                child: imageAvatar(
                  radius: 80,
                  image: ref.watch(categoryImagePhotoFileProvider).categoryImagePhotoFile==null?
                  null:
                  Image.file(ref.watch(categoryImagePhotoFileProvider).categoryImagePhotoFile)
                ),
              ),
              MaterialButton(
                  onPressed: () async {
                    await setCategoryImage(ref);
                  },
                  child: const Text('select image file') //,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: "Category Name"),
                controller: categoryNameEditingController,
                onChanged: (String value) {
                  ref.read(categoryNameProvider.state).update((state) => value);
                },
              ),
              const SizedBox(height: 8),
              orangeRoundButton(
                    text:"Register",
                  onPressed:() async {
                    if (await checkCategoryData(context, ref, categoryName)) {
                      await insertFirebaseCategory(ref, categoryName,ref.watch(categoryImagePhotoFileProvider).categoryImagePhotoFile,"categoryResister",ref.watch(userDataProvider).userData["userDocId"]);

                      ref.read(categoryNameProvider.state).update((state) => "");
                      categoryNameEditingController = TextEditingController(text: '');

                      ref.watch(categoryImagePhotoFileProvider.notifier)
                          .clearCategoryImagePhotoFile();

                      await showOkInfoDialog(context,"data has been inserted");
                    }
                  },)
            ])));
  }
}
