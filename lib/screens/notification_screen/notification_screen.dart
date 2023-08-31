import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/custom_notification_card.dart';
import '../../constants/style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final co
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'الاشعارات',
          style: K.boldBlackText,
        ),
        leading: SizedBox(),


        actions: [
          IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_forward_ios_outlined,size: 20,))
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding:   EdgeInsets.all(10.0),
          child:   SingleChildScrollView(
            child: Column(
                children: [
              
              ListView.builder(
                itemCount: 5,
                  shrinkWrap: true,
                  
                  itemBuilder: (context,index){
              
               return Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   K.sizedboxH,
                   // K.sizedboxH,
                   CustomNotificationCard(),
                   K.sizedboxH,
                   Text('منذ دقيقه',style: TextStyle(color: K.mainColor),)
                 ],
               );
              
              })
                ],
              ),
          ),
          ),

      ),
    );
  }
}
