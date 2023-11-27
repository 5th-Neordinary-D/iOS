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
    case skip = "skip"
    case arrowRight = "arrowRight"
    case complete = "complete"
    case cancel = "cancel"
    case naver = "naver"
    case kakao = "kakao"
    case google = "google"
    
    var image: Image {
        return Image(self.rawValue)
    }
}
