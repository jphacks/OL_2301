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
            .navigationBarTitle("Cranberry", displayMode: .inline)
        }
        }
    }

struct AboutApp: View {
    var body: some View {
        Text("ここで話してみよう。気持ちリセットのお供にcranberry。")
            .foregroundColor(.black)
    }
}

struct AboutDevepoper: View {
    var body: some View {
        Text("created by らっきー&あずちゃん")
            .foregroundColor(.black)
        Text("みんなの気持ちが少しでも前向きになりますように")
            .foregroundColor(.orange)
            .font(.callout)
    }
}

struct PageMenuViewPreviews: PreviewProvider {
    static var previews: some View {
        PageMenuView()
    }
}
