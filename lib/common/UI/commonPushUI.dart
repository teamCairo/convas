// import 'package:flutter/cupertino.dart';
//
// void commonPushSlide({required BuildContext context, required Widget Function returnNewPage}){
//
//   Navigator.of(context).push(
//     PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) {
//          returnNewPage;
//       },
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final Offset begin = const Offset(1.0, 0.0); // 右から左
//         // final Offset begin = Offset(-1.0, 0.0); // 左から右
//         const Offset end = Offset.zero;
//         final Animatable<Offset> tween = Tween(begin: begin, end: end)
//             .chain(CurveTween(curve: Curves.easeInOut));
//         final Animation<Offset> offsetAnimation = animation.drive(tween);
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     ),
//   );
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



Widget commonFunctionPushSlideHorizon(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
  const Offset begin = Offset(1.0, 0.0); // 右から左
  // final Offset begin = Offset(-1.0, 0.0); // 左から右
  const Offset end = Offset.zero;
  final Animatable<Offset> tween = Tween(begin: begin, end: end)
      .chain(CurveTween(curve: Curves.easeInOut));
  final Animation<Offset> offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );

}

Widget commonFunctionPushSlideBottomToTop(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
  const Offset begin = Offset(0.0, 1.0); // 下から上
  // final Offset begin = Offset(-1.0, 0.0); // 左から右
  const Offset end = Offset.zero;
  final Animatable<Offset> tween = Tween(begin: begin, end: end)
      .chain(CurveTween(curve: Curves.easeInOut));
  final Animation<Offset> offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );

}

Future<void>  commonNavigatorPushPushSlideHorizonReplacement(BuildContext context, Widget  widget)async{
  await Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
        // return const SetUserType();
      },
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) {
        return commonFunctionPushSlideHorizon(
            context, animation, secondaryAnimation, child);
      },
    ),
  );
}
Future<void>  commonNavigatorPushSlideHorizon(BuildContext context, Widget  widget)async{
  await Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
        // return const SetUserType();
      },
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) {
        return commonFunctionPushSlideHorizon(
            context, animation, secondaryAnimation, child);
      },
    ),
  );
}


Future<void> commonNavigatorPush(BuildContext context, Widget  widget)async{
  await Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
  );

}

Widget buildImageForSlide(path, index) => Container(
  color: Colors.white,
  child: Image.asset(
    path,
    fit: BoxFit.fitWidth,
  ),
);

Widget buildIndicatorForSlide(WidgetRef ref, int count) => AnimatedSmoothIndicator(
  activeIndex: ref.watch(conceptForSlideProvider).activeIndex,
  count: count,
  //エフェクトはドキュメントを見た方がわかりやすい
  effect: const JumpingDotEffect(
      dotHeight: 10,
      dotWidth: 10,
      activeDotColor: Colors.green,
      dotColor: Colors.black12),
);

CarouselSlider carouselSliderBuilderForSlide(WidgetRef ref, List<String> images,double screenWidth){
  return CarouselSlider.builder(
    options: CarouselOptions(
        // height: 400,
        height:screenWidth*0.8*0.9,
        initialPage: 0,
        viewportFraction: 1,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) =>
            ref.read(conceptForSlideProvider.notifier).setActiveIndex(index)),
    itemCount: images.length,
    itemBuilder: (context, index, realIndex) {
      final path = images[index];
      return buildImageForSlide(path, index);
    },
  );
}

final conceptForSlideProvider = ChangeNotifierProvider(
      (ref) => ConceptForSlideNotifier(),
);
class ConceptForSlideNotifier extends ChangeNotifier {

  int _activeIndex =0;
  get activeIndex => _activeIndex;

  setActiveIndex(int index){
    _activeIndex=index;
    notifyListeners();
  }


  initialize(){
    _activeIndex=0;
  }

}

