//
//  TestFinishView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct TestFinishView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Image("finish")
                .padding(.bottom, 23)
            Text("진스님의 디토지수는 100% 입니다.")
                .font(.h2)
                .foregroundColor(.gray07)
            Text("당신은 이미 공감왕! 디토에서 당신의 공감을\n기다리는 사람들에게 감동을 전하세요.")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.b2)
                .foregroundColor(.gray05)
            Spacer()
            bottomButton
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder var bottomButton: some View {
        Button(action: {
            appState.hasLogin = true
            appState.didTest = true
        }, label: {
            Text("공감하러 가기")
                .font(.t1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(Color.primary02)
                .cornerRadius(16)
        })
    }
}

struct TestFinishView_Previews: PreviewProvider {
    static var previews: some View {
        TestFinishView()
    }
}
