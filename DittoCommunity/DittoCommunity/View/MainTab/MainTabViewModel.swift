//
//  MainTabViewModel.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/26/23.
//

import SwiftUI

@MainActor class MainTabViewModel: ObservableObject {
    
    @Published var currentTab: MainTab = .home
    @Published var showFeedPostView = false
    
    @Published var shouldNavigate = false
    var destination: Destination? = .none
    
    func navigate(to destination: Destination) {
        self.destination = destination
        self.shouldNavigate = true
    }
}

enum Destination {
    case feedDetail(Int)
    
    @ViewBuilder var view: some View {
        switch self {
        case .feedDetail(let id):
            FeedDetailView(id: id)
        }
    }
}
