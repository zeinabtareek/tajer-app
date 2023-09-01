import 'package:dio/dio.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/helpers/network/error_handler.dart';
import 'package:tajer/model/notifications_model.dart';
import 'package:tajer/utils/app_constants.dart';

class NotificationServices {
  final dio = DioUtilNew.dio;

  getNotification() async {
    try {
      final response = await dio!.get(AppConstants.notifications);
      if (response.statusCode == 200) {
        return NotificationsModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {}
  }

  Future<void> sendNotification() async {
    try {
      final response = await dio!.post(AppConstants.fcmUrl,
          options: Options(headers: {"Authorization": "server Token Firebase"}),
          data: {
            "data": {
              "message": "Accept Ride Request",
              "title": "This is Ride Request",
            },
            "to": "token sender"
          });

      if (response.statusCode == 200) {
        print('Request Sent To Driver');
      } else {
        print('notification sending failed');
      }
    } catch (e) {
      print('exception $e');
    }
  }
}
