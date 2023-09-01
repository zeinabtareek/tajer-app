import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/screens/home_screen/home_screen.dart';
import 'package:tajer/screens/notification_screen/controller/notification_screen_controller.dart';

import '../../componants/custom_notification_card.dart';
import '../../constants/style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationScreenController());
    // final co
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'الاشعارات',
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
        body: Obx(
          () => controller.state == ViewState.busy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: controller.notifications!.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return (controller.notifications!.data![index]
                                            .image ==
                                        null)
                                    ? SizedBox(
                                        height: 150,
                                        child: Card(
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9),
                                                  child: Image.network(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR34hPo9zGkYxB2NKePgvPeImdm-CDTsHPrt4DFUyU_4A&s",
                                                      width:
                                                          double.infinity,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Text(
                                                controller
                                                        .notifications
                                                        ?.data?[index]
                                                        .body ??
                                                    "",
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          K.sizedboxH,
                                          // K.sizedboxH,
                                          Card(
                                            // color: ,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            shadowColor: Colors.blueAccent,
                                            elevation: 5,
                                            child: Row(
                                              children: [
                                                ClipPath(
                                                  clipper:
                                                      const ShapeBorderClipper(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                      child: Container(
                                                    width: 10 * 4.0,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    padding:
                                                        EdgeInsets.all(7.sp),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        right: BorderSide(
                                                          color: K.semiDarkRed,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              10.w,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: K.whiteColor,
                                                    ),
                                                  )),
                                                ),
                                                K.sizedboxW,
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            controller
                                                                    .notifications
                                                                    ?.data?[
                                                                        index]
                                                                    .data
                                                                    ?.providerName ??
                                                                "",
                                                            // style: K.boldBlackSmallText,
                                                          ),
                                                          Text(
                                                            controller
                                                                    .notifications
                                                                    ?.data?[
                                                                        index]
                                                                    .data
                                                                    ?.orderNumber
                                                                    .toString() ??
                                                                "",
                                                            // style: K.boldBlackSmallText,
                                                          ),
                                                        ],
                                                      ),
                                                      // K.sizedboxH,
                                                      Text(
                                                        controller
                                                                .notifications
                                                                ?.data?[index]
                                                                .body ??
                                                            "",
                                                        // style: K.boldBlackSmallText,
                                                      ),
                                                    ],
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          K.sizedboxH,
                                          Text(
                                            controller.notifications!
                                                .data![index].date!,
                                            style:
                                                TextStyle(color: K.mainColor),
                                          )
                                        ],
                                      );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
