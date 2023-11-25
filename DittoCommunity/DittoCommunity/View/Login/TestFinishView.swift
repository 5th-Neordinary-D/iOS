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
        VStack(spacing: 8) {
            Spacer()
            Text("공감 테스트 완료")
                .font(.h2)
                .foregroundColor(.gray07)
            Text("열심히 활동하면 공감지수를 올릴 수 있어요")
                .font(.b2)
                .foregroundColor(.gray05)
            Spacer()
            bottomButton
        }.padding(.horizontal, 20)
    }
    
    @ViewBuilder var bottomButton: some View {
        Button(action: {
            // TODO: - 네트워크로 로그인 하기
            appState.hasLogin = true
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

#Preview {
    TestFinishView()
}
