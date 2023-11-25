//
//  FinishEditAlertView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct CustomAlertView: View {

    let alertTitle: String
    let alertSubTitle: String
    
    let leftBtnTitle: String
    let rightBtnTitle: String
    
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    
    init(
        alertTitle: String = "작성 중인 글은 저장되지 않습니다.",
        alertSubTitle: String = "작성을 그만두시겠어요?",
        leftBtnTitle: String = "이어서 쓰기",
        rightBtnTitle: String = "작성 그만두기",
        leftBtnAction: @escaping () -> Void = {},
        rightBtnAction: @escaping () -> Void = {}
    ) {
        self.alertTitle = alertTitle
        self.alertSubTitle = alertSubTitle
        self.leftBtnTitle = leftBtnTitle
        self.rightBtnTitle = rightBtnTitle
        self.leftBtnAction = leftBtnAction
        self.rightBtnAction = rightBtnAction
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            content
        }
    }
    
    @ViewBuilder var content: some View {
        VStack(spacing: 4) {
            Spacer()
            Text(alertTitle)
                .font(.t1)
                .foregroundColor(.gray07)
            Text(alertSubTitle)
                .font(.b2)
                .foregroundColor(.gray05)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                Button(
                    action: {
                        leftBtnAction()
                    },
                    label: {
                        Text(leftBtnTitle)
                            .foregroundColor(.gray05)
                            .font(.b2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                )
                
                Rectangle()
                    .frame(width: 1)
                    .foregroundColor(.gray03)
                
                Button(
                    action: {
                        rightBtnAction()
                    },
                    label: {
                        Text(rightBtnTitle)
                            .foregroundColor(.gray07)
                            .font(.b2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                )
            }
            .frame(height: 56)
            .overlay(alignment: .top) {
                Color.gray03.frame(height: 1)
            }
        }
        .frame(width: 294, height: 172)
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView()
            .previewLayout(.sizeThatFits)
    }
}
