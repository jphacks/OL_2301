
import SwiftUI
import OpenAIKit

// チャット表示用のメインビュー
struct PageMessageView: View {

//    会話終了を押したかのフラグ ここ追加
//    @State private var ButtonFlag = false
    // 現在のチャットが完了しているかどうかを示す変数
    @State private var isCompleting: Bool = false
    
    // ユーザーが入力するテキストを保存する変数
    @State private var text: String = ""
    
    // ユーザーの気持ちを保存する変数
    @State var feel: String = "none"
    // ユーザーの出来事を保存する変数
    @State var incident: String = "none"
    // 日時保存する変数
    @State var datetext: String = ""
    //まとめを押したかどうか
    @State var isPress: Bool = false
    //102821:41追加 終わりのメッセージ
    @State var mess: String = ""
    
    // チャットメッセージの配列
    @State private var chat: [ChatMessage] = [
        ChatMessage(role: .system, content: "あなたはユーザーの質問や会話に友達のように回答するほめちゃんという人物です。とてもフレンドリーに会話を行います。ユーザーが気分を述べた場合、原因を聞いた後、カウンセリングしてください。ユーザーが「ほめて」と入力した場合、ユーザーの自己肯定感が上がるよう、たくさん褒めてください。「まとめ」と言われたら会話内容の要約を表示してください。"),
        ChatMessage(role: .assistant, content:"こんにちは！今日の出来事を教えてね")
    ]
    
    struct MyButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .font(.system(size: 10))
                .padding()
                .background(configuration.isPressed ? Color.orange.opacity(0.5) : Color.white)
                .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.orange)
            
        }
    }
    
    // チャット画面のビューレイアウト
    var body: some View {
        VStack {
            if feel == "none"{
                List{
                    Section {
                        Button(action: {
                            print("今の気分は？")
                        }, label: { Text("今の気分は？").foregroundColor(.orange).font(.system(size: 15)) })
                        
                        HStack {
                            Button(action: {
                                feel="happy"
                                
                            }, label: { Text("☺️").font(.system(size: 40))})
                            .onTapGesture {
                                
                            }
                            .buttonStyle(MyButtonStyle())
                            
                            Button(action: {
                                feel="angry"
                                
                            }, label: { Text("😡").font(.system(size: 40)) })
                            .onTapGesture {
                                
                            }
                            .buttonStyle(MyButtonStyle())
                            Button(action: {
                                feel="sad"
                                
                            }, label: { Text("😢").font(.system(size: 40)) })
                            .onTapGesture {
                                
                            }
                            .buttonStyle(MyButtonStyle())
                            Button(action: {
                                feel="fun"
                                
                            }, label: { Text("😆").font(.system(size: 40)) })
                            .onTapGesture {
                                
                            }
                            .buttonStyle(MyButtonStyle())
                            
                        }
                        .padding(EdgeInsets(top:-20 , leading: 0, bottom: -20, trailing: 0))
                    }
                }
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        ForEach(chat.indices, id: \.self) { index in
//                            if index>0{
//                                MessageView(message: chat[index])
//                            }
//                        }
//                    }
//                }
//                .padding(EdgeInsets(top:-200 , leading: 0, bottom: -20, trailing: 0))
//                .background(Color(red:242,green:242,blue:247,opacity:1))
            }
//             スクロール可能なメッセージリストの表示
            else{
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(chat.indices, id: \.self) { index in
                            if index>0{
                                MessageView(message: chat[index])
                            }
                        }
                    }
                    //                以下追加
                    //                .onChange(of: chat.indices) { _ in
                    //                        withAnimation {
                    //                            proxy.scrollTo(index)
                    //                        }
                    //                    }
                    //                ここまで
                    
                }
//                .padding(EdgeInsets(top:-200 , leading: 0, bottom: -20, trailing: 0))
                
                
                //以下追加 10290250
                //                ScrollViewReader { proxy in
                //                    VStack(alignment: .leading) {
                //                        ForEach(chat.indices, id: \.self) { index in
                //                            if index>0{
                //                                MessageView(message: chat[index])
                //                            }
                //                        }
                //                    }
                //                    .onChange(of: chat.indices) { _ in
                //                        withAnimation {
                //                            proxy.scrollTo(chat.count)
                //                        }
                //                    }
                //                }
                //                .padding(.top)
                //                ここまで
                
                
                // 画面をタップしたときにキーボードを閉じる
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
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
                    if incident == "none"{
                        incident = text
                    }

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

                }
//                 テキストが空またはチャットが完了していない場合はボタンを無効化
                .disabled(self.text == "" || isCompleting || feel=="none")

                Button(action:{
                    isPress = true
                    //日時取得
                    isCompleting = true
                    let date = Date()
                    datetext = "\(date)"
                    
                    print(datetext)
                    print(feel)
                    print(incident)
                    
                }) {
                    Text("まとめ")
                        .padding()
                        .font(.caption2)
                        .accentColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                }
                .disabled(self.incident == "none" || isCompleting || self.feel == "none")
//                PageCarenderView(isPress: $isPress ,feel: $feel , incident: $incident, datetext: $datetext)
                
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

//ここまで

//     101行当たり               //会話終了のボタンを作成
//Button(action: {
//
//}, label: { Text("まとめ").font(.system(size: 40))})
//.onTapGesture {
//
//}
//.buttonStyle(MyButtonStyle())
//.padding()
//.accentColor(Color.white)
//.background(Color.green)
//.cornerRadius(50)
//                    //ここまで追加 21:47
