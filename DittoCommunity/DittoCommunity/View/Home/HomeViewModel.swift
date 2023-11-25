//
//  HomeViewModel.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation

@MainActor class HomeViewModel: ObservableObject {
    
    @Published var feeds: [ListFeed] = []
    
    @Published var selectedTab: FeedCategory = .all
    @Published var shouldShowDropbox = false
    @Published var selectedFilter: FilterItem = .hot
    
    @Published var tPadding: CGFloat = 100
    @Published var opacity: CGFloat = 1
    
    init() {
        feeds = ListFeed.mock
    }
    
    func didScroll(_ offset: CGFloat) {
//        let offset = offset - 210
//        print(offset)
//        guard 0 > offset, offset > -100 else { return }
    }
}
