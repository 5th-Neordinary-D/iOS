//
//  FeedViewModel.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var feed: Feed

    init(feed: Feed) {
        self.feed = feed
    }
}
