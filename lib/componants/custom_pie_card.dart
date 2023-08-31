import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tajer/model/reprt_model.dart';

import '../constants/style.dart';
import '../screens/reports_screen/reports_screen.dart';

class CustomPieCartCard extends StatelessWidget {
  GroupedData model;
    CustomPieCartCard({
    super.key,
    this.option, required this. model,
  });
final dynamic option;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.dayName.toString().isNotEmpty?model.dayName.toString():'',style: K.boldBlackSmallText,),
              // Text(option==null?'الجمعه':option.toString(),style: K.boldBlackSmallText,),
              Text(model.date.toString().isNotEmpty?model.date.toString():'',style: K.boldBlackSmallText,),
              // Text('7/3/2023',style: K.boldBlackSmallText,),
            ],
          ),
          K.sizedboxH,
          Container(
            decoration: K.boxDecorationLightGrey,
            padding: EdgeInsets.all(10),
            child: ListTile(

                leading: const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  ' \tمجموع المبيعات : \t', ),
                      Text(  ' \tحصة الشركة : \t', ),
                    ],
                  ),
                ),
                // title:
              trailing:Column(

                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.end,

                children:   [
                    Text(  ' \t ${model.total??''}',style: K.redTextStyle, ),
                    Text(  ' \t ${model.companyShare ??''}',style: K.redTextStyle, ),
                  ],
                ),
                // trailing:Container(
                //   width: 70.w,
                //   height: 200,
                //   child: PieChart(
                //     data: [
                //       PieChartData(K.primaryColor, 75),
                //       PieChartData(Colors.grey, 25),
                //     ],
                //     radius: 80,
                //     strokeWidth: 8,
                //     child:   Text(
                //       '75%',
                //       style: TextStyle(
                //           fontSize: 18.sp,
                //           fontWeight: FontWeight.bold,
                //           color: K.primaryColor
                //       ),
                //     ),
                //   ),
                // )
            ),
          ),
        ],

      ),
    );
  }
}
