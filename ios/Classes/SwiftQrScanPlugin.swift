import Flutter
import UIKit

public class SwiftQrScanPlugin: NSObject, FlutterPlugin {
    var registrar: FlutterPluginRegistrar!

    var result: FlutterResult?
    var hostViewController: UIViewController!

     func resizeImage(image: UIImage, newWidth: CGFloat ,newHeight: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        image.draw(in: CGRect(x: 0 , y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
     }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "qrscan", binaryMessenger: registrar.messenger())
        let instance = SwiftQrScanPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        if let delegate = UIApplication.shared.delegate , let window = delegate.window, let root = window?.rootViewController {
            instance.hostViewController = root
            instance.registrar = registrar
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "scan":
            self.result = result
            let scanController = qrscannerController()
            scanController.delegate = self
            let navigationController = UINavigationController(rootViewController: scanController)
            scanController.modalPresentationStyle = .fullScreen
            navigationController.modalPresentationStyle = .fullScreen
            if let arguDictinary = call.arguments as? NSDictionary {
               scanController.argumentDictionary = arguDictinary
            }
    
            if hostViewController != nil {
                let backIconKey = registrar.lookupKey(forAsset: "assets/back.png", fromPackage: "qrscan")
                if let backIconPath = Bundle.main.path(forResource: backIconKey, ofType: nil) {
                    scanController.backImage = resizeImage(image:UIImage(imageLiteralResourceName: backIconPath),newWidth:22,newHeight:22)
                 
                }
                // let flashlightKey = registrar.lookupKey(forAsset: "assets/flashlight.png", fromPackage: "qrscan")
                // if let flashlightPath = Bundle.main.path(forResource: flashlightKey, ofType: nil) {
                //     scanController.flashlightImage = UIImage(imageLiteralResourceName: flashlightPath)
                // }
                hostViewController.present(navigationController, animated: true, completion: nil)
            }
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }
}

extension SwiftQrScanPlugin: qrscannerDelegate {
    func didScanBarcodeWithResult(code: String) {
        if let channelResult = result {
            channelResult(code as NSString)
        }
    }
    
    func didFailWithErrorCode(code: String) {
        if let channelResult = result {
            channelResult(code as NSString)
        }
    }
}
