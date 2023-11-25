//
//  LottieView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/26/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let data: Data

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.CompatibleAnimationView {
        let animationView = CompatibleAnimationView(data: data)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopAnimationCount = .infinity
        return animationView
    }
}
