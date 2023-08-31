import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/style.dart';
import '../screens/home_screen/home_screen.dart';

class CustomNotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      shadowColor: Colors.blueAccent,
      elevation: 5,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: const ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            child: Center(
                child: Container(
              width: 10 * 4.0,
              height: MediaQuery.of(context).size.height / 10,
              padding: EdgeInsets.all(7.sp),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: K.semiDarkRed,
                    width: MediaQuery.of(context).size.width / 10.w,
                  ),
                ),
              ),
              child: Icon(
                Icons.favorite,
                color: K.whiteColor,
              ),
            )),
          ),
          Expanded(
            child: ClipPath(
              clipper: const ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              child: Container(
                width: 10,
                height: MediaQuery.of(context).size.height / 10,
                color: K.lightMainColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: MainAxisAlignment.start,
                    children: [
                      K.sizedboxW,
                      ClipOval(
                        child: Image.asset(
                          'assets/images/test.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      K.sizedboxW,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'سينابون ومشروب فقط ب 100  ',
                            // style: K.boldBlackSmallText,
                          ),
                          // K.sizedboxH,
                          RichText(
                            text: TextSpan(
                              text: ' ',
                              style: K.redTextStyle,
                              // children:<InlineSpan> [
                              children: [
                                TextSpan(
                                  // text: 'عرض 2 ',
                                  text: '\$100 ',
                                  style: K.boldBlackSmallText,
                                  // style:K.redTextStyle,
                                ),
                                // K.sizedboxW,
                                WidgetSpan(
                                  child: CustomSlopText(
                                    text: '  200 ',
                                    color: K.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        // ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

// ClipPath(
//   clipper: ShapeBorderClipper(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15))),
//   child: Container(
//       height: MediaQuery.of(context).size.height / 10,
//       decoration: BoxDecoration(
//         border:
//             Border(right: BorderSide(color: K.semiDarkRed, width: 40.w)),
//         color: K.lightMainColor,
//       ),
//       padding: EdgeInsets.all(20.0),
//       alignment: Alignment.centerLeft,
//       child: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ClipOval(
//               child: Image.asset(
//                 'assets/images/test.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // K.sizedboxW,
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'سينابون ومشروب فقط ب 100  ',
//                   // style: K.boldBlackSmallText,
//                 ),
//                 // K.sizedboxH,
//                 RichText(
//                   text: TextSpan(
//                     text: ' ',
//                     style:K.redTextStyle,
//                     // children:<InlineSpan> [
//                     children: [
//                       TextSpan(
//                         // text: 'عرض 2 ',
//                         text: '\$100 ',
//                         style:K.boldBlackSmallText,
//                         // style:K.redTextStyle,
//                       ),
//                       // K.sizedboxW,
//                       WidgetSpan(
//                         child: CustomSlopText(text:  '  200 ',color: K.primaryColor,) ,
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             K.sizedboxW,
//
//           ],
//         ),
//       )),
// ),
}

// }
// class
// class CustomNotificationCard   extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
//   return Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     shadowColor: Colors.blueAccent,
//     elevation: 5,
//     child: ClipPath(
//       clipper: ShapeBorderClipper(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       child: Container(
//         height: MediaQuery.of(context).size.height / 10,
//         decoration: BoxDecoration(
//           color: K.lightMainColor,
//         ),
//         alignment: Alignment.centerLeft,
//         child: Stack(
//           children: [
//             Positioned(
//               right: 0,
//               top: 0,
//               bottom: 0,
//               child: Container(
//                 width: 40.w,
//                 decoration: BoxDecoration(
//                   border: Border(
//                     right: BorderSide(
//                       color: K.semiDarkRed,
//                       width: 40.w,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ClipOval(
//                     child: Image.asset(
//                       'assets/images/test.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'سينابون ومشروب فقط ب 100  ',
//                       ),
//                       RichText(
//                         text: TextSpan(
//                           text: ' ',
//                           children: [
//                             TextSpan(
//                               text: '\$100 ',
//                               style: K.boldBlackSmallText,
//                             ),
//                             WidgetSpan(
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.notifications,
//                                     size: 16,
//                                     color: K.primaryColor,
//                                   ),
//                                   SizedBox(width: 4),
//                                   CustomSlopText(
//                                     text: '200',
//                                     color: K.primaryColor,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }
