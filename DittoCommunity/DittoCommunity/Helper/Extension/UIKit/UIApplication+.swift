//
//  UIApplication+.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import UIKit

extension UIApplication {
    
    static var windowScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    static var keyWindow: UIWindow? {
        windowScene?.windows.filter { $0.isKeyWindow }.first
    }
    
    static var safeArea: UIEdgeInsets {
        keyWindow?.safeAreaInsets ?? .zero
    }
}
