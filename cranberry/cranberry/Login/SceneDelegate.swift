import UIKit
import SwiftUI
import LineSDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 起動後の画面をログイン画面に設定
        let viewModel = LoginViewModel()
        let loginView = LoginView(viewModel: viewModel)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: loginView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    // URLでアプリが開かれた場合に実行される
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        _ = LoginManager.shared.application(.shared, open: URLContexts.first?.url)
    }
}
