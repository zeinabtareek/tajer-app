import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tajer/model/reprt_model.dart';

import '../../componants/custom_pie_card.dart';
import '../../constants/style.dart';
import 'controller/credit_controller.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CreditController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text('رصيدك',style: K.boldBlackText,),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: SizedBox(),


          actions: [
            IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_forward_ios_outlined,size: 20,))
          ],
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.search),
          //   ),
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.more_vert),
          //   ),
          // ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Row(
              children: [
                ...List.generate(controller.optionsList.length, (index) =>
                Obx(()=>Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = index;

                    },
                    child: Container(
                      height: 40,
                      color: Colors.white,
                      child: Center(child: Text(controller.optionsList[index],
                        style: controller.selectedIndex.value == index ? K.redTextStyle : K.boldBlackSmallText,
                ),
                ),
                  ),
                ),
                ),
                ),
                ),

              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:
        Obx(()=>
        // optionContents[controller.selectedIndex.value])
       CreditBody(context,option:controller.optionsList[controller.selectedIndex.value])
      ),
      ),
    );
  }
}

Widget CreditBody( context ,{option}){
  return    Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      children: [
        K.sizedboxH,
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/7,
          color: K.darkRed,
          child: Column(
            children: [
              K.sizedboxH,
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '   رصيد التاجر  ',
                      style: TextStyle(color: K.whiteColor, fontSize: 20.sp,fontWeight: FontWeight.bold),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 3.3.w,
                        height: MediaQuery.of(context).size.height / 30.w,
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
                            '277.900  ',
                            style: TextStyle(color: K.whiteColor, fontSize: 20.sp,fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              K.sizedboxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'نسبة المنصة',
                    style: TextStyle(color: K.whiteColor, fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '(10 %) ',
                    style: TextStyle(color: K.whiteColor, fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ), Text(
                    '277.900  ',
                    style: TextStyle(color: K.whiteColor, fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context  ,index){
              return    CustomPieCartCard(option:option, model: GroupedData(),);
            })
      ],
    ),
  );
}
