//
//  tabview.swift
//  test1028
//
//  Created by Nagahashikirara on 2023/10/28.
//

import SwiftUI

struct HomeView: View {
    @State var selection = 1
    var body: some View {
        
        TabView {
            
                    // --- ここから ---
                    // タブ内に表示するビュー
            PageMessageView()
            // 実際には Text を使うのではなく、カスタムビューとなる
                        .tabItem {
                            // タブのラベル部分のビュー
                            Text("chat")
                            Image(systemName:"message")
                        }
                        .tag(1)
                    // --- ここまで ---

                    // --- ここから ---
                    // タブ内に表示するビュー
                    //Text("carender") // 実際には Text を使うのではなく、カスタムビューとなる
            PageCarenderView()
                        .tabItem {
                            // タブのラベル部分のビュー
                            Text("history")
                            Image(systemName:"tray.full.fill")
                        }
                        .tag(2)
                    // --- ここまで ---

                    // --- ここから ---
                    // タブ内に表示するビュー
                    //Text("menu") // 実際には Text を使うのではなく、カスタムビューとなる
            PageMenuView()
                        .tabItem {
                            // タブのラベル部分のビュー
                            Text("menu")
                            Image(systemName: "slider.horizontal.3")
                        }
                        .tag(3)
                    // --- ここまで ---

                    // 上記のように「ここから」と「ここまで」の間の部分をタブアイテムの数だけ繰り返す
                }
        .accentColor(.yellow)
        
//        NavigationView{
//            .navigationBarTitle("cranberry",displayMode: .inline)
//        }

    }
    init() {

      // 文字色
      UITabBar.appearance().unselectedItemTintColor = .white
      // 背景色
      UITabBar.appearance().backgroundColor = .orange
    }
}



struct tabview_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
