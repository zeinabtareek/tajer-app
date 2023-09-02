import UIKit
import Flutter
import GoogleMaps
import FirebaseCore
import FirebaseMessaging
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
  //     GMSServices.provideAPIKey("AIzaSyC-dKwU-zj--uTJU7VBuilNb5czqZ60Ddw")
      GMSServices.provideAPIKey("AIzaSyC-dKwU-zj--uTJU7VBuilNb5czqZ60Ddw")
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
             let firebaseAuth = Auth.auth()
             firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
   }
   override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
             let firebaseAuth = Auth.auth()
             if (firebaseAuth.canHandleNotification(userInfo)){
                 print(userInfo)
                 return
             }
  }