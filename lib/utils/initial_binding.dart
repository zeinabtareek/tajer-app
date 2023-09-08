import 'package:get/get.dart';
import '../helpers/connectivity.dart';
import '../helpers/logger/logger.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //logger
    Get.lazyPut<AbsLogger>(() => DebugLogger());

    // cache service

    // cache manager

    // connectivity
    Get.put<ConnectionStatusSingleton>(ConnectionStatusSingleton( ));

    // http Service
   }
}
