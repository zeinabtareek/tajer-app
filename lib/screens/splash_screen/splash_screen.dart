
import 'dart:async';
 import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/screens/log_in_screen/login_screen.dart';
import 'package:tajer/screens/splash_screen/controller/splash_controller.dart';

import '../../constants/style.dart';
import '../home/home.dart';

 class SplashScreen extends StatelessWidget {
    SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SplashController());
     return Scaffold(
       backgroundColor: K.whiteColor,
       body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  SizedBox(
              height: 300.h,
                 child: Image.asset('assets/images/logo.png'),
                 ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 100,
              child: RotatedBox(
                quarterTurns: 2,
                child: LinearProgressIndicator(
                  minHeight: 3,
                  color: K.darkRed.withOpacity(.4),
                  backgroundColor: K.primaryColor.withOpacity(.5),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}



// class SplashScreen extends StatefulWidget {
//     SplashScreen({Key? key}) : super(key: key);
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
// //State cl
//     int _page = 0;
//     GlobalKey _bottomNavigationKey = GlobalKey();
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//           extendBody: true,
//         bottomNavigationBar: CurvedNavigationBar(
//           color: Colors.white,
//           backgroundColor: Colors.transparent,
//           buttonBackgroundColor: Colors.white,
//           height: 50.0,
//           index: 1,
//           animationDuration: Duration(
//             milliseconds: 200,
//           ),
//           animationCurve: Curves.bounceIn,
//           items: <Widget>[
//             Icon(Icons.verified_user, size: 20.0),
//             Icon(Icons.add, size: 20.0),
//             Icon(Icons.watch_later, size: 20.0),
//           ],
//           onTap: (index) {
//             debugPrint('Any function you want to do example: navigate to screen');
//           },
//         ),
//         body: Container(
//             color: Colors.transparent,
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     Text(_page.toString(), textScaleFactor: 10.0),
//                     // RaisedButton(
//                     //   child: Text('Go To Page of index 1'),
//                     //   onPressed: () {
//                     //     final CurvedNavigationBarState navBarState =
//                     //         _bottomNavigationKey.currentState;
//                     //     navBarState.setPage(1);
//                     //   },
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ));
//     }
// }