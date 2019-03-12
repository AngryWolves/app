import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    var flutterResult: FlutterResult! = nil
    
    var secondController: ViewController! = nil
    
    
   override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     GeneratedPluginRegistrant.register(with: self)

     let controller:FlutterViewController = self.window.rootViewController as! FlutterViewController

     let userdefault = FlutterMethodChannel(name: "SmarkPark/unionpay", binaryMessenger: controller)
     userdefault.setMethodCallHandler { (call, result) in
        if "pay" == call.method {
            self.flutterResult = result
            let tn = call.arguments as! String
            print("pay tn :== " + tn)
            self.secondController = ViewController(tn: tn)
            let rootVC = UIApplication.shared.keyWindow?.rootViewController
            rootVC?.show(self.secondController, sender: nil)
            
        }
    }

    return true
    }
    
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print("application 2222222 open url")
        UPPaymentControl.default().handlePaymentResult(url) { (code, data) in
            
            if code == "success"{
                print("支付成功")
                //判断签名数据是否存在
                if data == nil{
                    //没有签名数据，建议商户app后台查询交易结果
                    self.flutterResult(nil)
                    return
                }
                
                print("交易成功")
                
                let signData = try! JSONSerialization.data(withJSONObject: data ?? "", options: JSONSerialization.WritingOptions(rawValue: UInt(0)))
                let sign = String(data: signData, encoding: .utf8)
                self.flutterResult(sign)
                //                userdefault()
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
                self.flutterResult("支付失败!")
            }else if code == "cancel"{
                print("用户取消")
                self.flutterResult("你已取消了本次订单的支付！")
            }
            self.secondController?.dismiss(animated: true, completion: nil)
        }
        return true
    }
}
