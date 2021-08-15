import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let methodChannelName = "package.name/masaki"
    private let methodTest = "test"
    
    private var flutterViewController: FlutterViewController {
        return self.window.rootViewController as! FlutterViewController
    }
    
  override func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let methodChannel = FlutterMethodChannel(name: self.methodChannelName, binaryMessenger: self.flutterViewController.binaryMessenger)
    methodChannel.setMethodCallHandler { [weak self] methodCall, result in
        if let wself = self,
           methodCall.method.contains(wself.methodTest) {
            let parameters = methodCall.arguments as? String
            wself.launchiOSScreen(parameters)
        }
    }
    
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func launchiOSScreen(_ parameters: String?) {
        print(parameters ?? "")
    }
}
