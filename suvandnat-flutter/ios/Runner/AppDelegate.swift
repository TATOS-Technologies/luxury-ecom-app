import UIKit
import Flutter
import Adyen

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    class func shared() -> AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate)!
    }

    static let clientKey = "test_7E6J4E435VBR5OCXOEXTCIX4Y4IA2YXB"
    static let demoServerAPIKey = "AQEshmfxLYvPaxBHw0m/n3Q5qf3VZYJCIJxOWUNMw0BR8QvSqBPe+y8KsGVLyy4QwV1bDb7kfNy1WIxIIkxgBw==-8Riqu+2BZIi152bjjlvXzR5wjrrbXnLFzNO2DMLJf/8=-59;U3q~fuENXT.2F"
    static let merchantAccount = "MioModaFzeECOM"

    var apiContext: APIContext?

    var flutterResult: FlutterResult?

    private var adyenManager: AdyenManager?


  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let helperChannel = FlutterMethodChannel(name: "flutter.native/helper",
                                               binaryMessenger: controller.binaryMessenger)

      helperChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          guard call.method == "helloFromNativeCode" else {
              result(FlutterMethodNotImplemented)
              return
          }
          self.flutterResult = result
          var data = call.arguments as! Dictionary<String,Any>
          self.openPaymentpage(result: result, data: data)
      })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    private func openPaymentpage(result: @escaping FlutterResult, data: Dictionary<String,Any>) {
         print("\n PAYMENT OPENING!!!!!!!!!!!")
         print("\n \(String(describing: result))")

        do {
            // Set the client key and environment in an instance of APIContext.
            self.apiContext = try APIContext(environment: Environment.test, clientKey: AppDelegate.clientKey) // Set the environment to a live one when going live.
        } catch {
            print(error)
        }
        self.adyenManager = AdyenManager(paymentData: data)
      }
}
