import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/style.dart';
import '../model/order_history_model.dart';
import '../screens/credit_screen/controller/credit_controller.dart';

class CustomOrderHistoryCards extends StatelessWidget {
  Items model;

    CustomOrderHistoryCards({Key? key,
    required this.model



  }) : super(key: key);

  Widget build(BuildContext context) {
    return  GetBuilder<CreditController>(
    init: CreditController(),
        builder: (controller)=>


            Padding(
      padding:   EdgeInsets.all(8.0.sp),
      child: Column(
        children: [
          K.sizedboxH,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text(model.dayName.toString().isNotEmpty?model.dayName.toString():'',style: K.boldBlackSmallText,),
              // Text( 'الجمعه' ,style: K.boldBlackSmallText,),
              // Text(model.date.toString().isNotEmpty?model.date.toString():'',style: K.boldBlackSmallText,),
              Text('${model.date.toString()??''}',style: K.boldBlackSmall,),
            ],
          ),
          K.sizedboxH,




        Container(
            decoration: K.boxDecorationLightGrey,
            padding: EdgeInsets.all(10.sp),
        child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(  ' \tمبلغ المبيعات : \t',style: K.blackText,),
            Text(  ' \tحصة المنصة  : \t',style: K.blackText,),
            Text(  ' \tنسبة الشركة من التاجر:',style: K.blackText,),
            Text(  ' \tصافي الربح : \t',style: K.blackText,),
          ],
        ),
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children:   [
              Text(  ' \t ${model.total??''}',style: K.redTextStyle, ),
              Text(  ' \t ${model.companyShare ??''}',style: K.redTextStyle, ),
              Text(  ' \t ${model.companyPercentage ??''}',style: K.redTextStyle, ),
              Text(  ' \t ${model.earning ??''}',style: K.redTextStyle, ),
            ],
            // ],
          ),
        ]
      ),
      ),
        // ),


//           Container(
//             decoration: K.boxDecorationLightGrey,
//             padding: EdgeInsets.all(10),
//             child: const
//
//
// ListTile(
//               leading: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(  ' \مبلغ المبيعات : \t', ),
//                     Text(  ' \tحصة المنصة  : \t', ),
//                     Text(  ' \tنسبة الشركة من التاجر: \t', ),
//                      Text(  ' \صافي الربح : \t', ),
//                   ],
//                 ),
//               ),
//               // title:
//               trailing:Column(
//
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//
//                 children:   [
//                   // Text(  ' \t ${model.total??''}',style: K.redTextStyle, ),
//                   // Text(  ' \t ${model.companyShare ??''}',style: K.redTextStyle, ),
//                 ],
//                 // ],
//               ),
//               // trailing:Container(
//               //   width: 70.w,
//               //   height: 200,
//               //   child: PieChart(
//               //     data: [
//               //       PieChartData(K.primaryColor, 75),
//               //       PieChartData(Colors.grey, 25),
//               //     ],
//               //     radius: 80,
//               //     strokeWidth: 8,
//               //     child:   Text(
//               //       '75%',
//               //       style: TextStyle(
//               //           fontSize: 18.sp,
//               //           fontWeight: FontWeight.bold,
//               //           color: K.primaryColor
//               //       ),
//               //     ),
//               //   ),
//               // )
//             ),
//           ),
        ],

      ),
      ),
    );
  }
  }

