import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/model/user_model.dart';
import 'package:tajer/utils/app_constants.dart';

import '../../../helpers/connectivity.dart';
import '../../../helpers/logger/logger.dart';
import '../../../utils/action_center/action_center.dart';
import '../../../utils/overlay_helper.dart';
import '../services/login_services.dart';

class LoginController extends GetxController {
  final phoneController = ''.obs;
  final passController = ''.obs;
  final isLoadings = false.obs;
  UserModel userModel = UserModel();
  final connection = Get.put(ConnectionStatusSingleton());

  Future<UserModel?> login() async {

      isLoadings.value = true;
    var fcmToken = await CacheHelper.getData(key: AppConstants.fcmToken);
    try {

      userModel = (await LoginServices.login(
          phoneController.value, passController.value, fcmToken))!;

      await CacheHelper.saveData(
          key: AppConstants.token, value: userModel.data!.token.toString());
      var xx = await CacheHelper.getData(key: AppConstants.token);
   return userModel;

    } catch (error) {
      print('error2 $error');
    }

    isLoadings.value = false;
  }
  // }
}
