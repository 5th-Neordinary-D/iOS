//
//  HomeViewModel.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var selectedTab: FeedCategory = .all
    @Published var shouldShowDropbox = false
    @Published var selectedFilter: FilterItem = .famous
}
