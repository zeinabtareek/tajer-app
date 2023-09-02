import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/enum/view_state.dart';
import 'package:tajer/screens/orders_screen/orders_screen.dart';
import '../../componants/custom_app_bar.dart';
import '../../componants/custom_button.dart';
import '../../componants/drawer_notification.dart';
import '../../constants/style.dart';
import '../../helpers/cache_helper.dart';
import '../../utils/app_constants.dart';
import '../credit_screen/credit_screen.dart';
import '../home/home_controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      drawer: DrawerNotification(),
        appBar: CustomAppBar(
          controller: controller,
          onTap: () {
            Get.to(() => const OrdersScreen());
          },
        ),
        body: Obx(
          () => controller.state == ViewState.busy
              ? Center(
                  child: CupertinoActivityIndicator(
                    color: K.primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


    //                   TextButton(onPressed: () async {
    // var token;
    //
    // token = await CacheHelper.getData(key: AppConstants.token);
    //                     controller.getHomeData(token);
    //                   }, child: Text('mcjc')),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const CreditScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5.w,
                          height: MediaQuery.of(context).size.height / 12.w,
                          // padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: K.darkRed,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              // Set the desired radius value
                              bottomRight: Radius.circular(
                                  10.0), // Set the desired radius value
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.3.w,
                                  height:
                                      MediaQuery.of(context).size.height / 35.w,
                                  decoration: BoxDecoration(
                                    color: K.semiDarkRed,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      // Set the desired radius value
                                      bottomRight: Radius.circular(
                                          10.0), // Set the desired radius value
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                        // controller.chart?.accountBalance.toString()??'',
                                      '  ${controller.chart?.accountBalance.toString()??''}  رصيد التاجر   ',
                                      style: TextStyle(
                                          color: K.whiteColor, fontSize: 15.sp),
                                    ),
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'رصيد التاجر  ',
                                    style: TextStyle(
                                        color: K.whiteColor, fontSize: 15.sp),
                                  ),
                                  Text( controller.chart?.accountBalance.toString()??'' ,

                                      style: TextStyle(
                                        color: K.whiteColor, fontSize: 15.sp),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'الاسبوع',
                          style: K.boldBlackSmallText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: context.height / 3,
                          child: BarChart(
                            BarChartData(
                              maxY: 20,
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.grey,
                                  getTooltipItem: (a, b, c, d) => null,
                                ),

                                // touchCallback: (FlTouchEvent event, response) {
                                //   if (response == null || response.spot == null) {
                                //     setState(() {
                                //       touchedGroupIndex = -1;
                                //       showingBarGroups = List.of(rawBarGroups);
                                //     });
                                //     return;
                                //   }
                                //
                                //   touchedGroupIndex =
                                //       response.spot!.touchedBarGroupIndex;
                                //
                                //   setState(() {
                                //     if (!event.isInterestedForInteractions) {
                                //       touchedGroupIndex = -1;
                                //       showingBarGroups = List.of(rawBarGroups);
                                //       return;
                                //     }
                                //     showingBarGroups = List.of(rawBarGroups);
                                //     if (touchedGroupIndex != -1) {
                                //       var sum = 0.0;
                                //       for (final rod
                                //           in showingBarGroups[touchedGroupIndex]
                                //               .barRods) {
                                //         sum += rod.toY;
                                //       }
                                //       final avg = sum /
                                //           showingBarGroups[touchedGroupIndex]
                                //               .barRods
                                //               .length;
                                //
                                //       showingBarGroups[touchedGroupIndex] =
                                //           showingBarGroups[touchedGroupIndex]
                                //               .copyWith(
                                //         barRods: showingBarGroups[touchedGroupIndex]
                                //             .barRods
                                //             .map((rod) {
                                //           return rod.copyWith(
                                //               toY: avg, color: widget.avgColor);
                                //         }).toList(),
                                //       );
                                //     }
                                //   });
                                // },
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
                                    getTitlesWidget: (d, m) {
                                      return SideTitleWidget(
                                        axisSide: m.axisSide,
                                        space: 16, //margin top
                                        child:
                                            Text(controller.titles[d.toInt()]),
                                      );
                                    },
                                    reservedSize: 42,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 28,
                                    interval: 1,
                                    getTitlesWidget: (d, m) {
                                      String text;
                                      if (d == 0) {
                                        text = '1K';
                                      } else if (d == 10) {
                                        text = '5K';
                                      } else if (d == 19) {
                                        text = '10K';
                                      } else {
                                        return Container();
                                      }
                                      return SideTitleWidget(
                                        axisSide: m.axisSide,
                                        space: 0,
                                        child: Text(text,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              // color: Color(0xff7589a2),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: controller.showingBarGroups,
                              gridData: FlGridData(show: false),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 10),
                            child: Text(
                              'احدث الطلبات',
                              style: K.boldBlackSmallText,
                            ),
                          ),
                        ],
                      ),
                      controller.chart?.recentOrders?.isEmpty == true
                          ? const SizedBox()
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,

                              // itemCount: 3,
                              itemCount: controller.chart?.recentOrders?.length,
                              itemBuilder: (ctx, index) => CustomOrdersCard(
                                  onAccept: () {
                                    // Get.to(() => BillScreen(
                                    //   order:controller
                                    //       .chart?.recentOrders?[index] ,
                                    // ));
                                  },
                                  clientName: controller
                                      .chart?.recentOrders?[index].clientName,
                                  invoicesCount: controller
                                      .chart?.recentOrders?[index].invoicesCount
                                      .toString(),
                                  total: controller
                                      .chart?.recentOrders?[index].total
                                      .toString(),
                                  totalBefore: controller
                                      .chart?.recentOrders?[index].totalBefore
                                      .toString(),
                                  icon: GestureDetector(
                                    child: const Icon(
                                      Icons.more_vert,
                                      size: 20,
                                    ),
                                    onTap: () {},
                                  ),
                                  onCancel: () {})),
                    ],
                  ),
                ),
        ));
  }
}

