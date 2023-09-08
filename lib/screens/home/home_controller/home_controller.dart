import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:tajer/constants/style.dart';
import 'package:tajer/controller/base_controller.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/model/home_model.dart';
import 'package:tajer/screens/home/services/home_services.dart';

import '../../../helpers/cache_helper.dart';
import '../../../model/order_details_model.dart';
import '../../../utils/app_constants.dart';
import '../../orders_screen/services/order_services.dart';

class HomeController extends BaseController {
  final service = HomeService();
  final orderService = OrderServices();
  OrderDetailsModel? orderById;

  HomeModel? chart;
  HomeModel? data;
  final activePage = 3.obs;
  final isLoading = false.obs;
  final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
  final showingBarGroups = <BarChartGroupData>[].obs;
  final total=0.0.obs;
  final showOverlay = false.obs;
  final notes = ''.obs;

  jumpToPage(int index) {
    activePage.value = index;
  }

  var token;

  @override
  onInit() async {
   super.onInit();
    setState(ViewState.busy);
   token = await CacheHelper.getData(key: AppConstants.token);
   await getHomeData(token);
     // chart = await getHomeData(token);
    // chart = await service.getChart();

    await create();
   await setState(ViewState.idle);
  }

  create() {
    showingBarGroups.addAll([
      makeGroupData(
        0,
        chart?.ordersChart?.saturday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.saturday?.total?.toDouble() ?? 0.0,
      ),
      makeGroupData(
        1,
        chart?.ordersChart?.sunday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.sunday?.total?.toDouble() ?? 0.0,
      ),
      makeGroupData(
        2,
        chart?.ordersChart?.monday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.monday?.total?.toDouble() ?? 0.0,
      ),
      makeGroupData(
        3,
        chart?.ordersChart?.thursday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.thursday?.total?.toDouble() ?? 0.0,
      ),
      makeGroupData(
        4,
        chart?.ordersChart?.wednesday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.wednesday?.total?.toDouble() ?? 0.0,
      ),
      makeGroupData(
        5,
        chart?.ordersChart?.tuesday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.tuesday?.total?.toDouble() ?? 0.0,
      ),
      makeGroupData(
        6,
        chart?.ordersChart?.friday?.companyShare?.toDouble() ?? 0.0,
        chart?.ordersChart?.friday?.total?.toDouble() ?? 0.0,
      ),
    ]);
    print(showingBarGroups.length);
  }
  Future<HomeModel?> getHomeData(String token) async {
    isLoading.value = true;
    try {
      chart = await HomeService.getChart(token);

         update();

      return data;
    } catch (error) {
      print('$error');
    }

    isLoading.value = false;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: K.primaryColor,
          width: 4,
        ),
        BarChartRodData(
          toY: y2,
          color: K.semiDarkRed.withOpacity(.4),
          width: 4,
        ),
      ],
    );
  }
  void showOverlayF() {
    showOverlay.value = true;
  }

  void hideOverlay() {
    showOverlay.value = false;
  }

  cancelOrder({int? id, String? note}) async {
    await orderService.cancelOrder(id: id, note: note).then((v) async {
      await getHomeData(token);
    });
    Get.back();
    update();

  }

  acceptOrder({int? id, con}) async {
    await orderService.acceptOrder(id: id, context: con).then((v) async {
      await getHomeData(token);
    });

    update();

  }

  getOrder({int? id}) async {
    orderById = await orderService.getOrderById(id: id);
    orderById?.data?.invoices?.forEach((element) {
      total.value+=double.parse( element.total.toString());
    });
    print('total.value ${total.value}');
    print(orderById!.toJson());
    update();
  }
}
