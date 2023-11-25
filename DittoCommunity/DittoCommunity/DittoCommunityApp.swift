//
//  DittoCommunityApp.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

@main
struct DittoCommunityApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.hasLogin {
                MainTabView()
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}

class AppState: ObservableObject {
    
    @AppStorage("hasLogin") var hasLogin = false
}
