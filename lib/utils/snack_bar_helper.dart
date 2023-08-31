import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../constants/style.dart';
import '../helpers/responsive.dart';

void showSnackBar(String title, String message,
    {
      Color? color,
      Color? textColor,
    String? iconSVG,
    int? durationInSeconds,
    Duration? duration,
    List<Widget>? actions,
    VoidCallback? onTap,
    required BuildContext context}) {
  bool isTablet = Responsive.isTablet(Get.context!);

  showTopSnackBar(
      Overlay.of(context)!,
      Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (iconSVG != null)
                Row(
                  children: [
                    SvgPicture.asset(
                      iconSVG,
                      width: isTablet ? 25 : 50.0,
                      height: isTablet ? 25 : 50.0,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 18.0,
                        color:textColor?? K.whiteColor,
                        // color: K.mainColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: isTablet ? 26 : 16.0,
                        color: textColor??K.whiteColor,
                        // color: K.mainColor,
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                    ),
                    if (actions != null)
                      Column(
                        children: actions,
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
      onTap: onTap,
      animationDuration: const Duration(milliseconds: 800),
      displayDuration: duration ?? Duration(seconds: durationInSeconds!));
}
