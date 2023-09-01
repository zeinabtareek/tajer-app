import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/screens/log_in_screen/login_screen.dart';
import 'package:tajer/screens/splash_screen/services/splah_services.dart';
import 'package:tajer/utils/app_constants.dart';

import '../../home/home.dart';

class SplashController extends BaseController {
  final service = SplashServices();
  var token;
  final firebaseMessaging = FirebaseMessaging.instance;

  @override
  onInit() async {
    super.onInit();
    firebaseMessaging.getToken().then((token) async {
      await CacheHelper.saveData(
          key: AppConstants.fcmToken, value: token.toString());
      print("${CacheHelper.getData(
        key: AppConstants.fcmToken,
      )}");
      // await service.storeFcmToken(fcm: token.toString());
    });

    Timer(const Duration(seconds: 5), () async {
      token = await CacheHelper.getData(key: AppConstants.token) ?? '';
      if (token == '' || token == null) {
        print('token ${token}');
        Get.offAll(() => const LogInScreen());
      } else {
        Get.offAll(() => const Home());
        // Get.offAll(LogInScreen());
      }
    });
  }
}
