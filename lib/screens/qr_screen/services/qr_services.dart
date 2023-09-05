import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/data.dart';
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
            Get.overlayContext!, "${response.data['message']}");
        print(response.data['token']);
        OverlayHelper.showErrorToast(
            Get.overlayContext!,response.data['message']);
        CurvedNavigationBarState? navBarState =
            bottomNavigationKey.currentState;
        navBarState?.setPage(3);
        // final model = UserModel.fromJson(response.data);
        // CacheHelper.saveData(key: AppConstants.token, value: model.data!.token);
        // DioUtilNew.setDioAgain();
        // Get.offAll(() => const Home());
        // storeFcmToken(fcm: fcm);
        // return model;
      } else {
        OverlayHelper.showErrorToast(
            Get.overlayContext!,response.data['message']);
        CurvedNavigationBarState? navBarState =
            bottomNavigationKey.currentState;
        navBarState?.setPage(3);
      }
    } catch (error) {
      print('error: ${error.toString()}');
    }
  }

}