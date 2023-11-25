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
    @State var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                Image("logo")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            showSplash = false
                        }
                    }
            } else if appState.hasLogin {
                MainTabView()
                    .environmentObject(appState)
            } else if appState.didTest {
                TestFinishView()
                    .environmentObject(appState)
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}

class AppState: ObservableObject {
    
    @AppStorage("hasLogin") var hasLogin = false
    @AppStorage("didTest") var didTest = false
}
