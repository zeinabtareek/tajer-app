import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
import '../../constants/style.dart';
import '../home/home.dart';
import '../support_screen/support_screen.dart';
import 'controller/login_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        body: Center(
            child: Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('تسجيل الدخول'.tr, style: K.boldBlackText),
            Column(
              children: [
                CustomAddressTextField(
                  width: MediaQuery.of(context).size.width / 1.5.w,
                  hintText: "   ".tr,
                  labelText: "رقم الهاتف".tr,
                  onChanged: (String v) {
                    controller.phoneController.value = v;
                  },
                ),
                K.sizedboxH,
                K.sizedboxH,
                CustomAddressTextField(
                  width: MediaQuery.of(context).size.width / 1.5.w,
                  hintText: " ".tr,
                  labelText: " كلمه المرور".tr,
                  onChanged: (String v) {
                    controller.passController.value = v;
                  },
                ),
              ],
            ),
            Button(
                color: K.primaryColor,
                text: 'تسجيل الدخول'.tr,
                size: MediaQuery.of(context).size.width / 1.5.w,
                height: MediaQuery.of(context).size.width / 9.h,
                isFramed: false,
                fontSize: 22.sp,
                onPressed: () async {
                  controller.login();
                  // Get.to(Home());
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Text(
                    '\t\t\tهل نسيت كلمه السر؟\t\t',
                    style: K.boldBlackSmallText,
                  ),
                  onTap: () {
                    Get.to(() => SupportScreen());
                  },
                )
              ],
            )
          ]),
    )));
  }
}
