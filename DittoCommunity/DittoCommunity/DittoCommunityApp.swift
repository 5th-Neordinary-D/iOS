//
//  DittoCommunityApp.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

@main
struct DittoCommunityApp: App {
    
    @AppStorage("hasLogin") var hasLogin = false

    
    var body: some Scene {
        WindowGroup {
            if hasLogin {
                MainTabView()
            } else {
                
            }
        }
    }
}
