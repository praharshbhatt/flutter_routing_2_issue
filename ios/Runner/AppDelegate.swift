import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let bundleId = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
    print(bundleId)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
