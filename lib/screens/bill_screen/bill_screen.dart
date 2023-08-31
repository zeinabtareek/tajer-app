import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tajer/model/order_model.dart';
import 'package:tajer/screens/bill_screen/controller/bill_controller.dart';

import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
import '../../constants/style.dart';
import '../../utils/overlay_helper.dart';
import '../home_screen/home_screen.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({Key? key, this.order}) : super(key: key);
  final Orders? order;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BillController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'الفاتورة',
          style: K.boldBlackText,
        ),
        leading: SizedBox(),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ))
        ],
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '12548795421',
                      style: K.boldBlackSmallText,
                    ),
                    K.sizedboxW,
                    Text(
                      ' 7/3/2023',
                      style: K.boldBlackSmallText,
                    ),
                  ],
                ),
                K.sizedboxH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'اسم العميل',
                      style: K.boldBlackSmallText,
                    ),
                    K.sizedboxW,
                    Text(
                      ' احمد سيد',
                      style: K.boldBlackSmallText,
                    ),
                  ],
                ),
                Image.asset('assets/images/map.png'),
                K.sizedboxH,
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: CustomAddressTextField(
                          width: MediaQuery.of(context).size.width / 1.3.w,
                          hintText: " ".tr,
                          labelText: "ابحث ".tr,
                          onChanged: (String v) {
                            controller.searchController.value = v;
                          },
                        ),
                      ),
                      K.sizedboxH,
                      Row(
                        children: [
                          Padding(
                            child: Text(
                              'بيانات الطلب',
                              style: K.boldBlackSmallText,
                            ),
                            padding:
                                const EdgeInsets.only(right: 7.0, bottom: 7),
                          ),
                        ],
                      ),
                      for (int i = 0; i <= 2; i++) CustomBillCard(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' \t\tالمجموع\t\t',
                      style: K.boldBlackSmallText,
                    ),
                    // K.sizedboxW,
                    Text(
                      ' \t\$394\t\t',
                      style: K.boldBlackSmallText,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                        color: K.semiDarkRed,
                        // color: Color(0xfffcf2f4),
                        text: 'قبول الطلب'.tr,
                        size: MediaQuery.of(context).size.width / 2.w,
                        height: MediaQuery.of(context).size.width / 9.h,
                        isFramed: false,
                        fontSize: 22.sp,
                        onPressed: () async {

                        // await  controller.acceptOrder(id: order?.id);
                        }),
                    K.sizedboxW,
                    Button(
                        color: Color(0xfffcf2f4),
                        text: 'الغاء الطلب'.tr,
                        size: MediaQuery.of(context).size.width / 3.w,
                        height: MediaQuery.of(context).size.width / 9.h,
                        isFramed: true,
                        fontSize: 22.sp,
                        onPressed: () async {}),
                  ],
                ),
                K.sizedboxH,
              ],
            ),
          )),
    );
  }
}

class CustomBillCard extends StatelessWidget {
  const CustomBillCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: K.lightMainColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/test.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'سينابون',
                style: K.boldBlackSmallText,
              ),
              K.sizedboxH,
              RichText(
                text: TextSpan(
                  text: ' عرض 2  ',
                  style: K.redTextStyle,
                  // children:<InlineSpan> [
                  children: [
                    TextSpan(
                      // text: 'عرض 2 ',
                      text: '\$100 ',
                      style: K.boldBlackSmallText,
                      // style:K.redTextStyle,
                    ),
                    // K.sizedboxW,
                    WidgetSpan(
                      child: CustomSlopText(
                        text: '  200 ',
                        color: K.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              K.sizedboxH,
              Text(
                'سينابون +سينابون',
              ),
            ],
          ),
          K.sizedboxW,
          Text(
            '   2  ',
            style: K.boldBlackSmallText,
          ),
        ],
      ),
    );
  }
}
