import 'package:dio/dio.dart';
import 'package:tajer/componants/custom_snackbar.dart';

class HandleError {
  static handleException({
    int? response,
  }) {
    switch (response) {
      case 400:
        showCustomSnackBar(
          isError: true,
          message: "توجد مشكله فى الارسال",
        );
        break;
      case 401:
        showCustomSnackBar(
          isError: true,
          message: "يجب تسجيل الدخول",
        );
        break;
      case 404:
        showCustomSnackBar(
          isError: true,
          message:"هذه الخدمه غير موجوده",
        );
        break;
      case 403:
        showCustomSnackBar(
          isError: true,
          message: "هذا المستخدم لا يملك صلاحيه",
        );
        break;
      case 500:
        showCustomSnackBar(
          isError: true,
          message: "توجد مشكله فى الخادم",
        );
        break;
      case 502:
        showCustomSnackBar(
          isError: true,
          message: "توجد مشكله فى الخادم",
        );
        break;
    }
  }

  static handleExceptionDio(DioExceptionType dioExceptionType) {
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        showCustomSnackBar(
          isError: true,
          message: 'connection timeout',
        );
        break;

      case DioExceptionType.sendTimeout:
        showCustomSnackBar(
          isError: true,
          message: 'send timeout',
        );
        break;
      case DioExceptionType.receiveTimeout:
        showCustomSnackBar(
          isError: true,
          message: 'receive timeout',
        );
        break;
      case DioExceptionType.badCertificate:
        showCustomSnackBar(
          isError: true,
          message: 'bad certificate',
        );
        break;
      case DioExceptionType.badResponse:
        showCustomSnackBar(
          isError: true,
          message: 'bad response',
        );
        break;
      case DioExceptionType.cancel:
        showCustomSnackBar(
          isError: true,
          message: 'request cancelled',
        );
        break;
      case DioExceptionType.connectionError:
        showCustomSnackBar(
          isError: true,
          message: 'connection error',
        );
        break;
      case DioExceptionType.unknown:
        showCustomSnackBar(
          isError: true,
          message: 'unknown',
        );
        break;
    }
  }
}
