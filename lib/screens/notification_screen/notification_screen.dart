import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/screens/home_screen/home_screen.dart';
import 'package:tajer/screens/notification_screen/controller/notification_screen_controller.dart';

import '../../componants/custom_notification_card.dart';
import '../../constants/style.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
          actions: [ IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ))],
          leading: SizedBox(),
          title: Text(
            'الاشعارات',
            style: K.boldBlackText,
          ),
          backgroundColor: Colors.transparent),
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

                        Obx(() => controller.state == ViewState.busy
                            ? const Center(
                                child: CupertinoActivityIndicator(),
                              )
                            : controller.notifications!.data!.isEmpty
                                ? noNotificationWidget()
                                : ListView.builder(
                                    itemCount:
                                        controller.notifications!.data!.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return (controller.notifications!
                                                  .data![index].image !=
                                              null)
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 110,
                                                  child: Card(
                                                    elevation: 1,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: controller
                                                                        .notifications
                                                                        ?.data?[
                                                                            index]
                                                                        .image ??
                                                                    '',
                                                                // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR34hPo9zGkYxB2NKePgvPeImdm-CDTsHPrt4DFUyU_4A&s",
                                                                width: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    Center(
                                                                        child:
                                                                            CupertinoActivityIndicator()),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error),
                                                                fadeInDuration:
                                                                    Duration
                                                                        .zero,
                                                                fadeOutDuration:
                                                                    Duration
                                                                        .zero,
                                                              )
                                                              // Image.network(
                                                              //     controller
                                                              //         .notifications
                                                              //         ?.data?[index]
                                                              //         .image ??
                                                              //         "",
                                                              //      // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR34hPo9zGkYxB2NKePgvPeImdm-CDTsHPrt4DFUyU_4A&s",
                                                              //     width:
                                                              //     double.infinity,
                                                              //     fit: BoxFit.cover),
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
                                                ),
                                                Text(
                                                  controller.getTimeDifference(
                                                    controller.currentDateTime,
                                                    controller
                                                            .notifications
                                                            ?.data?[index]
                                                            .date ??
                                                        '',
                                                  ),
                                                  style: TextStyle(
                                                      color: K.mainColor,
                                                      fontSize: 12.sp),
                                                ),
                                                // K.sizedboxH,
                                              ],
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
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  shadowColor:
                                                      Colors.blueAccent,
                                                  elevation: 2,
                                                  child: Row(
                                                    children: [
                                                      ClipPath(
                                                        clipper:
                                                            const ShapeBorderClipper(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(15),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                            child: Container(
                                                          width: 10 * 4.0,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              10,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  7.sp),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              right: BorderSide(
                                                                color: K
                                                                    .semiDarkRed,
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
                                                            size: 25.sp,
                                                          ),
                                                        )),
                                                      ),
                                                      // K.sizedboxW,
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      // color:K.blackColor,
                                                                      child:
                                                                          Text(
                                                                        // 'small TextStylesmal edTextSStylesmal edTextSStylesmal edTextStyle',
                                                                        controller.notifications?.data?[index].data?.providerName ??
                                                                            "".toUpperCase(),

                                                                        style: K
                                                                            .smallredTextStyle,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                            .notifications
                                                                            ?.data?[index]
                                                                            .data
                                                                            ?.orderNumber
                                                                            .toString() ??
                                                                        "",
                                                                    style: K
                                                                        .smallredTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                              // K.sizedboxH,

                                                              Text(
                                                                controller
                                                                        .notifications
                                                                        ?.data?[
                                                                            index]
                                                                        .body ??
                                                                    "",
                                                              ),
                                                            ],
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // K.sizedboxH,
                                                // Text(
                                                //   controller.notifications!
                                                //       .data![index].date!,
                                                //   style:
                                                //   TextStyle(color: K.mainColor),
                                                // ),
                                                Text(
                                                  controller.getTimeDifference(
                                                    controller.currentDateTime,
                                                    controller
                                                            .notifications
                                                            ?.data?[index]
                                                            .date ??
                                                        '',
                                                  ),
                                                  style: TextStyle(
                                                      color: K.mainColor,
                                                      fontSize: 12.sp),
                                                ),
                                                // K.sizedboxH,
                                              ],
                                            );
                                    }))
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );

// child:
  }
}

Widget noNotificationWidget() {
  return Column(
    children: [
      Image.asset('assets/images/no_notification.png'),
      K.sizedboxH,
      Text('لا يوجد إشعارات حتى الآن'),
      Text(
        'عندما تتلقى إشعارات، ستظهر هنا',
        style: TextStyle(fontSize: 12, color: K.mainColor),
      ),
    ],
  );
}
