//
//  tabview.swift
//  test1028
//
//  Created by Nagahashikirara on 2023/10/28.
//

import SwiftUI

struct tabview: View {
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
                            Text("carender")
                            Image(systemName:"rectangle.split.3x3")
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
    }
}

struct tabview_Previews: PreviewProvider {
    static var previews: some View {
        tabview()
    }
}
