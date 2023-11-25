//
//  Font+DesignSystem.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation
import SwiftUI


extension Font {
    
    public static var h1: Font {
        return .custom("Pretendard-Bold", size: 24)
    }
    
    public static var h2: Font {
        return .custom("Pretendard-Bold", size: 20)
    }
    
    public static var h3: Font {
        return .custom("Pretendard-Bold", size: 16)
    }
    
    public static var h4: Font {
        return .custom("Pretendard-Bold", size: 14)
    }
    
    public static var t1: Font {
        return .custom("Pretendard-SemiBold", size: 16)
    }
    
    public static var t2: Font {
        return .custom("Pretendard-SemiBold", size: 14)
    }
    
    public static var b1: Font {
        return .custom("Pretendard-Regular", size: 16)
    }
    
    public static var b2: Font {
        return .custom("Pretendard-Regular", size: 14)
    }
    
    public static var b3: Font {
        return .custom("Pretendard-Regular", size: 12)
    }
    
    public static var b4: Font {
        return .custom("Pretendard-Regular", size: 10)
    }
}
