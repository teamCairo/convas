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
import 'package:flutter/cupertino.dart';

Widget commonFunctionPushSlideHorizon(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
  final Offset begin = const Offset(1.0, 0.0); // 右から左
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