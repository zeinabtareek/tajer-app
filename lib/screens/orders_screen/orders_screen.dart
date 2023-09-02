import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';

import '../../componants/custom_app_bar.dart';
import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
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
                    // alignment: AlignmentDirectional.center,
                    children: [
                        Opacity(
                          opacity: controller.showOverlay.value ? 0.3 : 1.0,
                          child: Column(
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
                                onChanged: (String) {},
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
                                          onAccept: () async {
                                            await controller.acceptOrder(
                                                id: controller.orders[index].id!
                                                    .toInt(),
                                                con: context);
                                          },
                                          clientName: controller
                                              .orders[index].clientName,
                                          invoicesCount: controller
                                              .orders[index].invoicesCount
                                              .toString(),
                                          total: controller.orders[index].total
                                              .toString(),
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
                            ],
                          ),
                        ),
                        // if (controller.showOverlay.value)
                        // Positioned.fill(
                        //   bottom: 0,
                        //   top: 0,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       controller.showOverlay.value = false;
                        //     },
                        //     child: Container(
                        //       color: Colors.black54,
                        //       height: MediaQuery.of(context).size.height,
                        //       padding: EdgeInsets.all(20),
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.end,
                        //         children: [
                        //           Container(
                        //             decoration: const BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: Colors.white,
                        //             ),
                        //             child: CircleAvatar(
                        //               backgroundColor: Colors.transparent,
                        //               child: IconButton(
                        //                 icon: Icon(Icons.cancel),
                        //                 onPressed: () {
                        //                   controller.showOverlay.value = false;
                        //                 },
                        //               ),
                        //             ),
                        //           ),
                        //           K.sizedboxH,
                        //           Container(
                        //
                        //             child: CustomAddressTextField(
                        //               maxLines: 10,
                        //               width:
                        //                   MediaQuery.of(context).size.width / 1.w,
                        //               hintText: " اكتب هنا  ".tr,
                        //               labelText: "".tr,
                        //               onChanged: (String v) {
                        //                 controller.notes.value = v;
                        //               },
                        //             ),
                        //           ),
                        //           K.sizedboxH,
                        //           K.sizedboxH,
                        //           Center(
                        //             child: Button(
                        //                 color: Color(0xfffcf2f4),
                        //                 text: 'الغاء الطلب'.tr,
                        //                 size: MediaQuery.of(context).size.width /
                        //                     1.5.w,
                        //                 height:
                        //                     MediaQuery.of(context).size.width /
                        //                         9.h,
                        //                 isFramed: true,
                        //                 fontSize: 22.sp,
                        //                 onPressed: () async {
                        //                  // controller.cancelOrder(note: controller.notes.value,id:  controller.orders[index].id!.toInt() );
                        //                 }),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ]),
          ),
        )));
  }
}

//
// class MyPage extends StatefulWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   _MyPageState createState() => _MyPageState();
// }
//
// class _MyPageState extends State<MyPage> {
//   bool _showOverlay = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//       ),
//       body: Stack(
//         children: [
//           // The current screen
//           Opacity(
//             opacity: _showOverlay ? 0.3 : 1.0,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _showOverlay = true;
//                   });
//                 },
//                 child: Text('Show Overlay'),
//               ),
//             ),
//           ),
//
//           // The overlay screen
//           // if (_showOverlay)
//           //   Positioned.fill(
//           //     child: GestureDetector(
//           //       onTap: () {
//           //         setState(() {
//           //           _showOverlay = false;
//           //         });
//           //       },
//           //       child: Container(
//           //         color: Colors.black54,
//           //         child: Center(
//           //           child: Container(
//           //             height: 200,
//           //             width: 200,
//           //             decoration: BoxDecoration(
//           //               color: Colors.white,
//           //               borderRadius: BorderRadius.circular(10),
//           //             ),
//           //             child: Column(
//           //               mainAxisAlignment: MainAxisAlignment.center,
//           //               children: [
//           //                 Text('This is the overlay screen'),
//           //                 ElevatedButton(
//           //                   onPressed: () {
//           //                     setState(() {
//           //                       _showOverlay = false;
//           //                     });
//           //                   },
//           //                   child: Text('Hide Overlay'),
//           //                 ),
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//         ],
//       ),
//     );
//   }
// }

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
