import 'package:dio/dio.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/utils/app_constants.dart';
import 'dio_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtilNew {
  static DioUtilNew? _instance;
  static Dio? _dio;

  static DioUtilNew? getInstance() {
    if (_instance == null) {
      _dio = Dio(_getOptions());
      _dio!.interceptors.add(LoggingInterceptor());
      _dio!.interceptors.add((PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      )));
    }
    return _instance;
  }

  static Dio? get dio => _dio;

  static void setDioAgain() {
    _dio = Dio(_getOptions());
  }

  static BaseOptions _getOptions() {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) => status! <= 500,
    );

    options.connectTimeout = const Duration(minutes: 1); //10 sec
    options.receiveTimeout = const Duration(minutes: 1); //20 sec
    options.baseUrl = AppConstants.baseurl;
    options.headers = {
      // 'phone': "0111213487",
      // 'password': "123456",
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': "Bearer 74|6NBqouAivHyZU87rdeni8f8c3gpbvSaH4o0cXISJ",
      'Authorization': "Bearer ${CacheHelper.getData(key: AppConstants.token)}",
    };
    options.queryParameters = {};

    return options;
  }

//this just returns the language key
}
