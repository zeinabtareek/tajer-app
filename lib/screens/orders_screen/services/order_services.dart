import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tajer/componants/custom_snackbar.dart';
import 'package:tajer/helpers/network/dio_integration.dart';
import 'package:tajer/helpers/network/error_handler.dart';
import 'package:tajer/model/order_details_model.dart';
import 'package:tajer/model/order_model.dart';
import 'package:tajer/utils/app_constants.dart';

import '../../../utils/overlay_helper.dart';

class OrderServices {
  final dio = DioUtilNew.dio;

  getOrderById({int? id}) async {
    try {
      final response = await dio!.get("${AppConstants.getOrderById}$id");
      if (response.statusCode == 200) {
        return OrderDetailsModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  getAllOrder({String? status}) async {
    try {
      final response = await dio!
          .get(AppConstants.order, queryParameters: {"status": status});
      if (response.statusCode == 200) {
        OrderModel order = OrderModel.fromJson(response.data);
        return order;
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  // search({String? query}) async {
  //   try {
  //     final response = await dio!
  //         .post(AppConstants.search, queryParameters: {"query": query});
  //     if (response.statusCode == 200) {
  //       OrderModel order = OrderModel.fromJson(response.data);
  //       return order;
  //     }
  //   } catch (e) {
  //     if (e is DioExceptionType) {
  //       HandleError.handleExceptionDio(e);
  //     }
  //   }
  // }
  Future<OrderModel> search({String? query}) async {
    try {
      final response = await dio!.post(AppConstants.search, queryParameters: {"query": query});
      if (response.statusCode == 200) {
        OrderModel order = OrderModel.fromJson(response.data);
        return order;
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
    // Return a default empty OrderModel if an error occurs or the response is not 200.
    return OrderModel(data: []);
  }
  cancelOrder({int? id, String? note}) async {
    try {
      final response = await dio!
          .put("${AppConstants.cancelOrder}$id", data: {"note": note});
      if (response.statusCode == 200) {
        // showCustomSnackBar(message: "تم الالغاء بنجاح", isError: false);

        OverlayHelper.showSuccessToast(Get.overlayContext!, "تم الالغاء بنجاح");
      } else {
        OverlayHelper.showInfoToast(
            Get.overlayContext!, "${response.data['message']}");
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  acceptOrder({int? id, BuildContext? context}) async {
    try {
      final response = await dio!.put("${AppConstants.acceptOrder}$id");
      if (response.statusCode == 200) {
        OverlayHelper.showSuccessToast(
            Get.overlayContext!, "تم قبول الطلب بنجاح");
      } else {
        OverlayHelper.showInfoToast(
            Get.overlayContext!, "${response.data['message']}");
      }
    } catch (e) {
      if (e is DioExceptionType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
