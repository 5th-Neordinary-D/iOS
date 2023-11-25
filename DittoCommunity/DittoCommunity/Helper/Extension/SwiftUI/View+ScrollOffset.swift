//
//  View+ScrollOffset.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

extension View {
    
    @ViewBuilder func scrollOffset(_ didScroll: @escaping (CGFloat) -> Void) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("scrollView")).minY
                    Color.clear.preference(key: ScrollOffsetKey.self, value: minY)
                }
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    didScroll(value - UIApplication.safeArea.top)
                }
            }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = nextValue() }
}
