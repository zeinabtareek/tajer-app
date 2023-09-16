import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';

import '../../componants/custom_app_bar.dart';
import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
import '../../constants/app_assets.dart';
import '../../constants/style.dart';
import '../../utils/overlay_helper.dart';
import '../bill_screen/bill_screen.dart';
import '../home_screen/home_screen.dart';
import 'controller/order_screen_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderScreenController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'الطلبات',
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
        body: SingleChildScrollView(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: Obx(
            () => controller.state == ViewState.busy
                ? Center(
                    child: CupertinoActivityIndicator(
                      color: K.primaryColor,
                    ),
                  )
                : Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                        Opacity(
                          opacity: controller.showOverlay.value ? 0.3 : 1.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:CrossAxisAlignment.center,
                            children: [
                              CustomAddressTextField(
                                width:
                                    MediaQuery.of(context).size.width / 1.3.w,
                                // height:55,
                                hintText: "ابحث عن الفاتورة".tr,
                                labelText: "ابحث عن الفاتورة ".tr,
                                onSubmitted: (v) async {
                                  controller.searchController.value = v;
                                  await controller.searchOrder();
                                },
                                onChanged: (String v)async {
                                  controller.searchController.value = v;
                                  await controller.searchOrder();
                                },

                              ),
                              K.sizedboxH,
                              K.sizedboxH,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (final text in controller.texts)
                                    ClickableText(text: text),
                                ],
                              ),
                              K.sizedboxH,





                              Obx(()=>//searchedOrderModel.data!.isNotEmpty
                              (controller.searchController.value!='')?
    controller.searchLoader.value?Center(
      child: CupertinoActivityIndicator(
        color: K.primaryColor,
      )):
    controller.searchedOrderModel.data!.isNotEmpty?

                              buildSearchResult(context):Image.asset(AssetImages.noOrders,height: 150,):
Obx(() => controller.loading.value?Center(child:CupertinoActivityIndicator())
:                            controller.orders.isEmpty?
                            Image.asset(AssetImages.noOrders,height: 150,):
                            ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.orders.length,
                                  itemBuilder: (context, index) {
                                    // final order = controller.filteredOrders[index];
                                    return GestureDetector(
                                      onTap: () async {
                                     await   controller.getOrder(
                                            id: controller.orders[index].id);
                                     print('controller.total.value ${controller.total.value}');


                                     await    Get.to(() => BillScreen(
                                              order: controller.orderById,
                                       total:controller.total,
                                            ));
                                      },
                                      child: CustomOrdersCard(
                                          isAccepted:
                                              controller.selectedText.value ==
                                                      'طلبات جديدة'
                                                  ? false
                                                  : true,
                                          image:controller
                                              .orders[index].clientImage,
                                          onAccept: () async {
                                            await controller.acceptOrder(
                                                id: controller.orders[index].id!
                                                    .toInt(),
                                                con: context);
                                          },
                                          isRejected: controller.selectedText.value ==
                                              'طلبات تم الالغاء'||controller
                                              .orders[index].status.toString() ==
                                              'canceled'
                                              ? false
                                              : true,
                                          note:controller
                                              .orders[index].cancelationNote.toString()??'',
                                          clientName: controller
                                              .orders[index].clientName,
                                          invoicesCount: controller
                                              .orders[index].invoicesCount
                                              .toString(),
                                          total: controller.orders[index].total
                                              .toString()  ,
                                          currency: controller.orders[index].currency.toString()??'',

                                          totalBefore: controller
                                              .orders[index].totalBefore
                                              .toString(),
                                          icon: GestureDetector(
                                            child: const Icon(
                                              Icons.more_vert,
                                              size: 20,
                                            ),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: AlertDialog(
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      10.0))),
                                                      content: Builder(
                                                          builder: (context) {
                                                        // Get available height and width of the build area of this widget.
                                                        var height =
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                6;
                                                        height / 1.4;

                                                        return Container(
                                                          // width: containerWidth,
                                                          // height: containerHeight,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              controller.selectedText
                                                                          .value ==
                                                                      'طلبات مقبولة'
                                                                  ? //'طلبات تم الالغاء'

                                                                  GestureDetector(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.cancel_outlined,
                                                                            color:
                                                                                K.primaryColor,
                                                                          ),
                                                                          K.sizedboxW,
                                                                          Text(
                                                                            'الغاء الطلب',
                                                                            style:
                                                                                K.redTextStyle,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      onTap:
                                                                          () async {
                                                                        // controller.showOverlay.value = true;
                                                                        Get.back();
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
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              topLeft: Radius.circular(20),
                                                                                              topRight: Radius.circular(20),
                                                                                            ),
                                                                                            // color: Colors.white,
                                                                                          ),

                                                                                          child: Row(
                                                                                            children: [
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                                child: CircleAvatar(
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  child: IconButton(
                                                                                                    icon: Icon(Icons.cancel),
                                                                                                    onPressed: () {
                                                                                                      controller.showOverlay.value = false;
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
                                                                                                      id: controller.orders[index].id!.toInt(),
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
                                                                      },
                                                                    )
                                                                  : GestureDetector(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.edit_calendar_sharp,
                                                                            color:
                                                                                K.primaryColor,
                                                                          ),
                                                                          K.sizedboxW,
                                                                          const Text(
                                                                              'قبول الطلب '),
                                                                        ],
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        controller.acceptOrder(
                                                                            id: controller.orders[index].id);
                                                                        Get.back();
                                                                      },
                                                                      // K.sizedboxH,
                                                                    )
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          onCancel: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  insetPadding:
                                                      EdgeInsets.all(20),
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  content: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.black54,
                                                      ),
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              // padding: EdgeInsets.all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                // color: Colors.white,
                                                              ),

                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      child:
                                                                          IconButton(
                                                                        icon: Icon(
                                                                            Icons.cancel),
                                                                        onPressed:
                                                                            () {
                                                                          controller
                                                                              .showOverlay
                                                                              .value = false;
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                children: [
                                                                  Directionality(
                                                                    textDirection:
                                                                        TextDirection
                                                                            .rtl,
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          CustomAddressTextField(
                                                                        maxLines:
                                                                            10,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.w,
                                                                        hintText:
                                                                            " اكتب هنا  ".tr,
                                                                        labelText:
                                                                            "".tr,
                                                                        onChanged:
                                                                            (String
                                                                                v) {
                                                                          controller
                                                                              .notes
                                                                              .value = v;
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child:
                                                                        Button(
                                                                      color: Color(
                                                                          0xfffcf2f4),
                                                                      text: 'الغاء الطلب'
                                                                          .tr,
                                                                      size: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.5.w,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          9.h,
                                                                      isFramed:
                                                                          true,
                                                                      fontSize:
                                                                          22.sp,
                                                                      onPressed:
                                                                          () async {
                                                                        controller
                                                                            .cancelOrder(
                                                                          note: controller
                                                                              .notes
                                                                              .value,
                                                                          id: controller
                                                                              .orders[index]
                                                                              .id!
                                                                              .toInt(),
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
                                    );
                                  }),
                              ),
                              ),
                            ],
                          ),
                        ),

                      ]),
          ),
        )));
  }
}














