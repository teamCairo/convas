import 'package:carousel_slider/carousel_slider.dart';
import 'package:convas/UIs/myPageRoute/conceptProvider.dart';
import 'package:convas/common/UI/commonOthersUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Concept extends ConsumerWidget {
  Concept({
    Key? key,
  }) : super(key: key);

  final images = [
    "assets/Slide1.JPG",
    "assets/Slide2.JPG",
    "assets/Slide3.JPG",
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: commonAppbarWhite("Concept"),
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 400,
                      initialPage: 0,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) => ref.read(conceptProvider.notifier).setActiveIndex(index)
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final path = images[index];
                      return buildImage(path, index);
                    },
                  ),
                  const SizedBox(height: 20),
                  buildIndicator(ref)
                ],
              ),
            ),
          )
      ),        floatingActionButton: SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22.0),
      curve: Curves.bounceIn,
      label: const Text("Detail"),
      children: [
        SpeedDialChild(
            child: const Icon(Icons.android_rounded),
            backgroundColor: Colors.orange,
            label: "I'm a supporter",
            onTap: () {
            },
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SpeedDialChild(
            child: const Icon(Icons.cases),
            backgroundColor: Colors.blue,
            label: "I'm a teacher",
            onTap: () {
            },
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SpeedDialChild(
            child: const Icon(Icons.edit),
            backgroundColor: Colors.teal,
            label: "I'm a learner",
            onTap: () {
            },
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    ),
    );
  }

  Widget buildImage(path, index) => Container(
    color: Colors.white,
    child: Image.asset(
      path,
      fit: BoxFit.fitWidth,
    ),
  );

  Widget buildIndicator(WidgetRef ref) => AnimatedSmoothIndicator(
    activeIndex: ref.watch(conceptProvider).activeIndex,
    count: images.length,
    //エフェクトはドキュメントを見た方がわかりやすい
    effect: const JumpingDotEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Colors.green,
        dotColor: Colors.black12),
  );

}