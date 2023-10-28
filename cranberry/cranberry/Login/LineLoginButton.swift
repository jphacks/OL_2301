////LINEのログインについて
//import SwiftUI
//import LineSDK
//
//struct LineLoginButton: UIViewRepresentable {
//    class Coordinator: NSObject, LoginButtonDelegate {
//        var parent: LineLoginButton
//
//        init(_ parent: LineLoginButton) {
//            self.parent = parent
//        }
//
//        func loginButton(_ button: LoginButton, didSucceedLogin loginResult: LoginResult) {
//            print("LINE認証成功")
//            print("アクセストークン:\(loginResult.accessToken.value)")
//            print("ここでログイン処理を呼び出す")
//        }
//
//        func loginButton(_ button: LoginButton, didFailLogin error: LineSDKError) {
//            print("LINE認証エラー: \(error)")
//        }
//
//        func loginButtonDidStartLogin(_ button: LoginButton) {
//            print("LINE認証開始")
//        }
//    }
//
//    // Coordinatorを作成するメソッド
//    // CoordinatorはUIViewRepresentableに準拠した構造体LineLoginButtonの状況（Context）の一部を
//    // 他のSwiftUIのインターフェースに伝達できるようにする
//    // そのため、作成したCoordinatorを使用して、デリゲート、データソース、ユーザーイベントへの応答などを実装できる
//    // makeCoordinatorで生成したCoordinatorのインスタンスにはupdateUIViewの引数contextからアクセスできる
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    // Viewを初期化
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//        return view
//    }
//
//    // Viewの状態を更新
//    func updateUIView(_ view: UIView, context: Context) {
//        let loginButton = LoginButton()
//        // makeCoordinatorで生成したCoordinatorクラスのインスタンスを指定
//        loginButton.delegate = context.coordinator
//
//        // 認証時にユーザーへプロフィール情報の取得について許可をとる
//        loginButton.permissions = [.profile]
//        // nilを指定すると、現在のViewController階層の最上位のViewControllerが使用される
//        loginButton.presentingViewController = nil
//
//        // makeUIViewで生成したViewにLINE SDKで用意されたLoginButtonを追加
//        view.addSubview(loginButton)
//        // ログインボタンのレイアウト設定
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
//}
//
//struct LineLoginButton_Previews: PreviewProvider {
//    static var previews: some View {
//        LineLoginButton()
//    }
//}
