import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tajer/componants/custom_snackbar.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/helpers/network/error_handler.dart';
import 'package:tajer/model/setting_model.dart';
import 'package:tajer/model/social_model.dart';
import 'package:tajer/utils/app_constants.dart';
import '../../../utils/overlay_helper.dart';

class SettingServices {
  final dio = DioUtilNew.dio;

  deleteAccount() async {
    try {
      final response = await dio!.delete(AppConstants.deleteMyAccount);
      if (response.statusCode == 200) {
        showCustomSnackBar(isError: false, message: "تم الحذف بنجاح");
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  singOut() async {
    try {
      final response = await dio!.post(AppConstants.logout);
      if (response.statusCode == 200) {
        showCustomSnackBar(isError: false, message: "تم تسجيل الخروج ");
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  static Future<SettingsModel> fetchLoggedUser(String token) async {
    const String baseUrl = '/auth/loggedUser';
    DioUtilNew.getInstance(); // Create the DioUtilNew instance

    DioUtilNew.dio!.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await DioUtilNew.dio!.get(baseUrl);

      if (response.statusCode == 200) {
        return SettingsModel.fromJson(response.data);
      } else {
        print(
            'Failed to fetch logged user. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to fetch logged user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred: $error');
      throw Exception('An error occurred: $error');
    }
  }

  ///this function worked

  // static update() async {
  //   String bearerToken = '22|G50zWOHU7IHJviPkHZSd4ihDqQGGgZYRM4rvrO1S'; // Replace with the actual bearer token
  //
  //   String url = 'https://admin.offers-iq.com/provider/settings/updateProfile';
  //
  //   Dio dio = Dio();
  //   dio.options.headers['Authorization'] = 'Bearer $bearerToken';
  //   dio.options.headers['Accept'] = 'application/json'; // Add Accept header
  //   dio.options.headers['Content-Type'] = 'application/json'; // Add Content-Type header
  //   dio.options.followRedirects = true;
  //   dio.options.validateStatus = (status) => status! < 500;
  //
  //   try {
  //     Map<String, dynamic> requestBody = {
  //       'name': 'John Doe',
  //       'company_name': 'Example Company',
  //       'address': '123 Main St',
  //       'government': 'Example Government',
  //       'latitude': '37.7749',
  //       'longitude': '-122.4194',
  //       'delivery_area': 2
  //     };
  //
  //     final response = await dio.post(url, data: requestBody);
  //
  //     if (response.statusCode == 200) {
  //       print('Post request successful');
  //       // Handle the response data
  //     } else if (response.statusCode == 422) {
  //       print('Post request failed with status code: ${response.statusCode}');
  //       // Handle the validation errors
  //       if (response.data is Map<String, dynamic>) {
  //         Map<String, dynamic> errorData = response.data;
  //         if (errorData.containsKey('errors')) {
  //           Map<String, dynamic> errors = errorData['errors'];
  //           errors.forEach((key, value) {
  //             print('Validation error for field "$key": $value');
  //           });
  //         }
  //       }
  //     } else {
  //       print('Post request failed with status code: ${response.statusCode}');
  //       // Handle other errors
  //     }
  //   } catch (error) {
  //     print('An error occurred: $error');
  //     // Handle the error
  //   }
  // }
  // static update({field ,value}) async {
  static update(Data data, {context}) async {
    String bearerToken =
        '22|G50zWOHU7IHJviPkHZSd4ihDqQGGgZYRM4rvrO1S'; // Replace with the actual bearer token

    String url = 'https://admin.offers-iq.com/provider/settings/updateProfile';

    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $bearerToken';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] =
        'application/json'; // Add Content-Type header
    dio.options.followRedirects = true;
    dio.options.validateStatus = (status) => status! < 500;

    try {
      // final response = await dio.post(url, data: {
      //   '$field':value
      // });
      final response = await dio.post(url, data: data.toJson());

      if (response.statusCode == 200) {
        print('Post request successful');

        OverlayHelper.showSuccessToast(context, "تم تحديث المعلومات بنجاح"); //
        // Handle the response data
      } else if (response.statusCode == 422) {
        print('Post request failed with status code: ${response.statusCode}');
        // Handle the validation errors
        if (response.data is Map<String, dynamic>) {
          Map<String, dynamic> errorData = response.data;
          if (errorData.containsKey('errors')) {
            Map<String, dynamic> errors = errorData['errors'];
            errors.forEach((key, value) {
              print('Validation error for field "$key": $value');
            });
          }
        }
      } else {
        print('Post request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred: $error');
      OverlayHelper.showErrorToast(context, ' خطأ تحديث المعلومات ');
      // Handle the error
    }
  }


  static  getSocial (String token)async{

    const String baseUrl = '/connection';
    DioUtilNew.getInstance(); // Create the DioUtilNew instance

    DioUtilNew.dio!.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await DioUtilNew.dio!.get(baseUrl);

      if (response.statusCode == 200) {
        return SocialModel.fromJson(response.data);
      } else {
        print(
            'Failed to fetch Social  date. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to fetch Social  dater. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred: $error');
      throw Exception('An error occurred: $error');
    }
  }
}
