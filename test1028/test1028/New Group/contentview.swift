//
//  contentview.swift
//  test1028
//
//  Created by Nagahashikirara on 2023/10/28.
//

import SwiftUI

struct contentview: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
                NavigationLink(destination: secondview().navigationTitle("画面2")) {
                    Text("secondviewへ")
                }
            }
            .navigationTitle("画面1")
        }
    }
}
        
        struct contentview_Previews: PreviewProvider {
            static var previews: some View {
                contentview()
            }
        }
