//
//  cranberryApp.swift
//  cranberry
//
//  Created by 金津愛澄 on 2023/10/27.
//

import SwiftUI
import LineSDK


@main
struct cranberryApp: App {
   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
