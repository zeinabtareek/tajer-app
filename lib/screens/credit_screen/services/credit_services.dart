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
}