
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajer/screens/support_screen/support_screen.dart';

import '../constants/style.dart';
import '../data/data.dart';
import '../screens/home/home_controller/home_controller.dart';
import '../screens/notification_screen/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements

    PreferredSizeWidget{
    CustomAppBar({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final HomeController controller;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Obx(() => Text(
        screensWithTitle[controller.activePage.value].last,
        style: K.boldBlackText,
      )),
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
        onTap: (){

          Get.to(()=>SupportScreen());
        },
        child: Icon(
          Icons.notifications_active,
          color: K.semiDarkRed.withOpacity(.9),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.shopify,
            color: K.semiDarkRed.withOpacity(.9),
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60);
}
