import Combine
//import AuthenticationServices

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    // TextFieldに入力した文字が半角英数かどうか判別する変数
    @Published var isValidId: Bool = false
    @Published var isValidPassword: Bool = false
    
    @Published var isLoginButtonTapped: Bool = false
    
//    @Published var appleAuthResults: Result<ASAuthorization, Error>?
    
    private var disposables = [AnyCancellable]()
    
    init() {
        $id
            .sink(receiveValue: {
                self.isValidId = $0.isAlphanumeric && !$0.isEmpty ? true : false
            })
            .store(in: &disposables)

        $password
            .sink(receiveValue: {
                self.isValidPassword = $0.isAlphanumeric && !$0.isEmpty ? true : false
            })
            .store(in: &disposables)

        $isLoginButtonTapped
            .sink(receiveValue: { isTapped in
                if isTapped == true {
                    //ログイン後の画面遷移？
                    
                }
            })
            .store(in: &disposables)
        
//        $appleAuthResults
//            .sink(receiveValue: { results in
//                switch results {
//                case .success(let authResults):
//                    switch authResults.credential {
//                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
//                        print("userIdentifier:\(appleIDCredential.user)")
//                        print("fullName:\(String(describing: appleIDCredential.fullName))")
//                        print("email:\(String(describing: appleIDCredential.email))")
//                        print("authorizationCode:\(String(describing: appleIDCredential.authorizationCode))")
//
//                        print("ここでログイン処理を呼び出す")
//
//                    default:
//                        break
//                    }
//
//                case .failure(let error):
//                    print(error.localizedDescription)
//
//                default:
//                    break
//                }
//            })
//            .store(in: &disposables)
    }
}

extension String {
    // 半角英数かどうか判別
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
