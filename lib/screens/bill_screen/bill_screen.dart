import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/model/order_details_model.dart';
import 'package:tajer/model/order_model.dart';
import 'package:tajer/screens/bill_screen/controller/bill_controller.dart';

import '../../componants/custom_bill_card.dart';
import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
import '../../componants/location_map_view.dart';
import '../../constants/style.dart';
import '../../utils/overlay_helper.dart';
import '../home_screen/home_screen.dart';

class BillScreen extends StatelessWidget {
    BillScreen({Key? key, this.order,required this.total}) : super(key: key);
  final OrderDetailsModel? order;
    RxDouble  total=0.0.obs;

  @override
  Widget build(BuildContext context) {
    // double total = 0;

    final controller = Get.put(BillController());
   final dateTime= DateTime.parse(order?.data?.date??'');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'الفاتورة',
          style: K.boldBlackText,
        ),
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
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      order?.data?.orderNumber.toString() ?? "",
                      style: K.boldBlackSmallText,
                    ),
                    K.sizedboxW,
                    Text(
                      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}"
                      ,style: K.boldBlackSmallText,
                    ),
                    // Text(
                    //   order?.data?.date ?? "",
                    //   style: K.boldBlackSmallText,
                    // ),
                  ],
                ),
                K.sizedboxH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'اسم العميل',
                      style: K.boldBlackSmallText,
                    ),
                    K.sizedboxW,
                    Text(
                      order?.data?.clientName ?? "",
                      style: K.boldBlackSmallText,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/2.h,
                  child: LocationMapView(latitude: double.parse(order?.data?.clientLatitude.toString()??'0'),
                    longitude: double.parse(order?.data?.clientLongitude.toString()??'0'),
                      address:order?.data?.clientLocation??''
                  ),
                ),

                // Image.asset('assets/images/map.png'),
                K.sizedboxH,
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      order?.data?.clientLocation!=null? Center(
                        child:Container(
                          decoration: K.boxDecorationLightGrey,
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width / 1.3.w,
                          // height: 50.h,
                          child: Center(child: Text('  ${order?.data?.clientLocation.toString()}'??'')),
                        )
                        // CustomAddressTextField(
                        //   width: MediaQuery.of(context).size.width / 1.3.w,
                        //   hintText: " ".tr,
                        //   labelText: "ابحث ".tr,
                        //   onChanged: (String v) {
                        //     controller.searchController.value = v;
                        //   },
                        // ),
                      ):SizedBox(),
                      K.sizedboxH,
                      Row(
                        children: [
                          Padding(
                            child: Text(
                              'بيانات الطلب',
                              style: K.boldBlackSmallText,
                            ),
                            padding:
                                const EdgeInsets.only(right: 7.0, bottom: 7),
                          ),
                        ],
                      ),

                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:order?.data?.invoices?.length,
                          itemBuilder: (_, index) {
                            // controller.total.value +=
                            //     order?.data?.invoices?[index].priceAfter ?? 0;
                            return CustomBillCard(
                              image: order?.data?.invoices![index].images!.first.imageUrl??'',

                              price: order?.data?.invoices?[index].priceBefore
                                              .toString() ??
                                          "",
                              name:order?.data?.invoices?[index].name??'',
                              desc:order?.data?.invoices?[index].type??'',
                              orderNumber:order?.data?.invoices?[index].quantity.toString()??'',
                              discount: order?.data?.invoices?[index].priceAfter
                                  .toString(),
                            );
                          }),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.w,right: 30.w),
                  // margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        'المجموع',
                        style: K.boldBlackSmallText,
                      ),
                      // K.sizedboxW,
                   Obx(()=>    Text(
                            ' ${total.value.toString()??''}',
                            // '\$ ${controller.total.value}',
                            style: K.boldBlackSmallText,
                          ),
                          ),

                    ],
                  ),
                ),
            Container(
              padding: EdgeInsets.only(left: 30.w,right: 30.w),
              // margin: EdgeInsets.all(5),
              child:  Divider(
                  thickness: 2,
                ),
                ),
            K.sizedboxH,
            Container(
              padding: EdgeInsets.only(left: 30.w,right: 30.w),
              // margin: EdgeInsets.all(5),
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        color: K.semiDarkRed,
                        // color: Color(0xfffcf2f4),
                        text: 'قبول الطلب'.tr,
                        size: MediaQuery.of(context).size.width / 2.2.w,
                        height: MediaQuery.of(context).size.width / 9.h,
                        isFramed: false,
                        fontSize: 22.sp,
                        onPressed: () async {
                          await controller.acceptOrder(id: order?.data?.id);
                        }),
                    K.sizedboxW,
                    Button(
                        color: Color(0xfffcf2f4),
                        text: 'الغاء الطلب'.tr,
                        size: MediaQuery.of(context).size.width / 3.2.w,
                        height: MediaQuery.of(context).size.width / 9.h,
                        isFramed: true,
                        fontSize: 22.sp,
                        onPressed: () async {

                          await showDialog(
                            context:
                            context,
                            builder:
                                (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(20),
                                contentPadding: EdgeInsets.all(10),
                                content: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black54,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            // padding: EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              // color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.transparent,
                                                    child: IconButton(
                                                      icon: Icon(Icons.cancel),
                                                      onPressed: () {
                                                        controller.showOverlay.value = false;
                                                        Get.back();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Directionality(
                                                  textDirection: TextDirection.rtl,
                                                  child: Container(
                                                    child: CustomAddressTextField(
                                                      maxLines: 10,
                                                      width: MediaQuery.of(context).size.width / 1.w,
                                                      hintText: " اكتب هنا  ".tr,
                                                      labelText: "".tr,
                                                      onChanged: (String v) {
                                                        controller.notes.value = v;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Button(
                                                    color: Color(0xfffcf2f4),
                                                    text: 'الغاء الطلب'.tr,
                                                    size: MediaQuery.of(context).size.width / 1.5.w,
                                                    height: MediaQuery.of(context).size.width / 9.h,
                                                    isFramed: true,
                                                    fontSize: 22.sp,
                                                    onPressed: () async {
                                                      controller.cancelOrder(
                                                        note: controller.notes.value,
                                                        id: order?.data?.id
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          );
                        }),
                   ],
                 ),
                ),
                K.sizedboxH,
              ],
            ),
          )),
    );
  }
}

