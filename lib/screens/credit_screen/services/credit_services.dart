import 'package:dio/dio.dart';

import '../../../helpers/network/dio_integration.dart';
import '../../../helpers/network/error_handler.dart';
import '../../../model/order_history_model.dart';
import '../../../utils/app_constants.dart';

class CreditServices{
  final dio = DioUtilNew.dio;





  getAllOrderHistory({String? filter}) async {
    try {
      final response = await dio!
          .get(AppConstants.orderHistory, queryParameters: {"filter": filter});//?filter=day
      if (response.statusCode == 200) {
        OrderHistoryModel order = OrderHistoryModel.fromJson(response.data);
        return order;
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
//  {date: 2023-09-07, total: 60, company_share: 1.8, company_percentage: 3, earning: 58.2},

//{date: 2023-09, total: 960, company_share: 28.8, company_percentage: 3, earning: 931.2}
}