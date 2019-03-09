import UIKit
import Flutter

//import "unionpay/UPPaymentControl.h"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    fileprivate let scheme = "uppsmart"
    
    /**
     * 00 正式环境
     * 01 测试环境
     */
    fileprivate let mode = "01"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let controller:FlutterViewController = window.rootViewController as! FlutterViewController
    let userdefault = FlutterMethodChannel(name: "SmarkPark/unionpay", binaryMessenger: controller)
    userdefault.setMethodCallHandler { (call, result) in
        if "pay" == call.method {
            let param = call.arguments as! Dictionary<String, String>
            let amount = param["amount"]!
            let tn = param["tn"]!
            print("pay amout == " + amount + " tn :== " + tn)
            UPPaymentControl.default().startPay(tn, fromScheme: self.scheme, mode: self.mode, viewController: controller)
            result(true)
        }
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        UPPaymentControl.default().handlePaymentResult(url) { (code, data) in
            
            if code == "success"{
                print("支付成功")
                //判断签名数据是否存在
                if data == nil{
                    //没有签名数据，建议商户app后台查询交易结果
                    return
                }
                
                print("交易成功")
//                let signData = try! JSONSerialization.data(withJSONObject: data ?? "", options: JSONSerialization.WritingOptions(rawValue: UInt(0)))
//                let sign = String(data: signData, encoding: .utf8)
                
//                //跟后台验证签名"
//                if self.verify(sign: sign!) {
//                    //支付成功且验证签名成功，展示支付成功提示
//                    
//                }else{
//                    //验证签名失败，交易结果数据被篡改，商户app后台交易结果查询
//                    
//                }
                
            }else if code == "fail"{
                print("交易失败")
            }else if code == "cancel"{
                print("用户取消")
            }
        }
        
        return true
    }

    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
