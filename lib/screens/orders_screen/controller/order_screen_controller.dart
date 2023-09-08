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

  // final searchController = ''.obs;
  final searchController = ''.obs;

  final selectedText = ''.obs;
  final notes = ''.obs;
  final showOverlay = false.obs;
  final searchLoader = false.obs;
  final loading=false.obs;
final total =0.0.obs;
  // bool _showOverlay = false;
  Orders searchedOrder=Orders();


  OrderModel searchedOrderModel=OrderModel();
  Future<void> onClick(String text) async {
    selectedText.value = text;
    searchController.value='';
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
    selectedText.value='طلبات جديدة';
    super.onInit();
    setState(ViewState.busy);
    order = await service.getAllOrder(status: "pending");
    orders.assignAll(order?.data ?? []);
    setState(ViewState.idle);
  }

  cancelOrder({int? id, String? note}) async {
    await service.cancelOrder(id: id, note: note);
    loading.value=true;
    order = await service.getAllOrder(status: "pending");
    orders.assignAll(order?.data ?? []);
    loading.value=false;
    Get.back();
  }

  acceptOrder({int? id, con}) async {
    await service.acceptOrder(id: id, context: con);
    loading.value=true;

    order = await service.getAllOrder(status: "pending");
    orders.assignAll(order?.data ?? []);
    loading.value=false;
    // await service.cancelOrder(id: id);
    // Get.back();
  }
  // searchOrder() async {
  //   searchLoader.value=true;
  //   searchedOrderModel = await service.search(query: searchController.value);
  //   if (searchedOrderModel != null ||searchedOrderModel.data!.isBlank==true) {
  //     print('search data ${searchedOrderModel.data?.first}');
  //     searchedOrder=searchedOrderModel.data!.first;
  //   } else {
  //     print('Search result is null');
  //   }
  //   searchLoader.value=false;
  //
  // }




  searchOrder() async {
    searchLoader.value = true;

    try {
      searchedOrderModel = await service.search(query: searchController.value);

      if ( searchedOrderModel.data!.isNotEmpty) {
        print('Search data: ${searchedOrderModel.data!.first}');
        searchedOrder = searchedOrderModel.data!.first;
      } else {
        print('Search result is null or empty $searchedOrder');
      }
    } catch (error) {
      print('Error occurred during search: $error');
    } finally {
      searchLoader.value = false;
    }
  }
  getOrder({int? id}) async {
    orderById = await service.getOrderById(id: id);
    orderById?.data?.invoices?.forEach((element) {
     total.value+=double.parse( element.total.toString());
    });
    print('total.value ${total.value}');
    print(orderById!.toJson());
    update();
  }
}
