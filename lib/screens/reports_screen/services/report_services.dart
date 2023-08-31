import 'package:get/get.dart';
import 'package:tajer/model/reprt_model.dart';

import '../../../helpers/cache_helper.dart';
import '../../../helpers/network/dio_integration.dart';
import '../../../utils/overlay_helper.dart';

class ReportServices{

  // static Future<ReportModel?> searchForAReport( ) async {
  static   searchForAReport({  startDate,   endDate,   status}) async {
    try {
      final response = await DioUtilNew.dio!.post('/report', data: {

      "start_date":"$startDate",
      "end_date":"$endDate",
      "status":"$status",
      // "start_date":"2023-08-19",
      // "end_date":"2023-08-22",
      // "status":"accepted"
      });
      print(response.data);
      if (response.statusCode == 200) {
        // OverlayHelper.showSuccessToast(
        //     Get.overlayContext!, "تسجيل الدخول بنجاح");
        print(response.data);
        final model = ReportModel.fromJson(response.data);
        // CacheHelper.saveData(key: AppConstants.token, value: model.data!.token);
        DioUtilNew.setDioAgain();
        // Get.offAll(() => const Home());

        return model;
      }
      else if (response.statusCode == 400) {
        OverlayHelper.showErrorToast(
            Get.overlayContext!, '${response.statusMessage}');
      }  else {
        OverlayHelper.showErrorToast(
            Get.overlayContext!, ' حدث خطأ ما، يرجى الاتصال بالدعم');
      }
    } catch (error) {
      print('error: ${error.toString()}');
    }
  }

}