import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/style.dart';
import '../../data/data.dart';
import 'home_controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body:  SafeArea(child:
      Obx(() =>
      controller.connection.connectivity.value == 1
            ?

      screensWithTitle[controller.activePage.value].first:
        Scaffold(
        body: Center(
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
      )))
      ),
      ),

      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            index: 3,
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
            color: K.lightMainColor,
            buttonBackgroundColor: K.lightMainColor,
            backgroundColor:  K.lightMainColor,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) { controller.jumpToPage(index);  },
            letIndexChange: (index) => true,
          )),
    );
  }
}
