import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tajer/helpers/cache_helper.dart';
import 'package:tajer/helpers/local_notification.dart';
import 'package:tajer/model/notification_model.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

import 'package:tajer/screens/splash_screen/splash_screen.dart';
import 'package:tajer/utils/app_constants.dart';
import 'constants/style.dart';
import 'helpers/get_di.dart' as di;
import 'package:firebase_core/firebase_core.dart';

import 'model/reprt_model.dart';

NotificationService notificationService = NotificationService();

Future<void> messageHandler(RemoteMessage message) async {
  NotificationModel notificationMessage =
      NotificationModel.fromJson(message.data);
  notificationService.showNotification(
      1, notificationMessage.title!, notificationMessage.message!, "1");
  print('notification from background : ${notificationMessage.title}');
}

void firebaseMessagingListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    NotificationModel notificationMessage =
        NotificationModel.fromJson(message.data);
    notificationService.showNotification(
        1, notificationMessage.title!, notificationMessage.message!, "1");
    print('notification from foreground : ${notificationMessage.title}');
  });
}

main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Map<String, Map<String, String>> languages = await di.init();
  await Firebase.initializeApp();
  await notificationService.init();
  FirebaseMessaging.onBackgroundMessage(messageHandler);
  firebaseMessagingListener();
  print(CacheHelper.getData(key: AppConstants.token));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(460, 847),
        builder: (BuildContext, Widget) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return GetMaterialApp(
            theme: K.appTheme,
            // translations: Languages(),
            // locale: language,
            fallbackLocale: Locale('ar'),
            debugShowCheckedModeBanner: false,
            // home: CreditScreen(),
            // home: Test(),
            home: SplashScreen(),
            // home: LogInScreen(),
          );
        });
  }
}







class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String ?scanresult; //varaible for scan result text

  @override
  void initState() {
    scanresult = "none"; //innical value of scan result is "none"
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("QR or Bar code Scanner"),
          backgroundColor: Colors.redAccent
      ),
      body:Container(
          alignment: Alignment.topCenter, //inner widget alignment to center
          padding: EdgeInsets.all(20),
          child:Column(
            children:[
              Container(
                  child: Text("Scan Result: " + scanresult!)
              ),
              Container(
                  margin: EdgeInsets.only(top:30),
                  child: TextButton( //button to start scanning
                      // color: Colors.redAccent,
                      // colorBrightness: Brightness.dark,
                      onPressed: () async {
                        // scanresult = await scanner.scan();
                        setState(() { //refresh UI to show the result on app
                        });
                      },
                      child: Text("Scan QR or Bar Code")
                  )
              )
            ],
          )
      ),
    );
  }
// }
}



















class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

class BarChartSample2 extends StatefulWidget {
  final double padding;
  ReportModel reportModel;
  final isStartSearch;

  BarChartSample2(
      {super.key,
      required this.padding,
      required this.reportModel,
      required this.isStartSearch});

  final Color leftBarColor = K.primaryColor;
  final Color rightBarColor = K.semiDarkRed.withOpacity(.4);
  final Color avgColor = K.semiDarkRed;

  // AppColors.contentColorOrange.avg(AppColors.contentColorRed);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 4;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final dynamicValue=makeGroupData(1, 20, 20);//monday
    final orderChart = widget.reportModel.ordersChart;
    final barGroup1 = !widget.isStartSearch
        ? makeGroupData(0, 10, 10)
        : makeGroupData(
            0,
            double.parse(orderChart!.sunday!.companyShare.toString() ?? '0'),
            double.parse(orderChart.sunday!.total.toString() ?? '0')); //sunday
    final barGroup2 = !widget.isStartSearch
        ? makeGroupData(1, 10, 10)
        : makeGroupData(
            1,
            double.parse(orderChart!.monday!.companyShare.toString() ?? '0'),
            double.parse(orderChart.monday!.total.toString() ?? '0')); //monday
    final barGroup3 = !widget.isStartSearch
        ? makeGroupData(2, 10, 10)
        : makeGroupData(
            2,
            double.parse(orderChart!.tuesday!.companyShare.toString() ?? '0'),
            double.parse(
                orderChart.tuesday!.total.toString() ?? '0')); //tuesday
    final barGroup4 = !widget.isStartSearch
        ? makeGroupData(3, 10, 10)
        : makeGroupData(
            3,
            double.parse(orderChart!.wednesday!.companyShare.toString() ?? '0'),
            double.parse(
                orderChart.wednesday!.total.toString() ?? '0')); //wednessDay
    final barGroup5 = !widget.isStartSearch
        ? makeGroupData(4, 10, 10)
        : makeGroupData(
            4,
            double.parse(orderChart!.thursday!.companyShare.toString() ?? '0'),
            double.parse(
                orderChart.thursday!.total.toString() ?? '0')); //thursDay
    final barGroup6 = !widget.isStartSearch
        ? makeGroupData(5, 10, 10)
        : makeGroupData(
            5,
            double.parse(orderChart!.friday!.companyShare.toString() ?? '0'),
            double.parse(orderChart.friday!.total.toString() ?? '0')); //Friday
    final barGroup7 = !widget.isStartSearch
        ? makeGroupData(6, 10, 10)
        : makeGroupData(
            6,
            double.parse(orderChart!.saturday!.companyShare.toString() ?? '0'),
            double.parse(
                orderChart.saturday!.total.toString() ?? '0')); //Saturday

    // final barGroup1 = makeGroupData(0, 1, 1);
    // final barGroup2 = makeGroupData(1, 16, 12);
    // final barGroup3 = makeGroupData(2, 18, 5);
    // final barGroup4 = makeGroupData(3, 20, 16);
    // final barGroup5 = makeGroupData(4, 17, 6);
    // final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: !widget.isStartSearch
                      ? 6
                      : double.parse(
                          widget.reportModel.ordersChart!.max.toString())
                  //Saturday
                  ,
                  minY: !widget.isStartSearch
                      ? 20
                      : double.parse(
                          widget.reportModel.ordersChart!.min.toString())
                  //Saturday
                  ,
                  // maxY: 50,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                  toY: avg, color: widget.avgColor);
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      // color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = ' ';
      // text = '1K';
    } else if (value == 10) {
      text = ' ';
      // text = '5K';
    } else if (value == 19) {
      text = ' ';
      // text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Su', 'Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Colors.black,
        // color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
