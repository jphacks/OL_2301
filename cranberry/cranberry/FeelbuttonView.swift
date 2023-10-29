//
//  FeelbuttoView.swift
//  cranberry
//
//  Created by 金津愛澄 on 2023/10/29.
//

import SwiftUI


struct SampleButtonOnListView : View {
    var body: some View {
        List {
            Section {
                Button(action: {
                    print("button 1")
                    
                }, label: { Text("button 1") })
                
                HStack {
                    Button(action: {
                        print("button 3-1")
                        
                    }, label: { Text("button 3-1") })
                    .onTapGesture {
                        
                    }
                    .buttonStyle(MyButtonStyle())
                    
                    Button(action: {
                        print("button 3-2")
                        
                    }, label: { Text("button 3-2") })
                    .onTapGesture {
                        
                    }
                    .buttonStyle(MyButtonStyle())
                    
                }
            }
        }
    }
}
            
struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17))
            .padding()
            .background(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
        
    }
}
