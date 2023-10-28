import SwiftUI

struct PageMenuView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink("このアプリについて"){
                    AboutApp()
                }
                .foregroundColor(.black)
                
                NavigationLink("開発者情報") {
                    AboutDevepoper()
                }
                .foregroundColor(.black)
            }
//            タイトル
//        .navigationBarTitle("Cranberry", displayMode: .inline)
        }
        }
    }

struct AboutApp: View {
    var body: some View {
        Text("cranberry")
            .foregroundColor(.orange)
            .font(.system(size: 70 ,weight: .black,design: .default))
            .padding(EdgeInsets(top:0 , leading: 0, bottom: 20, trailing: 0))
        Text("ここで話してみよう。気持ちリセットのお供に。")
            .foregroundColor(.black)
            .padding(EdgeInsets(top:0 , leading: 0, bottom:60, trailing: 0))
        
        Text("このアプリは人が持つメンタルヘルスに関係する問題の解決を目的に作成されました。ほめちゃんとの会話や気持ちの記録を通してあなたの心の健康を手助けします")

            .font(.callout)
            .lineSpacing(20)
            .foregroundColor(.black)
            .padding()
            .frame(width: 300, height: 300)
            .background(Color.white)
            .border(Color.orange, width: 5)
            .cornerRadius(50)
        

    }
}

struct AboutDevepoper: View {
    var body: some View {
        Text("cranberry")
            .foregroundColor(.orange)
            .font(.system(size: 70 ,weight: .black,design: .default))
            .padding(EdgeInsets(top:0 , leading: 0, bottom: 20, trailing: 0))
        Text("about Developper")
            .foregroundColor(.orange)
            .font(.system(size: 20 ,weight: .black,design: .default))
            .padding(EdgeInsets(top:0 , leading: 0, bottom: 20, trailing: 0))
        
        Image("intronagahasi2")
            .resizable()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .padding(EdgeInsets(top:50 , leading: 0, bottom: 0, trailing: 200))
        Text("Kirara Nagahashi")
            .foregroundColor(.black)
            .padding(EdgeInsets(top:0 , leading: 0, bottom: 0, trailing: 200))
        Text("2024年から社会人予定（卒業できれば）の永橋と申します。現在は、研究と大学生活を謳歌しています。iOSアプリは初でしたが、なっっん（Azumi）と企画・開発しました！")
            .foregroundColor(.black)
            .padding(EdgeInsets(top:-140 , leading: 180, bottom: 0, trailing: 20))
            .font(.caption)
        
        
        Image("introkanatu2")
            .resizable()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .padding(EdgeInsets(top:0 , leading: 200, bottom: 20, trailing: 0))
        Text("Azumi Kanatsu")
            .foregroundColor(.black)
            .font(.callout)
            .padding(EdgeInsets(top:0 , leading: 200, bottom: 0, trailing: 0))
        Text("大学3年生。最近の趣味はクレヨン画とミント栽培！2日間でのアプリ制作は初めてで凄く大変でしたが、とても楽しかったです！\nmessage : cranberryを通して、気持ちを理解して、も〜〜っと自分を尊重してもらえたらいいな！と思います。")
            .foregroundColor(.black)
            .padding(EdgeInsets(top:-150 , leading: 30, bottom: 0, trailing: 180))
            .font(.caption)
            
    }
}

struct PageMenuViewPreviews: PreviewProvider {
    static var previews: some View {
        PageMenuView()
    }
}
