import UIKit
import LineSDK


class AppDelegate: UIResponder, UIApplicationDelegate {
    //LINEの認証について
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // LINE SDKを設定
//        LoginManager.shared.setup(channelID: "{2001360989}", universalLinkURL: nil)
//
//        return true
//    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
