import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/utils/app_constants.dart';

class SplashServices {
  final dio = DioUtilNew.dio;

  storeFcmToken({String? fcm}) async {
    try {
      final response =
          await dio!.post(AppConstants.storeFcm, data: {"fcm_token": fcm});
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {}
  }
}
