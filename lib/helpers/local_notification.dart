// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   static final NotificationService _notificationService =
//       NotificationService._internal();
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   NotificationService._internal();
//
//   static const channelId = "1";
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//     static const AndroidNotificationDetails _androidNotificationDetails =
//       AndroidNotificationDetails(
//     channelId,
//     "New Order",
//     channelDescription:
//         "You received a new Orfder ",
//     playSound: true,
//     priority: Priority.high,
//     sound: UriAndroidNotificationSound("assets/sounds/notification.mp3"),
//     importance: Importance.max,
//   );
//   static const IOSNotificationDetails _iosInitializationSetting=IOSNotificationDetails(
//
//     );
//    final NotificationDetails notificationDetails = const NotificationDetails(
//     android: _androidNotificationDetails,
//     iOS: _iosInitializationSetting
//   );
//
//  init() async {
//     await requestIOSPermissions();
//       AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings("@mipmap/ic_launcher");
//       IOSInitializationSettings iosInitializationSettings =
//       const IOSInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//       );
//       InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: androidInitializationSettings,
//         iOS:iosInitializationSettings,
//     );
//
//
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//    ///new code
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage ?message) {
//       if (message != null) {
//         print(message);
//
//
//       }
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             notificationDetails
//         );
//         FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//           print('A new onMessageOpenedApp event was published!');
//           print(message);
//         });
//       }
//     });
//   }
//
//   Future<void> requestIOSPermissions() async {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   Future<void> showNotification(
//     int id,
//     String title,
//     String body,
//     String payload,
//   ) async {
//     await flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
//
// }
