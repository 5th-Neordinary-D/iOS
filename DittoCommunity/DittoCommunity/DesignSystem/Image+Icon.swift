//
//  Image+Icon.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation
import SwiftUI

enum Icon: String {
    case chevronLeft = "chevronLeft"
    case naver = "naver"
    case kakao = "kakao"
    case google = "google"
    case skip = "skip"
    case setting = "setting"
    case more_vertical = "more-vertical"
    
    var image: Image {
        return Image(self.rawValue)
    }
}
