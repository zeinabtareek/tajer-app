import 'package:dio/dio.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/helpers/network/error_handler.dart';
import 'package:tajer/model/message_model.dart';
import 'package:tajer/utils/app_constants.dart';

class SupportServices {
  final dio = DioUtilNew.dio;

  sendMessage({String? message}) async {
    try {
      final response =
          await dio!.post(AppConstants.sendMessage, data: {"message": message});
      print(response.data);
      if (response.statusCode == 200) {
        print(response.data);
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  getMessage() async {
    try {
      final response = await dio!.get(
        AppConstants.getMessage,
      );

      if (response.statusCode == 200) {
        MessageModel messageModel = MessageModel.fromJson(response.data);
        return messageModel;
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
