import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';
// import 'package:draggable_fab/draggable_fab.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import 'package:tajer/screens/support_screen/support_screen.dart';
import '../../constants/style.dart';
import '../../data/data.dart';
import '../reports_screen/reports_screen.dart';
import 'home_controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final Size _size = MediaQuery.of(context).size;

    // return Scaffold(
    //   // backgroundColor: Colors.transparent,
    //   extendBody: true,
    //
    //   floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    //
    //   floatingActionButton: FloatingActionButton(
    //     backgroundColor:    Color(0xfff3e9eb),//0xff41,
    //     onPressed: (){
    //       Get.to(SupportScreen());
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Image.asset('assets/images/chat.png',color:K.semiDarkRed),
    //     ),  ),
    //   body:  SafeArea(child:
    //   Obx(() =>
    //   controller.connection.connectivity.value == 1
    //         ?
    //
    //   screensWithTitle[controller.activePage.value].first:
    //     Center(
    //     child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     // crossAxisAlignment: ,
    //     children: [
    //       Image.asset(
    //         'assets/images/ic_no_connection.png',
    //         height: 300.h,
    //         width: 300.w,
    //         color: K.primaryColor,
    //       ),
    //       Text(
    //         'لا يوجد اتصال بالانترنت'.tr,
    //         style: TextStyle(
    //             fontSize: 25.sp,
    //             color: K.primaryColor,
    //             fontWeight: FontWeight.bold),
    //       ),
    //     ],
    //   )))
    //
    //   ),
    //
    //   bottomNavigationBar: Obx(() => CurvedNavigationBar(
    //         index: 3,
    //         items: <Widget>[
    //           Icon(
    //             Icons.settings,
    //             size: controller.activePage.value ==0? 40:25,
    //             color: controller.activePage.value == 0
    //                 ? K.primaryColor
    //                 :  K.mainColor,
    //           ),
    //           Icon(
    //             Icons.add_chart,
    //             size: controller.activePage.value == 1?40:25,
    //             color: controller.activePage.value == 1
    //                 ? K.primaryColor
    //                 :  K.mainColor,
    //           ),
    //           Icon(
    //             Icons.qr_code_scanner,
    //             size: controller.activePage.value == 2?40:25,
    //             color: controller.activePage.value == 2
    //                 ? K.primaryColor
    //                 :  K.mainColor,
    //           ),
    //            Icon(
    //               Icons.home_rounded,
    //               size: controller.activePage.value == 3?40:25,
    //               color: controller.activePage.value == 3
    //                   ? K.primaryColor
    //                   :  K.mainColor,
    //             ),
    //         ],
    //         backgroundColor:  Colors.transparent,
    //         onTap: (index) { controller.jumpToPage(index);  },
    //       )),
    // );



   return  Scaffold(
          extendBody: true,


       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
       //
         floatingActionButton: FloatingActionButton(
           backgroundColor:    Color(0xfff3e9eb),//0xff41,
           onPressed: (){
             Get.to(SupportScreen());
           },
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset('assets/images/chat.png',color:K.semiDarkRed),
           ),  ),

        body: Obx(() =>
          controller.connection.connectivity.value == 1
                ?

          screensWithTitle[controller.activePage.value].first:
            Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: ,
            children: [
              Image.asset(
                'assets/images/ic_no_connection.png',
                height: 300.h,
                width: 300.w,
                color: K.primaryColor,
              ),
              Text(
                'لا يوجد اتصال بالانترنت'.tr,
                style: TextStyle(
                    fontSize: 25.sp,
                    color: K.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ))),
        bottomNavigationBar: Obx(() =>CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.white,
          height: 50.0,
          index: controller.activePage.value,
          animationDuration: Duration(
            milliseconds: 200,
          ),
          animationCurve: Curves.bounceIn,
          items: <Widget>[
          Icon(
                      Icons.settings,
                      size: controller.activePage.value ==0? 40:25,
                      color: controller.activePage.value == 0
                          ? K.primaryColor
                          :  K.mainColor,
                    ),
                    Icon(
                      Icons.add_chart,
                      size: controller.activePage.value == 1?40:25,
                      color: controller.activePage.value == 1
                          ? K.primaryColor
                          :  K.mainColor,
                    ),
                    Icon(
                      Icons.qr_code_scanner,
                      size: controller.activePage.value == 2?40:25,
                      color: controller.activePage.value == 2
                          ? K.primaryColor
                          :  K.mainColor,
                    ),
                     Icon(
                        Icons.home_rounded,
                        size: controller.activePage.value == 3?40:25,
                        color: controller.activePage.value == 3
                            ? K.primaryColor
                            :  K.mainColor,
                      ),
          ],
          onTap: (index) { controller.jumpToPage(index);  },
        )));
  }


}
