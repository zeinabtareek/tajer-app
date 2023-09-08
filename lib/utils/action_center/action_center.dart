import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../helpers/connectivity.dart';
import '../../helpers/logger/logger.dart';
import '../overlay_helper.dart';
import 'exceptions.dart';

class ActionCenter {
  final AbsLogger _logger;
  final _connectivityService = Get.find<ConnectionStatusSingleton>();
  // final _connectivityService = Get.find<IConnectivityService>();

  static bool displayErrorDetails = false;

  //ActionCenter(this._logger, this._connectivityService);
  ActionCenter(this._logger);

  /// returns true if the action is completed successfully,
  /// [errorHandler] takes the exception or error, and is used to
  /// pre-handle it, returns true if the error handled and false
  /// if the error not handled by it, and hence it will fall to
  /// the generic handling
  Future<bool> execute(Function() action,
      {bool checkConnection = false,
      Function(dynamic ex)? errorHandler}) async {
    try {
      // if check connection
      if (checkConnection) {
        if (_connectivityService.connectivity==0) {
          _logger.info(message: 'ActionCenter : No Internet Connection');
          OverlayHelper.showErrorToast(
              Get.overlayContext!, 'لا يوجد اتصال بالإنترنت ');
          return false;
        }
      }

      await action();

      return true;
    } catch (ex, st) {
      // the handler sent by the caller
      if (errorHandler != null && errorHandler(ex)) {
        _logger.error(error: ex, stackTrace: st);
        return false;
      }
      // check for context as it is necessary for toast

      if (ex is CustomException) {
        _logger.error(error: ex.message, stackTrace: st);

        // specialized exceptions
        if (ex is ApiTimeoutException) {
          OverlayHelper.showErrorToast(
              Get.overlayContext!,  'تم تجاوز مهلة الطلب');
        } else if (ex is ApiResponseException) {
          String message = 'حدث خطأ ما حاول مرة أخرى';
          if (HttpStatus(ex.statusCode).isServerError) {
            OverlayHelper.showErrorToast(Get.overlayContext!, message);
          } else {
            OverlayHelper.showErrorToast(
                Get.overlayContext!, message.replaceAll("\"", ""));
          }
        } else {
          OverlayHelper.showErrorToast(
              Get.overlayContext!, ex.message.replaceAll("\"", ""));
        }
      } else {
        OverlayHelper.showErrorToast(
            Get.overlayContext!,'حدث خطأ ما حاول مرة أخرى');
        _logger.error(error: ex.toString());
      }

      //
      // show the error for testers if configured from the diag. page
      // TODO: create the diagnosis page
      if (displayErrorDetails) {
        // TODO: implement dialog showing
      }
      //
      return false;
    } finally {}
  }
}
