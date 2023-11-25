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
    
    @Published var showAlert = false
    var alert: AlertModel? = .none
    
    @Published var shouldNavigate = false
    var destination: Destination? = .none
    
    func navigate(to destination: Destination) {
        self.destination = destination
        self.shouldNavigate = true
    }
    
    func alert(_ model: AlertModel) {
        self.alert = model
        self.showAlert = true
    }
    
    func resetAlert() {
        self.alert = .none
        self.showAlert = false
    }
    
    func resetNavigation() {
        self.destination = .none
        self.shouldNavigate = false
    }
}

enum Destination {
    case feedDetail(Int)
    case test
    
    @ViewBuilder var view: some View {
        switch self {
        case .feedDetail(let id):
            FeedDetailView(id: id)
        case .test:
            SympathyTestView(pageIndex: 0)
        }
    }
}

struct AlertModel {
    let title: String
    let message: String
    let primaryButton: String
    let primaryAction: () -> Void
    let secondaryButton: String
    let secondaryAction: () -> Void
}
