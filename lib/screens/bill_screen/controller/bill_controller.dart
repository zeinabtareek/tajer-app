
  import 'package:http/http.dart' as http;
  import 'dart:convert';
import 'package:get/get.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/screens/orders_screen/services/order_services.dart';
  import 'package:geocoding/geocoding.dart';
  import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

import '../../../utils/overlay_helper.dart';

class BillController extends BaseController {
  final service = OrderServices();
  final searchController = ''.obs;
  final address = ''.obs;
  final notes = ''.obs;
  final showOverlay = false.obs;

  final total=0.0.obs;
  // cancelOrder({int? id}) async {
  //   await service.cancelOrder(id: id);
  //   Get.back();
  // }
  cancelOrder({int? id, String? note}) async {
    await service.cancelOrder(id: id, note: note);
    Get.back();
  }

  acceptOrder({int? id}) async {

    await service.acceptOrder(id: id);
    Get.back();
  }
  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        return placemarks[0].street; // You can access other address fields as well, such as city, state, etc.
      }
    } catch (e) {
      print('Error getting address: $e');
    }
    return '';
  }


}
