import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/utils/app_constants.dart';

import '../../../model/user_model.dart';
import '../../../utils/overlay_helper.dart';
import '../../home/home.dart';

class LoginServices {
  final dio = DioUtilNew.dio;

  static Future<UserModel?> login(
      String phone, String password, String fcm) async {
    try {
      final response = await DioUtilNew.dio!.post('/auth/login', data: {
        'phone': phone,
        'password': password,
        'fcm_token': fcm,
      });

      if (response.statusCode == 200) {
        OverlayHelper.showSuccessToast(
            Get.overlayContext!, "تسجيل الدخول بنجاح");
        print(response.data['token']);
        final model = UserModel.fromJson(response.data);
        CacheHelper.saveData(key: AppConstants.token, value: model.data!.token);
        DioUtilNew.setDioAgain();
        Get.offAll(() => const Home());
        storeFcmToken(fcm: fcm);
        return model;
      } else {
        OverlayHelper.showErrorToast(
            Get.overlayContext!, 'يرجى التحقق من الهاتف أو كلمة المرور');
      }
    } catch (error) {
      print('error: ${error.toString()}');
    }
  }

  static storeFcmToken({String? fcm}) async {
    try {
      final response = await DioUtilNew.dio!
          .post(AppConstants.storeFcm, data: {"fcm_token": fcm});
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {}
  }
}
