import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/helpers/connectivity.dart';

class BaseController extends GetxController {
  final connection = Get.put(ConnectionStatusSingleton());

  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  setState(ViewState state) {
    _state.value = state;
  }
}
