//
//  Icon.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation
import SwiftUI

enum Icon: String {
    
    case chevronLeft = "chevronLeft"
    case arrowDown = "arrowDown"
    case check = "check"
    case skip = "skip"
    case bell = "bell"
    case search = "search"
    case heart = "heart"
    case heartFill = "heart_fill"
    case bubble = "bubble"
    case more = "more"
    
    case naver = "naver"
    case kakao = "kakao"
    case google = "google"
    
    case home = "home"
    case mypage = "mypage"
    case plus = "plus"
    
    var image: Image {
        return Image(self.rawValue)
    }
}
