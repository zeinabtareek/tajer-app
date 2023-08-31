import 'package:get/get.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/screens/orders_screen/services/order_services.dart';

import '../../../utils/overlay_helper.dart';

class BillController extends BaseController {
  final service = OrderServices();

  final searchController = ''.obs;

  cancelOrder({int? id}) async {
    await service.cancelOrder(id: id);
    Get.back();
  }

  acceptOrder({int? id}) async {

    await service.acceptOrder(id: id);
    Get.back();
  }
}
