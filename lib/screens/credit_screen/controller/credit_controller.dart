import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controller/base_controller.dart';
import '../../../enum/view_state.dart';
import '../../../model/order_history_model.dart';
import '../services/credit_services.dart';

class CreditController extends BaseController{
  final selectedIndex = 3.obs;
  final services=CreditServices();
  OrderHistoryModel? model;
  List optionsList=[
    'سنه',
    'شهر',
    'اسبوع',
    'يوم',
  ];
  Map<String, String> filterMappings = {
    'سنه': 'year',
    'شهر': 'month',
    'اسبوع': 'week',
    'يوم': 'day',
  };

  onInit()async{
    super.onInit();
    setState(ViewState.busy);
     await getAllOrderHistory('day');
    setState(ViewState.idle);


  }

  getAllOrderHistory(String selectedOption) async {
    setState(ViewState.busy);
    // String selectedOption = optionsList[index];
    String filter = filterMappings[selectedOption] ?? '';
    model=  await services.getAllOrderHistory(filter: filter);
print(model?.toJson());
    update();
    setState(ViewState.idle);
  }


}