class CustomSlopText extends StatelessWidget {
  const CustomSlopText({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: color ?? Colors.red),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Container(
            height: 1,
            width: 50,
            color: Colors.transparent,
            child: Transform.rotate(
              angle: -45 * 3.141592 / 290,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomOrdersCard extends StatelessWidget {
  final Widget? icon;
  final Function()? onCancel;
  final Function()? onAccept;
  final String? clientName;
  final String? invoicesCount;
  final String? total;
  final String? totalBefore;
  final bool? isAccepted;

  const CustomOrdersCard(
      {Key? key,
      this.icon,
      this.onCancel,
      this.clientName,
      this.total,
      this.invoicesCount,
      this.isAccepted,
      this.onAccept,
      this.totalBefore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      margin: EdgeInsets.only(
        bottom: 18,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: K.lightMainColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/test.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // K.sizedboxW,
                Column(
                  children: [
                    Text(
                      clientName ?? "",
                      style: K.boldBlackSmallText,
                    ),
                    K.sizedboxH,
                    RichText(
                      text: TextSpan(
                        text: ' عرض ',
                        // text: ' عرض $invoicesCount  ',
                        style: K.redTextStyle,
                        // children:<InlineSpan> [
                        children: [
                          TextSpan(
                            // text: 'عرض 2 ',
                            text: ' $total ',
                            style: K.boldBlackSmallText,
                            // style:K.redTextStyle,
                          ),
                          // K.sizedboxW,
                          WidgetSpan(
                            child: CustomSlopText(
                              text: totalBefore ?? "0.0",
                              color: K.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                K.sizedboxW,
                isAccepted == true ? icon! : SizedBox()
              ],
            ),
          ),
          // isAccepted ==false?
          isAccepted == true
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                        color: K.primaryColor,
                        text: 'قبول الطلب'.tr,
                        size: MediaQuery.of(context).size.width / 1.5.w,
                        height: MediaQuery.of(context).size.width / 14.h,
                        isFramed: false,
                        fontSize: 22.sp,
                        onPressed: onAccept),
                    Button(
                      text: 'X'.tr,
                      size: 50,
                      color: K.darkRed,
                      height: MediaQuery.of(context).size.width / 14.h,
                      isFramed: false,
                      fontSize: 22.sp,
                      onPressed: onCancel,
                    )
                  ],
                )
        ],
      ),
    );
  }
}
