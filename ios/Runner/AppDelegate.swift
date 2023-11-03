// import UIKit
// import Flutter
// import GoogleMaps
// import FirebaseCore
// import FirebaseMessaging
// import FirebaseAuth
//
// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//     override func application(
//         _ application: UIApplication,
//         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//         FirebaseApp.configure()
//         GMSServices.provideAPIKey("AIzaSyC-dKwU-zj--uTJU7VBuilNb5czqZ60Ddw")
//         GeneratedPluginRegistrant.register(with: self)
//         return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//     }
//
//     override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//         let firebaseAuth = Auth.auth()
//         firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
//     }
//
//     override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//         let firebaseAuth = Auth.auth()
//         if (firebaseAuth.canHandleNotification(userInfo)) {
//             print(userInfo)
//             return
//         }
//     }
// }


import UIKit
import Flutter
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
FirebaseApp.configure()
if #available(iOS 10.0, *) {
UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
}
application.registerForRemoteNotifications()
GeneratedPluginRegistrant.register(with: self)
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}

override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
Messaging.messaging().apnsToken = deviceToken
print("Token: (deviceToken)")
Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
super.application(application,didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
}

}