import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../helpers/cache_helper.dart';
import '../../../helpers/network/dio_integration.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/overlay_helper.dart';

class QrServices {


  static   scanToCreateAnOrder(
      String barcodeValue) async {
    try {
      final response = await DioUtilNew.dio!.post('/order/createByScan', data: {
        'voucher_id': barcodeValue,
      });

      if (response.statusCode == 200) {
        OverlayHelper.showSuccessToast(
            Get.overlayContext!, "تسجيل الدخول بنجاح");
        print(response.data['token']);
        // final model = UserModel.fromJson(response.data);
        // CacheHelper.saveData(key: AppConstants.token, value: model.data!.token);
        // DioUtilNew.setDioAgain();
        // Get.offAll(() => const Home());
        // storeFcmToken(fcm: fcm);
        // return model;
      } else {
        OverlayHelper.showErrorToast(
            Get.overlayContext!, 'يرجى التحقق من الهاتف أو كلمة المرور');
      }
    } catch (error) {
      print('error: ${error.toString()}');
    }
  }

}