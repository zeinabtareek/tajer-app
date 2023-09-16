import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/custom_button.dart';
import '../../componants/custom_drop_btn.dart';
import '../../componants/custom_pie_card.dart';
import '../../constants/style.dart';
import '../../main.dart';
import '../credit_screen/credit_screen.dart';
import 'controller/report_controller.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());

    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'التقارير',
            style: K.boldBlackText,
          ),
          leading: SizedBox(),
        ),
        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         // Obx(() =>
             Padding(
               padding: const EdgeInsets.all(8.0),
               child:

               CustomDropDown(
               // dropdownValue: controller.dropdownValue.value ?? '',
               // isDropDown: true,
               // text: controller.dropdownValue.value.toString(),
               onChanged: (newValue) {
                 controller.onChaned(newValue);


               }, hint: 'اختيار نوع التقرير', listOfItems: [], onSaved: (String?v ) {
           controller.onChaned(v);
         },
           ),
             ),

              Obx( () =>
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           GestureDetector(
                             child: Container(
                             height: 60.h,
                             width: 150.w,

                             margin: EdgeInsets.only(
                                 left: 10.w,
                                 right: 10.w,
                                 bottom: 10.h,
                                 top: 10.h),
                             padding: EdgeInsets.all(2.sp),
                             decoration:BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               // border: Border.none,
                               color: K.lightMainColor
                               // color:Colors.green
                             ),
                             // child: ElevatedButton(
                             //   onPressed: () async {
                             //     final date = await controller.showCalenderFrom(
                             //         context: context);
                             //     if (date == null) return;
                             //     controller.newTime.value = date;
                             //     print(controller.dateTime.value);
                             //   },
                             //   style: ButtonStyle(
                             //     backgroundColor:
                             //     MaterialStateProperty.all<Color>(
                             //         K.lightMainColor ),
                             //   ),
                               child: controller.newTime.value == null
                                   ? Center(child: Text('من',style:K.blackText))
                                   : Center(
                                     child: Text(
                                 "${controller.newTime.value?.year}/${controller.newTime.value?.month}/${controller.newTime.value?.day}",
                                 style: TextStyle(color: K.blackColor,
                                   fontSize: 20.sp,
                                 ),
                                     ),
                                   ),
                             ),onTap: ()async{
                             final date = await controller.showCalenderFrom(
                                         context: context);
                                     if (date == null) return;
                                     controller.newTime.value = date;
                                     print(controller.dateTime.value);
                           },
                           ),
                           GestureDetector(
                             child: Container(
                               height: 60.h,
                               width: 150.w,
                               margin: EdgeInsets.only(
                                   left: 10.w,
                                   right: 10.w,
                                   bottom: 10.h,
                                   top: 10.h),
                               padding: EdgeInsets.all(2.sp),
                               // decoration: K.boxDecoration,
                               decoration:BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   // border: Border.none,
                                   color: K.lightMainColor
                                 // color:Colors.green
                               ),
                               // child: ElevatedButton(
                               //   onPressed: () async {
                               //     final date = await controller.showCalenderTo(
                               //         context: context);
                               //     if (date == null) return;
                               //     controller.newTimeTo.value = date;
                               //     print(controller.dateTimeTo.value);
                               //   },
                               //   style: ButtonStyle(
                               //     backgroundColor:
                               //     MaterialStateProperty.all<Color>(
                               //         K.lightMainColor),
                               //   ),
                                 child: controller.newTimeTo.value == null
                                     ? Center(child: Text('إلى',style:K.blackText))
                                     : Center(
                                       child: Text(
                                   "${controller.newTimeTo.value?.year}/${controller.newTimeTo.value?.month}/${controller.newTimeTo.value?.day}",
                                   style: TextStyle(color: K.blackColor),
                                 ),
                                     ),
                               ),
                             onTap: ()async{
    // () async {
        final date = await controller.showCalenderTo(
            context: context);
        if (date == null) return;
        controller.newTimeTo.value = date;
        print(controller.dateTimeTo.value);
      },
                             // },
                           ),
                           // ),
                         ],
                       )
                      ),

        GetBuilder<ReportController>(
          init: ReportController(),
          builder: (controller) =>   Center(
                child: Button(
                  color: K.semiDarkRed,
                  text: 'بحث'.tr,
                  size: MediaQuery.of(context).size.width / 1.5.w,
                  height: MediaQuery.of(context).size.width / 11.h,
                  isFramed: false,
                  fontSize: 20.sp,
                  onPressed: () async {
                    await controller.searchForTheReport(
                        status: controller.dropdownValue.value.toString()??'');
                   // print(controller.dropdownValue.value.toString());
                  },
                ),
                ),
              ),
              K.sizedboxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' \tمجموع المبيعات \t',
                    style: K.boldBlackSmallText,
                  ),
                  Spacer(),
                  Obx(
                    () => (controller.dataLoading.value ||
                            controller.model.total == null)
                        ? Text(
                            '  0.0  \$  ',
                            style: K.redTextStyle,
                          )
                        : Text(
                            ' ${controller.model.total} \$ ',
                            style: K.redTextStyle,
                          ),
                  ),
                ],
              ),
              K.sizedboxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' \tنسبة المنصة \t',
                    style: K.boldBlackSmallText,
                  ),
                  Spacer(),
                  // Text(
                  Obx(
                        () => (controller.dataLoading.value ||
                        controller.model.companyShare == null)
                        ? Text(
                      '  0.0  \$  ',
                      style: K.redTextStyle,
                    )
                        : Text(
                      ' ${controller.model.companyShare} \$ ',
                      style: K.redTextStyle,
                    ),
                  ),
                ],
              ),
              K.sizedboxH,
              K.sizedboxH,
              // GetBuilder<ReportController>(
              //   init: ReportController(),
              //       builder:(controller)=>
              Obx(
                () => controller.dataLoading.value
                    ? Center(
                        child: CupertinoActivityIndicator(
                          color: K.primaryColor,
                        ),
                      )
                    : BarChartSample2(
                        padding: 0,
                        reportModel: controller.model,
                        isStartSearch: controller.isStartSearch.value,
                      ),
              ),
              K.sizedboxH,
              K.sizedboxH,
              K.sizedboxH,
     Obx(()=>  controller.isStartSearch.value?controller.dataLoading.value
         ?   Center(
       child: CupertinoActivityIndicator(
         color: K.whiteColor,
       ),
     ): ListView.builder(
                itemCount:controller.model.grouped?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomPieCartCard(model:controller.model.grouped![index]);
                },
              ):SizedBox(),),
              K.sizedboxH,
              K.sizedboxH,
            ],
          ),
        ),
      ),

    );


  }
}

///the pie Chart
class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

// our pie chart widget
class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.child,
    Key? key,
  })  : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<PieChartData> data;

  // radius of chart
  final double radius;

  // width of stroke
  final double strokeWidth;

  // optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        // calc diameter
        dimension: radius * 2,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

// responsible for painting our chart
class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // remove padding from stroke
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;

  // this is the gap between strokes in percent
  static const _padding = 4;
  static const _paddingInRadians = _percentInRadians * _padding;

  // 0 radians is to the right, but since we want to start from the top
  // we'll use -90 degrees in radians
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // keep track of start angle for next stroke
    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + _paddingInRadians;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
