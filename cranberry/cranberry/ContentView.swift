//
//  ContentView.swift
//  cranberry
//
//  Created by 金津愛澄 on 2023/10/27.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world1027!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

////変更以下を加えた
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        PageCarenderView { dateComponents in
//            guard let year = dateComponents.year,
//                  let month = dateComponents.month,
//                  let day = dateComponents.day else {
//                return
//            }
//            print("yate: \(year), month: \(month), day: \(day)")
//        }
//    }
//}