/******************9***********************************/
class ClickableText extends StatelessWidget {
  final String text;

  const ClickableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderScreenController());

    return GestureDetector(
      onTap: () => controller.onClick(text),
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: controller.selectedText.value == text ? K.semiDarkRed : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(text,
              style: controller.selectedText.value == text
                  ? K.whiteTextStyle
                  : K.boldBlackSmallText),
        ),
      ),
    );
  }
}
Widget buildSearchResult(context) {
  final controller = Get.put(OrderScreenController());

  if (controller.searchController.value == '') {
    return Container();
  } else if (controller.searchLoader.value) {
    return Center(
      child: CupertinoActivityIndicator(
        color: K.primaryColor,
      ),
    );
  } else if (controller.searchedOrder == null) {
    return Text('No data found');
  } else {
    return  GestureDetector(
        onTap: () async {
          await   controller.getOrder(
              id: controller.searchedOrder.id);
          print('controller.total.value ${controller.total.value}');

          await    Get.to(() => BillScreen(
            order: controller.orderById,
            total:controller.total,
          ));
        },
        child: CustomOrdersCard(
            isAccepted:
            controller.searchedOrder.status ==
                'pending'
            // controller.selectedText.value ==
            //     'طلبات جديدة'
                ? false
                : true,
            onAccept: () async {
              await controller.acceptOrder(
                  id: controller.searchedOrder.id!
                      .toInt(),
                  con: context);
            },
            clientName: controller
                .searchedOrder.clientName,
            image:controller.searchedOrder.clientImage??'',
            isRejected: controller.searchedOrder.status.toString() ==
                'canceled'

                ? false
                : true,
            note:controller.searchedOrder.cancelationNote.toString()??'',

            invoicesCount: controller
                .searchedOrder.invoicesCount
                .toString(),
            total: controller.searchedOrder.total
                .toString()+'${controller.searchedOrder.currency}',
            totalBefore: controller
                .searchedOrder.totalBefore
                .toString(),
            icon: GestureDetector(
              child: const Icon(
                Icons.more_vert,
                size: 20,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (BuildContext context) {
                    return Directionality(
                      textDirection:
                      TextDirection.rtl,
                      child: AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(
                                    10.0))),
                        content: Builder(
                            builder: (context) {
                              // Get available height and width of the build area of this widget.
                              var height =
                                  MediaQuery.of(
                                      context)
                                      .size
                                      .height /
                                      6;
                              height / 1.4;

                              return Container(
                                // width: containerWidth,
                                // height: containerHeight,
                                child: Column(
                                  mainAxisSize:
                                  MainAxisSize
                                      .min,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                                  children: [
                                    controller.selectedText
                                        .value ==
                                        'طلبات مقبولة'
                                        ? //'طلبات تم الالغاء'

                                    GestureDetector(
                                      child:
                                      Row(
                                        mainAxisSize:
                                        MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.cancel_outlined,
                                            color:
                                            K.primaryColor,
                                          ),
                                          K.sizedboxW,
                                          Text(
                                            'الغاء الطلب',
                                            style:
                                            K.redTextStyle,
                                          ),
                                        ],
                                      ),
                                      onTap:
                                          () async {
                                        // controller.showOverlay.value = true;
                                        Get.back();
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
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(20),
                                                              topRight: Radius.circular(20),
                                                            ),
                                                            // color: Colors.white,
                                                          ),

                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Colors.white,
                                                                ),
                                                                child: CircleAvatar(
                                                                  backgroundColor: Colors.transparent,
                                                                  child: IconButton(
                                                                    icon: Icon(Icons.cancel),
                                                                    onPressed: () {
                                                                      controller.showOverlay.value = false;
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
                                                                      id: controller.searchedOrder.id!.toInt(),
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
                                      },
                                    )
                                        : GestureDetector(
                                      child:
                                      Row(
                                        mainAxisSize:
                                        MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.edit_calendar_sharp,
                                            color:
                                            K.primaryColor,
                                          ),
                                          K.sizedboxW,
                                          const Text(
                                              'قبول الطلب '),
                                        ],
                                      ),
                                      onTap:
                                          () {
                                        controller.acceptOrder(
                                            id: controller.searchedOrder.id);
                                        Get.back();
                                      },
                                      // K.sizedboxH,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  },
                );
              },
            ),
            onCancel: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor:
                    Colors.transparent,
                    insetPadding:
                    EdgeInsets.all(20),
                    contentPadding:
                    EdgeInsets.all(10),
                    content: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(20),
                          color: Colors.black54,
                        ),
                        margin:
                        EdgeInsets.all(10),
                        child:
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize:
                            MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets
                                    .all(10),
                                // padding: EdgeInsets.all(10),
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius
                                      .only(
                                    topLeft: Radius
                                        .circular(
                                        20),
                                    topRight: Radius
                                        .circular(
                                        20),
                                  ),
                                  // color: Colors.white,
                                ),

                                child: Row(
                                  children: [
                                    Container(
                                      decoration:
                                      BoxDecoration(
                                        shape: BoxShape
                                            .circle,
                                        color: Colors
                                            .white,
                                      ),
                                      child:
                                      CircleAvatar(
                                        backgroundColor:
                                        Colors
                                            .transparent,
                                        child:
                                        IconButton(
                                          icon: Icon(
                                              Icons.cancel),
                                          onPressed:
                                              () {
                                            controller
                                                .showOverlay
                                                .value = false;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets
                                    .all(8.0),
                                child: Column(
                                  children: [
                                    Directionality(
                                      textDirection:
                                      TextDirection
                                          .rtl,
                                      child:
                                      Container(
                                        child:
                                        CustomAddressTextField(
                                          maxLines:
                                          10,
                                          width: MediaQuery.of(context).size.width /
                                              1.w,
                                          hintText:
                                          " اكتب هنا  ".tr,
                                          labelText:
                                          "".tr,
                                          onChanged:
                                              (String
                                          v) {
                                            controller
                                                .notes
                                                .value = v;
                                          },
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child:
                                      Button(
                                        color: Color(
                                            0xfffcf2f4),
                                        text: 'الغاء الطلب'
                                            .tr,
                                        size: MediaQuery.of(context)
                                            .size
                                            .width /
                                            1.5.w,
                                        height: MediaQuery.of(context)
                                            .size
                                            .width /
                                            9.h,
                                        isFramed:
                                        true,
                                        fontSize:
                                        22.sp,
                                        onPressed:
                                            () async {
                                          controller
                                              .cancelOrder(
                                            note: controller
                                                .notes
                                                .value,
                                            id: controller.searchedOrder.id!
                                                .toInt(),
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
            }));
  }}
