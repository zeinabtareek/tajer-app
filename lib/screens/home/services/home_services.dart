import 'package:dio/dio.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/helpers/network/error_handler.dart';
import 'package:tajer/model/home_model.dart';
import 'package:tajer/utils/app_constants.dart';

class HomeService {
  final dio = DioUtilNew.dio;

  getChart() async {
    try {
      final response = await dio!.get(AppConstants.home);
      if (response.statusCode == 200) {
        HomeModel homeModel = HomeModel.fromJson(response.data);
        return homeModel;
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
