import 'package:get/get.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/model/order_details_model.dart';
import 'package:tajer/model/order_model.dart';
import 'package:tajer/screens/orders_screen/services/order_services.dart';

import '../../../utils/overlay_helper.dart';

class OrderScreenController extends BaseController {
  final service = OrderServices();
  OrderModel? order;
  OrderDetailsModel? orderById;
  final orders = <Orders>[].obs;
  final List<String> texts = [
    'طلبات جديدة',
    'طلبات مقبولة',
    'طلبات تم الالغاء'
  ];

  final searchController = ''.obs;

  final selectedText = ''.obs;
  final notes = ''.obs;
  final showOverlay = false.obs;

  // bool _showOverlay = false;

  Future<void> onClick(String text) async {
    selectedText.value = text;
    if (selectedText.value == 'طلبات جديدة') {
      setState(ViewState.busy);
      order = await service.getAllOrder(status: "pending");
      orders.assignAll(order?.data ?? []);
      setState(ViewState.idle);
    } else if (selectedText.value == 'طلبات مقبولة') {
      setState(ViewState.busy);
      order = await service.getAllOrder(status: "accepted");
      orders.assignAll(order?.data ?? []);
      setState(ViewState.idle);
    } else {
      setState(ViewState.busy);
      order = await service.getAllOrder(status: "canceled");
      orders.assignAll(order?.data ?? []);
      setState(ViewState.idle);
    }
  }

  void showOverlayF() {
    showOverlay.value = true;
  }

  void hideOverlay() {
    showOverlay.value = false;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setState(ViewState.busy);
    order = await service.getAllOrder(status: "pending");
    orders.assignAll(order?.data ?? []);
    setState(ViewState.idle);
  }

  cancelOrder({int? id, String? note}) async {
    await service.cancelOrder(id: id, note: note);
    Get.back();
  }

  acceptOrder({int? id, con}) async {
    await service.acceptOrder(id: id, context: con);

    // await service.cancelOrder(id: id);
    // Get.back();
  }

  searchOrder() async {
    await service.search(query: searchController.value);
  }

  getOrder({int? id}) async {
    orderById = await service.getOrderById(id: id);
    print(orderById!.toJson());
  }
}
