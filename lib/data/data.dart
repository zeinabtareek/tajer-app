import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/qr_screen/qr_screen.dart';
import '../screens/reports_screen/reports_screen.dart';
import '../screens/setting_screen/setting_screen.dart';

List<List> screensWithTitle = [
  [  SettingScreen(), "الاعدادات"],
  [  ReportsScreen(), "التقارير"],
  [  QrScreen(), "التقارير"],
  // [    PerformanceScreen(), "الصفحة الرئيسية"],
  [  const HomeScreen(), "الصفحة الرئيسية"],
  // [  ReportsScreen(), "التقارير"],

];


GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
