import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/model/user_model.dart';
import 'package:tajer/utils/app_constants.dart';

import '../services/login_services.dart';

class LoginController extends GetxController {
  final phoneController = ''.obs;
  final passController = ''.obs;
  UserModel userModel = UserModel();

  Future<UserModel?> login() async {
    var fcmToken = await CacheHelper.getData(key: AppConstants.fcmToken);
    try {
      userModel = (await LoginServices.login(
          phoneController.value, passController.value, fcmToken))!;

      await CacheHelper.saveData(
          key: AppConstants.token, value: userModel.data!.token.toString());
      var xx = await CacheHelper.getData(key: AppConstants.token);
      // print('userModel${userModel.data!.provider!.name}');
      return userModel;
    } catch (error) {
      print('error2');
    }
  }
}
