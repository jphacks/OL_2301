import SwiftUI
import AuthenticationServices

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel
    //画面遷移の時に使用するbool値
    @State private var isPresented: Bool = false
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 15){
            ZStack{
                Image("homebackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
//                Text("アカウントIDでログイン")
//                    .bold()
//                    .foregroundColor(.black)
//                    .padding(EdgeInsets(top: 300, leading: 0, bottom: 0, trailing: 0))
                
                // 入力した文字をLoginViewModelの変数idに通知
                TextField("ニックネーム（半角英数）", text: $viewModel.id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                    .padding(EdgeInsets(top: 400, leading: 0, bottom: 0, trailing: 0))
                
                // 入力した文字をLoginViewModelの変数passwordに通知
                TextField("Age(半角英数)", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                    .padding(EdgeInsets(top: 485, leading: 0, bottom: 0, trailing: 0))
                
                Button(action: {
                    // ボタンが選択されたことをLoginViewModelの変数isLoginButtonTappedに通知
                    viewModel.isLoginButtonTapped = true
                }) {
                    //                Text("ログイン")
                    //ここにログイン処理を追加する
                    Button(action: {
                        isPresented = true //trueにしないと画面遷移されない
                    }) {
                        //                    Text("NextViewへ")
                        Text("はじめる")
                    }
                    .fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                        HomeView()
                    }
                }
                
                .frame(width: 200, height: 45)
                .foregroundColor(Color.white)
                // ボタンの有効/無効状態に合わせて背景の色を変更
                .background(viewModel.isValidId && viewModel.isValidPassword ? Color.yellow : Color.gray)
                .cornerRadius(10, antialiased: true)
                // IDとパスワードがどちらも半角英数で入力されていればボタンを有効にする
                .disabled(!viewModel.isValidId || !viewModel.isValidPassword)
                .padding(EdgeInsets(top: 600, leading: 0, bottom: 0, trailing: 0))
                
                
                //            Image("homebackground")
                //                .resizable()
                //                .aspectRatio(contentMode: .fill)
                //                .edgesIgnoringSafeArea(.all)
                //            .background(
                //                Image("homebackground")
                //                .resizable()
                //                .aspectRatio(contentMode: .fill)
                //                .edgesIgnoringSafeArea(.all))
                //
                
                //LINEログイン
                //            Text("LINEログイン")
                //                .bold()
                //
                //            LineLoginButton()
                //                .frame(width: 200, height: 45)
                //                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                //Apple ログイン
                //            Text("Sign In with Apple")
                //                .bold()
                //
                //            SignInWithAppleButton(.signIn) { request in
                //                request.requestedScopes = [.fullName, .email]
                //            } onCompletion: { authResults in
                //                viewModel.appleAuthResults = authResults
                //            }
                //            .signInWithAppleButtonStyle(.black)
                //            .frame(width: 200, height: 45)
            }
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
