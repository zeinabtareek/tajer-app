// import 'dart:async';
// import 'dart:io';
//
// import 'package:donation/model/notification_model.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:flutter/material.dart';
// import '../main.dart';
//
// class NotificationHandler extends GetxController{
//
//   late int totalNotifications;
//   late final FirebaseMessaging messaging;
//   NotificationModel notificationInfo=NotificationModel();
//   StreamSubscription ?iosSubscription;
//
//
// @override
//   onInit() async {
//   super.onInit();
//   requestAndRegisterNotification();
//   totalNotifications=0;
//       if (Platform.isIOS) {
//          // save the token  OR subscribe to a topic here
//
//       // _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }
//   FirebaseMessaging.onMessage.listen(
//         (RemoteMessage message) async {
//       print('onMessage: $message');
//       // _setMessage(message.data);
//       showSimpleNotification(
//         Text(message.data.toString()),
//         leading: NotificationBadge(totalNotifications:totalNotifications),
//         subtitle: Text(notificationInfo.message.toString()),
//         background: Colors.green.shade700,
//         duration:Duration(seconds: 2),
//
//       );
//     },
//   );
//
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print("onMessageOpenedApp: $message");
//   });
//
//
// }
//
//   requestAndRegisterNotification()async{
//     messaging=FirebaseMessaging.instance;
//     FirebaseMessaging.onBackgroundMessage(messageHandler);
//
//     //3 -on Ios ,this helps to take the user permission
//     NotificationSettings settings=await messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );
//
//     if(settings.authorizationStatus ==AuthorizationStatus.authorized){
//
//       print('user granted permission');
//       final token =await  messaging.getToken();
//       print('the token is  $token');
//
//       //for handling the received notification
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         //parse the message recieved
//         NotificationModel notification=NotificationModel(
//           title: message.notification?.title,
//           message: message.notification?.body,
//         );
//         notificationInfo=notification;
//         totalNotifications++;
//         if(notificationInfo!=null ){
//           showSimpleNotification(
//             Text(notificationInfo.title.toString()),
//             leading: NotificationBadge(totalNotifications:totalNotifications),
//             subtitle: Text(notificationInfo.message.toString()),
//             background: Colors.green.shade700,
//             duration:Duration(seconds: 2),
//
//           );
//         }
//
//       });
//
//     }
//   }
// }
//
// class NotificationBadge  extends StatelessWidget{
//   final int totalNotifications;
//   const NotificationBadge({Key? key,required this.totalNotifications}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Column(
//         children: [
//           Text(totalNotifications.toString()),
//         ],
//       ),
//     );
//   }
// }