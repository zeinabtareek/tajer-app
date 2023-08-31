
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajer/constants/style.dart';


void showCustomSnackBar({String? message, bool isError = true}) {
  if (message != null && message.isNotEmpty) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin:   EdgeInsets.all(5),
      duration: const Duration(seconds: 3),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      content: Text(message, style: K.whiteTextStyle),
    ));
  }
}