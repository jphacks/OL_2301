import SwiftUI

struct PageMenuView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink("このアプリについて") {
                    AboutApp()
                }
                NavigationLink("開発者情報") {
                    AboutDevepoper()
                }
            }
//            タイトル
            .navigationBarTitle("Cranberry", displayMode: .inline)
        }
        }
    }

struct AboutApp: View {
    var body: some View {
        Text("このアプリについて書いていくイメージ")
    }
}

struct AboutDevepoper: View {
    var body: some View {
        Text("開発者についてここで書いていくイメージ")
    }
}

struct PageMenuViewPreviews: PreviewProvider {
    static var previews: some View {
        PageMenuView()
    }
}
