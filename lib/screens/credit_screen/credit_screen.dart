import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tajer/model/reprt_model.dart';

import '../../componants/custom_order_history_cards.dart';
import '../../componants/custom_pie_card.dart';
import '../../constants/style.dart';
import '../../enum/view_state.dart';
import 'controller/credit_controller.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreditController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text(
            'رصيدك',
            style: K.boldBlackText,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Row(
              children: [
                ...List.generate(
                  controller.optionsList.length,
                  (index) => Obx(
                    () => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = index;
                          print(controller.optionsList[index]);
                          controller.getAllOrderHistory(
                              controller.optionsList[index].toString());
                        },
                        child: Container(
                          height: 40,
                          color: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: controller.selectedIndex.value == index
                                      ? K.primaryColor
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                controller.optionsList[index],
                                style: controller.selectedIndex.value == index
                                    ? K.redTextStyle
                                    : K.boldBlackSmallText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.state == ViewState.busy
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: CupertinoActivityIndicator(),
                  ),
                )
              :
          controller.model?.items == null ||
                      controller.model?.items!.isEmpty == true
                  ?   Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          K.sizedboxH,
                          Text(
                              'لايوجد بيانات'),
                        ],
                      )) // Handle the case where the model is null
                  :
          CreditBody(
                      context,
                      credit:
                          controller.model?.financialReport?.accountBalance ??
                              '',
                      requiredMoney:
                          controller.model?.financialReport?.requiredMony ?? '',
                      companyPercentage: controller
                              .model?.financialReport?.companyPrecentage ??
                          '',
                      earnings:
                          controller.model?.financialReport?.earnings ?? '',
                      companyShare:
                          controller.model?.financialReport?.companyShare ?? '',
                      widget: ListView.builder(
                        itemCount: controller.model?.items?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomOrderHistoryCards(
                            model: controller.model!.items![index],
                          );
                        },
                      ),
                    ),
        ),
      ),
    );
  }
}

Widget CreditBody(context,
    {credit,
    requiredMoney,
    companyPercentage,
    earnings,
    companyShare,
    widget}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      children: [
        K.sizedboxH,
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height/7,
          padding: EdgeInsets.only(right: 10),
          color: K.darkRed,
          child: Column(
            children: [
              K.sizedboxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'رصيد التاجر  ',
                    style: TextStyle(
                        color: K.whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 3.3.w,
                      height: MediaQuery.of(context).size.height / 30.w,
                      decoration: BoxDecoration(
                        color: K.semiDarkRed,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          // Set the desired radius value
                          bottomRight: Radius.circular(
                              10.0), // Set the desired radius value
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$credit',
                          style: TextStyle(
                              color: K.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
              requiredMoney == null ? SizedBox() : K.sizedboxH,
              requiredMoney == null
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المبلغ المطلوب تسديده ',
                          style: TextStyle(
                              color: K.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        K.sizedboxW,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '$requiredMoney',
                            style: TextStyle(
                                color: K.whiteColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // K.sizedboxW,
                      ],
                    ),
              K.sizedboxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'نسبة المنصة',
                      style: TextStyle(
                          color: K.whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '($companyPercentage %) ',
                    // '(10 %) ',
                    style: TextStyle(
                        color: K.whiteColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  K.sizedboxW,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '$companyShare',
                      // '$requiredMoney',
                      // '277.900',
                      style: TextStyle(
                          color: K.whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // companyShare == null ? SizedBox() : K.sizedboxH,
              // companyShare == null
              //     ? SizedBox()
              //     : Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'صافي ارباح المنصة من مبيعات التاجر',
              //             style: TextStyle(
              //                 color: K.whiteColor,
              //                 fontSize: 15.sp,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //           K.sizedboxW,
              //           Padding(
              //             padding: const EdgeInsets.only(left: 8.0),
              //             child: Text(
              //               '$requiredMoney',
              //               style: TextStyle(
              //                   color: K.whiteColor,
              //                   fontSize: 15.sp,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //           // K.sizedboxW,
              //         ],
              //       ),
              earnings == null ? SizedBox() : K.sizedboxH,
              earnings == null
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'صافي الارباح',
                          style: TextStyle(
                              color: K.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        K.sizedboxW,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '$earnings',
                            style: TextStyle(
                                color: K.whiteColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // K.sizedboxW,
                      ],
                    ),
              K.sizedboxH,
            ],
          ),
        ),
        widget,
      ],
    ),
  );
}
