import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'categoryRegisterUI.dart';
import 'courseRegisterUI.dart';
// import 'topicRegisterUI.dart';

class DeveloperPage extends ConsumerWidget {
  const DeveloperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     await Navigator.of(context).push(
                  //       MaterialPageRoute(builder: (context) {
                  //         return Daily();
                  //       }),
                  //     );
                  //   },
                  //   child: Text(
                  //     "Write daily",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     await Navigator.of(context).push(
                  //       MaterialPageRoute(builder: (context) {
                  //         return TopicRegister();
                  //       }),
                  //     );
                  //   },
                  //   child: Text(
                  //     "トピックマスタ登録画面",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return CategoryRegister();
                        }),
                      );
                    },
                    child: Text(
                      "Register category",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return CourseRegister();
                      }),
                    );
                  },
                  child: Text(
                    "Register course",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                  // const SizedBox(height: 8),
                  // Container(
                  //   width: double.infinity,
                  //   child: OutlinedButton(
                  //     child: Text('InsertTestUserData'),
                  //     onPressed: () {
                  //       insertTestUserData(ref);
                  //     },
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //
                  //     await closeStreams(ref);
                  //     await FirebaseAuth.instance.signOut();
                  //     // ログイン画面に遷移＋チャット画面を破棄
                  //     await Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(builder: (context) {
                  //         return LoginPage();
                  //       }),
                  //     );
                  //   },
                  //   child: Text(
                  //     "Logout",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     ref.read(categoryDataProvider.notifier)
                  //         .clearIsar();
                  //   },
                  //   child: Text(
                  //     "clearLocalCategoryData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     ref.read(topicDataProvider.notifier)
                  //         .clearIsar();
                  //   },
                  //   child: Text(
                  //     "clearLocalTopicData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     ref.read(friendDataProvider.notifier)
                  //         .clearHiveAndMemoryAndDirectory();
                  //   },
                  //   child: Text(
                  //     "clearLocalFriendData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     ref.read(userDataProvider.notifier)
                  //         .clearHiveAndMemoryAndDirectory();
                  //   },
                  //   child: Text(
                  //     "clearLocalUserData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     ref.read(chatMessagesDataProvider.notifier)
                  //         .clearIsarAndDirectory();
                  //   },
                  //   child: Text(
                  //     "clearMessageData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     ref.read(countryDataProvider.notifier)
                  //         .clearIsar();
                  //   },
                  //   child: Text(
                  //     "clearLocalCountryData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     insertTestTopicData(ref);
                  //   },
                  //   child: Text(
                  //     "insertTestTopicData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     insertTestCategoryData(ref);
                  //   },
                  //   child: Text(
                  //     "insertTestCategoryData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     insertTestCountryData(ref);
                  //   },
                  //   child: Text(
                  //     "insertTestCountryData",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   style: ButtonStyle(),
                  //   onPressed: () async {
                  //     await Navigator.of(context).push(
                  //       MaterialPageRoute(builder: (context) {
                  //         return Calendar();
                  //       }),
                  //     );
                  //   },
                  //   child: Text(
                  //     "Calendar",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // Text("本人認証")
                ]),
            )));
  }
}
