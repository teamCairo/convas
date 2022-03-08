import 'package:convas/common/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'courseRegisterLogic.dart';
import 'courseRegisterProvider.dart';
import 'common/UI/commonUI.dart';
import 'daoFirebase/coursesDaoFirebase.dart';

class CourseRegister extends ConsumerWidget {
  CourseRegister({
    Key? key,
  }) : super(key: key) {
    courseNameEditingController = TextEditingController(text: '');
  }

  TextEditingController? courseNameEditingController;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseName = ref.watch(courseNameProvider);

    return Scaffold(
        body: SafeArea(
            child: Column(children: [
              Center(
                child: imageAvatar(
                    radius: 80,
                    image: ref.watch(courseImagePhotoFileProvider).courseImagePhotoFile==null?
                    null:
                    Image.file(ref.watch(courseImagePhotoFileProvider).courseImagePhotoFile)
                ),
              ),
              MaterialButton(
                  onPressed: () async {
                    await setCourseImage(ref);
                  },
                  child: const Text('select image file') //,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: "Course Name"),
                controller: courseNameEditingController,
                onChanged: (String value) {
                  ref.read(courseNameProvider.state).update((state) => value);
                },
              ),
              const SizedBox(height: 8),
              orangeRoundButton(
                text:"Register",
                onPressed:() async {
                  if (await checkCourseData(context, ref, courseName)) {
                    await insertCourseData(ref, courseName,ref.watch(courseImagePhotoFileProvider).courseImagePhotoFile,"courseResister",ref.watch(userDataProvider).userData["userDocId"]);

                    ref.read(courseNameProvider.state).update((state) => "");
                    courseNameEditingController = TextEditingController(text: '');

                    ref.watch(courseImagePhotoFileProvider.notifier)
                        .clearCourseImagePhotoFile();

                    await showOkInfoDialog(context,"data has been inserted");
                  }
                },)
            ])));
  }
}
