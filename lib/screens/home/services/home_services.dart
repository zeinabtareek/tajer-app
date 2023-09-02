import 'package:dio/dio.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/helpers/network/error_handler.dart';
import 'package:tajer/model/home_model.dart';
import 'package:tajer/utils/app_constants.dart';

class HomeService {
  final dio = DioUtilNew.dio;

 // getChart() async {
 //    try {
 //      final response = await dio!.get(AppConstants.home);
 //      if (response.statusCode == 200) {
 //        HomeModel homeModel = HomeModel.fromJson(response.data);
 //        return homeModel;
 //      }
 //    } catch (e) {
 //      if (e is DioExceptionType) {
 //        HandleError.handleExceptionDio(e);
 //      }
 //    }
 //  }


  static Future<HomeModel> getChart(String token) async {
    const String baseUrl = AppConstants.home;
    DioUtilNew.getInstance(); // Create the DioUtilNew instance

    DioUtilNew.dio!.options.headers['Authorization'] = 'Bearer $token';

    // try {
      final response = await DioUtilNew.dio!.get(baseUrl);

      // if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
    //   } else {
    //     print(
    //         'Failed to fetch home data. Status code: ${response.statusCode}');
    //     throw Exception(
    //         'Failed to fetch home.  Status code: ${response.statusCode}');
    //   }
    // } catch (error) {
    //   print('An error occurred: $error');
    //   throw Exception('An error occurred: $error');
    // }
  }
}
