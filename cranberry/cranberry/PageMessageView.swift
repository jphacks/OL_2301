
import SwiftUI
import OpenAIKit

// チャット表示用のメインビュー
struct PageMessageView: View {
    //会話終了を押したかのフラグ ここ追加
    @State private var ButtonFlag = false
    // 現在のチャットが完了しているかどうかを示す変数
    @State private var isCompleting: Bool = false
    
    // ユーザーが入力するテキストを保存する変数
    @State private var text: String = ""
    
    //102821:41追加 終わりのメッセージ
    @State private var mess: String = ""
    
    // チャットメッセージの配列
    @State private var chat: [ChatMessage] = [
        ChatMessage(role: .system, content: "あなたはユーザーの質問や会話に友達のように回答するほめちゃんという人物です。とてもフレンドリーに会話を行います。ユーザーが気分を述べた場合、原因を聞いた後、カウンセリングしてください。ユーザーが「ほめて」と入力した場合、ユーザーの自己肯定感が上がるよう、たくさん褒めてください。「まとめ」と言われたら会話内容の要約を表示してください。"),
        ChatMessage(role: .assistant, content:"こんにちは！今日の気分はどう？")
    ]

    
    // チャット画面のビューレイアウト
    var body: some View {
        VStack {
            // スクロール可能なメッセージリストの表示
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(chat.indices, id: \.self) { index in
                        if index>0{
                            MessageView(message: chat[index])
                        }
                    }
                }
            }
            .padding(.top)

            // 画面をタップしたときにキーボードを閉じる
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            // テキスト入力フィールドと送信ボタンの表示
            HStack {
                // テキスト入力フィールド
                TextField("メッセージを入力", text: $text)
                    .disabled(isCompleting) // チャットが完了するまで入力を無効化
                    .font(.system(size: 15))
                    .foregroundColor(Color.black)// フォントサイズを調整
                    .padding(8)
                    .padding(.horizontal, 10)
                    .background(Color.white) // 入力フィールドの背景色を白に設定
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1.5)

                    )
                
                // 送信ボタン
                Button(action: {
                    isCompleting = true
                    // ユーザーのメッセージをチャットに追加
                    chat.append(ChatMessage(role: .user, content: text))
                    text = "" // テキストフィールドをクリア
                    
                    Task {
                        do {
                            // OpenAIの設定
                            let config = Configuration(
                                organizationId:"org-kdBIJgyHjqd4vNMhp7rMACUw",
                                apiKey:"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"
                            )
                            let openAI = OpenAI(config)
                            let chatParameters = ChatParameters(model: "gpt-3.5-turbo", messages: chat)

                            // チャットの生成
                            let chatCompletion = try await openAI.generateChatCompletion(
                                parameters: chatParameters
                            )
                            
                            isCompleting = false
                            // AIのレスポンスをチャットに追加
                            chat.append(ChatMessage(role: .assistant, content: chatCompletion.choices[0].message.content))
                        } catch {
                            print("ERROR DETAILS - \(error)")
                        }
                    }
                }) {
                    // 送信ボタンのデザイン
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(self.text == "" ? Color(#colorLiteral(red: 0.75, green: 0.95, blue: 0.8, alpha: 1)) : Color(#colorLiteral(red: 0.2078431373, green: 0.7647058824, blue: 0.3450980392, alpha: 1)))
////                    //会話終了のボタンを作成
//                    Button(action: {
//                        //21:47追加
//                        isCompleting = true
//                        mess = "今日はここまで！"
//                        chat.append(ChatMessage(role: .user, content: mess))
//                        print("ログイン押した")//追加
//                        Task {
//                            do {
//                                // OpenAIの設定
//                                let config = Configuration(
//                                    organizationId:"org-kdBIJgyHjqd4vNMhp7rMACUw",
//                                    apiKey:"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"
//                                )
//                                let openAI = OpenAI(config)
//                                let chatParameters = ChatParameters(model: "gpt-3.5-turbo", messages: chat)
//
//                                // チャットの生成
//                                let chatCompletion = try await openAI.generateChatCompletion(
//                                    parameters: chatParameters
//                                )
//
//                                isCompleting = false
//                                // AIのレスポンスをチャットに追加
//                                chat.append(ChatMessage(role: .assistant, content: chatCompletion.choices[0].message.content))
//                            } catch {
//                                print("ERROR DETAILS - \(error)")
//                            }
//                        }
//                        self.ButtonFlag = true
//                    }) {
//                        Text("まとめ")
//                    }
//                    .padding()
//                    .accentColor(Color.white)
//                    .background(Color.green)
//                    .cornerRadius(50)
////                    //ここまで追加 21:47
                }
//                 テキストが空またはチャットが完了していない場合はボタンを無効化
                .disabled(self.text == "" || isCompleting)
////                ここを変更した1028.19.26ボタンの条件追加
//                .disabled(self.text == "" || isCompleting || ButtonFlag)
            }
            .padding(.horizontal)
            .padding(.bottom, 8) // 下部のパディングを調整
        }
    }
}

// メッセージのビュー
struct MessageView: View {
    var message: ChatMessage
    
    var body: some View {
        HStack {
            if message.role.rawValue == "user" {
                Spacer()
            } else {
                // ユーザーでない場合はアバターを表示
                AvatarView(imageName: "avatar")
                    .padding(.trailing, 8)
            }
            VStack(alignment: .leading, spacing: 4) {
                // メッセージのテキストを表示
                Text(message.content)
                    .font(.system(size: 14)) // フォントサイズを調整
                    .foregroundColor(message.role.rawValue == "user" ? .white : .black)
                    .padding(10)
                    // ユーザーとAIのメッセージで背景色を変更
                    .background(message.role.rawValue == "user" ? Color(#colorLiteral(red: 0.2078431373, green: 0.7647058824, blue: 0.3450980392, alpha: 1)) : Color(#colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9176470588, alpha: 1)))
                    .cornerRadius(20) // 角を丸くする
            }
            .padding(.vertical, 5)
            // ユーザーのメッセージの場合は右側にスペースを追加
            if message.role.rawValue != "user" {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

// アバタービュー
struct AvatarView: View {
    var imageName: String
    
    var body: some View {
        VStack {
            // アバター画像を円形に表示
            Image("hometyan")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            // AIの名前を表示
            Text("ほめちゃん")
                .font(.caption) // フォントサイズを小さくするためのオプションです。
                .foregroundColor(.black) // テキストの色を黒に設定します。
        }
    }
}

// プレビュー
struct PageMessageview_Previews: PreviewProvider {
    static var previews: some View {
        PageMessageView()
    }
}
 
func setupNavigationBar() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .purple
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}


