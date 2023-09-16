import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class K{
  static   Color primaryColor= Color(0xffb6132c);
  static   Color darkRed= Color(0xff41050f);
  static   Color semiDarkRed= Color(0xff6c0111);
  static   Color lightMainColor= Color(0xfff3f3f3);
  static   Color mainColor= Color(0xff8a8a8a);
  static   Color blackColor= Colors.black;
  static   Color whiteColor= Colors.white;
  // static const mainColor=Colors.grey;
  // // static const blackColor=Colors.grey;


  static  final sizedboxH=   SizedBox(
    height: 15.h,
  );
  static  final sizedboxW=   SizedBox(
    width: 20.w,
  );
  static final boxDecoration= BoxDecoration(
    border: Border.all(color: primaryColor,width: 2),
    borderRadius: BorderRadius.circular(10),
  );
  static final boxDecorationWithGreyBorder= BoxDecoration(
    border: Border.all(color: mainColor.withOpacity(.5),width: 1),
    borderRadius: BorderRadius.circular(10),
  );
  static final boxDecorationLightGrey= BoxDecoration(
    color: K.lightMainColor,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: K.lightMainColor,
      width: 2.0, // set border width
    ),
  );
  static get appTheme => ThemeData(
      colorScheme: _customColorScheme,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          foregroundColor: blackColor,
          shadowColor: blackColor.withAlpha(50)));

static final ColorScheme _customColorScheme = ColorScheme(
  primary:primaryColor,
  secondary: primaryColor,
  surface:  mainColor,
  background:  mainColor,
  onError:  blackColor,
  brightness: Brightness.light,
  error: Colors.red,
  onBackground:  blackColor,
  onPrimary: mainColor,
  onSecondary: primaryColor,
  onSurface: primaryColor,
);
  static final boldBlackText=TextStyle(color:  blackColor,fontWeight: FontWeight.w700,fontSize: 25.sp);
  static final boldBlackSmallText=TextStyle(color:  blackColor,fontWeight: FontWeight.w600,fontSize: 20.sp);
  static final blackText=TextStyle(color:  blackColor,fontWeight: FontWeight.w400,fontSize: 15.sp);
  static final boldBlackSmall=TextStyle(color:  blackColor,fontWeight: FontWeight.w600,fontSize: 15.sp);
  static final redTextStyle=TextStyle(color:  primaryColor,fontWeight: FontWeight.w500,fontSize: 15.sp);
  static final smallredTextStyle=TextStyle(color:  primaryColor,fontWeight: FontWeight.w500,fontSize: 13.sp);
  static final whiteTextStyle=TextStyle(color:  whiteColor,fontWeight: FontWeight.w500,fontSize: 18.sp);

}