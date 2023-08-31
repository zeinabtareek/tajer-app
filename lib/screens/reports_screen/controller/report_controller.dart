import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/style.dart';
import '../../../model/reprt_model.dart';
import '../../../utils/overlay_helper.dart';
import '../services/report_services.dart';

class ReportController extends GetxController{


     final dropdownValue=''.obs;
     // final  isClicked =false.obs;
     // String dropdownValue='اختيار نوع التقرير';
  final services=ReportServices();
   ReportModel model =ReportModel();
   final isStartSearch=false.obs;

final dataLoading=false.obs;
  //  showCalenderFrom({required BuildContext context})async {
  //   final picked = await showDatePicker(
  //       context: context,
  //       lastDate: DateTime(2100),
  //       firstDate: DateTime(2000),
  //       initialDate: fromDateTime.value,
  //       builder: (BuildContext context, Widget ?child) {
  //         return Theme(data: ThemeData.light().copyWith(
  //           colorScheme: ColorScheme.light().copyWith(
  //               primary: K.primaryColor
  //           ),
  //         ),
  //             child: child!);
  //       }
  //   );
  //   print(picked);
  //   if(picked  !=null){
  //     fromDateTime.value =picked;//'yyyy-MM-dd'
  //
  //    }
  //   update();
  //
  //   return fromDateTime.value;
  //
  // }
  // Future<DateTime?> showCalenderTo({required BuildContext context})async {
  //    final picked = await showDatePicker(
  //        context: context,
  //        lastDate: DateTime(2100),
  //        firstDate: DateTime(2000),
  //        initialDate: DateTime.now(),
  //        builder: (BuildContext context, Widget ?child) {
  //          return Theme(data: ThemeData.light().copyWith(
  //            colorScheme: ColorScheme.light().copyWith(
  //                primary: K.primaryColor
  //            ),
  //          ),
  //              child: child!);
  //        }
  //    );
  //    print(picked);
  //    if(picked  !=null ){
  //      toDateTime =picked;//'yyyy-MM-dd'
  //
  //    }
  //    update();
  //    return picked;
  //
  //  }
@override
  onClose(){
  dataLoading.value = false;

}
  Rx<DateTime> dateTime = DateTime.now().obs;
  Rx<DateTime> dateTimeTo = DateTime.now().obs;
  Rxn<DateTime> newTime = Rxn<DateTime>();
  Rxn<DateTime> newTimeTo = Rxn<DateTime>();
  Future<DateTime?> showCalenderFrom({required BuildContext context}) async =>
      await showDatePicker(
          context: context,
          lastDate: DateTime(2100),
          firstDate: DateTime(2000),
          initialDate: dateTime.value,
          builder:(BuildContext context,  Widget ?child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor:   K.primaryColor,
                // accentColor: k.primaryColor,
                colorScheme: ColorScheme.light(primary: K.primaryColor),
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.primary
                ),
              ), child: child!,
            );});

    Future<DateTime?> showCalenderTo({required BuildContext context}) async =>
      await showDatePicker(
          context: context,
          lastDate: DateTime(2100),
          firstDate: DateTime(2000),
          initialDate: dateTimeTo.value,
          builder:(BuildContext context,  Widget ?child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor:   K.primaryColor,
                // accentColor: k.primaryColor,
                colorScheme: ColorScheme.light(primary: K.primaryColor),
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.primary
                ),
              ), child: child!,
            );});









  getDateFormattedWWithPattern( date){

update();
  return DateFormat('yyyy-MM-dd').format(date);
}

  searchForTheReport({String ?status}) async {


    try {//&& status == null//|| dateTimeTo.value == DateTime.now()
      if (newTime.value !=null && status != null  &&status != ''&& newTimeTo.value != null) {
        isStartSearch.value=true;
        dataLoading.value = true;
        model =await  ReportServices.searchForAReport(
          startDate: await getDateFormattedWWithPattern(newTime.value),
          endDate: await getDateFormattedWWithPattern(newTimeTo.value),
          // endDate: await getDateFormattedWWithPattern(dateTimeTo.value),
          status: status,
          // status: 'accepted',
        );
      }
      else {

        OverlayHelper.showErrorToast(
          Get.overlayContext!,
          "يرجى التأكد من تحديد تاريخ البدء وتاريخ الانتهاء وحالة الطلب",
        );
      }

      dataLoading.value = false;
      return model;
    } catch (e) {
      print(e);
    }
    }
    onChaned(String ?v){
     dropdownValue.value = v!;
     update();
   }
   //  onChaned2(String ?v){
   //    getDateFormattedWWithPattern(fromDateTime) = v!;
   //   update();
   // }


}