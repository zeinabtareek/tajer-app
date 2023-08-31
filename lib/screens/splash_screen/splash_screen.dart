
import 'dart:async';
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
