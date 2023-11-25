//
//  Feed.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation

struct Feed: Hashable {
    var title: String
    var category: String
    var content: String
    var id = UUID()
}
