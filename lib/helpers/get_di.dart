import 'package:get_it/get_it.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'cache_helper.dart';


final instance = GetIt.instance;

Future<Map<String, Map<String, String>>> init() async {
  await CacheHelper.init();
  DioUtilNew.getInstance();
  Map<String, Map<String, String>> languages = {};
  return languages;
}
