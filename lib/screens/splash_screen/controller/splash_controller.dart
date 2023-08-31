import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/screens/log_in_screen/login_screen.dart';
import 'package:tajer/utils/app_constants.dart';

import '../../home/home.dart';

class SplashController extends GetxController {
  var token;
  final firebaseMessaging=FirebaseMessaging.instance;

  @override
  onInit() async {
    super.onInit();


    firebaseMessaging. getToken().then((token) async {
      await CacheHelper.saveData   ( key: AppConstants.fcmToken, value: token.toString());
      print("fcmToken is $token");
      print("${CacheHelper.getData(key: AppConstants.fcmToken,) }");
     });



    Timer(const Duration(seconds: 5), () async {
      token = await CacheHelper.getData(key: AppConstants.token) ?? '';
      if (token == '' || token == null) {
        print('token ${token}');
        Get.offAll(() => LogInScreen());
      } else {
        Get.offAll(() => Home());
        // Get.offAll(LogInScreen());
      }
    });
  }
}
