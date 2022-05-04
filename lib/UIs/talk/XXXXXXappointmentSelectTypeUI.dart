// import 'package:convas/UIs/talk/XXXXXappointmentSelectTypeProvider.dart';
// import 'package:convas/common/UI/commonButtonUI.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../common/UI/commonOthersUI.dart';
// import '../../common/UI/commonTextUI.dart';
// import '../../common/commonValues.dart';
// import 'appointmentRequestProvider.dart';
//
// class AppointmentSelectType extends ConsumerWidget {
//   String displayedItem;
//   String databaseItem;
//   String value;
//
//   AppointmentSelectType({Key? key,
//     required this.displayedItem,
//     required this.databaseItem,
//     required this.value,
//   }) : super(key: key);
//
//   bool initialProcessFlg =true;
//   List<Widget> checkList = [];
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     checkList=[];
//     if(initialProcessFlg){
//       initialProcessFlg=false;
//       ref.read(appointmentSelectTypeProvider.notifier).initialize(ref, databaseItem, value);
//     }
//
//     checkList.add(
//         CheckboxListTile(
//           title: commonText20GrayLeft(appointmentSelectTypeAlmightyWord),
//           value: ref.watch(appointmentSelectTypeProvider.notifier).allCheck,
//           onChanged: (bool? value) {
//             ref.read(appointmentSelectTypeProvider.notifier).changeAllCheck(value??false);
//           },
//           controlAffinity: ListTileControlAffinity.trailing,
//         ));
//
//     ref.watch(appointmentSelectTypeProvider).masterMap.forEach((key, value) {
//       checkList.add(
//           CheckboxListTile(
//             title: commonText20GrayLeft(value.name),
//             value: ref.watch(appointmentSelectTypeProvider).masterBoolMap[key.toString()],
//             onChanged: (bool? value) {
//               ref.read(appointmentSelectTypeProvider.notifier).setBool(key.toString(),!(value!));
//             },
//             controlAffinity: ListTileControlAffinity.trailing,
//           ));
//     });
//
//     return Scaffold(
//       appBar: commonAppbarWhite(displayedItem),
//       body: SafeArea(
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children:checkList),
//               ),
//             ),
//             commonButtonOrangeRound(text: "OK", onPressed: (){
//               ref.read(appointRequestProvider.notifier).setInfoByMap(ref,databaseItem,ref.watch(appointmentSelectTypeProvider).masterBoolMap);
//               Navigator.pop(context);
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }