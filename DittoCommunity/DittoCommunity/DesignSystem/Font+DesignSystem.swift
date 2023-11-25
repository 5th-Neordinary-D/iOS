//
//  Font+DesignSystem.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation
import SwiftUI


extension Font {
    
    public static var Heading1: Font {
        return Font.custom("Pretendard-Bold", size: 24)
    }
    
    public static var Heading2: Font {
        return Font.custom("Pretendard-Bold", size: 20)
    }
    
    public static var Heading3: Font {
        return Font.custom("Pretendard-Bold", size: 16)
    }
    
    public static var Heading4: Font {
        return Font.custom("Pretendard-Bold", size: 14)
    }
    
    public static var Title1: Font {
        return Font.custom("Pretendard-SemiBold", size: 16)
    }
    
    public static var Title2: Font {
        return Font.custom("Pretendard-SemiBold", size: 14)
    }
    
    public static var Body1: Font {
        return Font.custom("Pretendard-Regular", size: 16)
    }
    
    public static var Body2: Font {
        return Font.custom("Pretendard-Regular", size: 14)
    }
    
    public static var Body3: Font {
        return Font.custom("Pretendard-Regular", size: 12)
    }
    
    public static var Body4: Font {
        return Font.custom("Pretendard-Regular", size: 10)
    }
}
