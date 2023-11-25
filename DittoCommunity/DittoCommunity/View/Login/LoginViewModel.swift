//
//  SympathyTestViewModel.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation

struct Question {
    
    var question: String
    var options: [Option]
    
    struct Option {
        var text: String
        var isSelected: Bool = false
        var score: Int
    }
}
