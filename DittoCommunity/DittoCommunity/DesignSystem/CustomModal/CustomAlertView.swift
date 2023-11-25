//
//  FinishEditAlertView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct CustomAlertView: View {
//    let isLeftBtn: Bool
//    let isRightBtn: Bool
    
    let alertTitle: String
    let alertSubTitle: String
    
    let leftBtnTitle: String
    let rightBtnTitle: String
    
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    
    
    init(
//        isLeftBtn: Bool = false,
//        isRightBtn: Bool = false,
        alertTitle: String = "작성 중인 글은 저장되지 않습니다.",
        alertSubTitle: String = "작성을 그만두시겠어요?",
        leftBtnTitle: String = "이어서 쓰기",
        rightBtnTitle: String = "작성 그만두기",
        leftBtnAction: @escaping () -> Void = {},
        rightBtnAction: @escaping () -> Void = {}
    ) {
//        self.isLeftBtn = isLeftBtn
//        self.isRightBtn = isRightBtn
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
            
            RoundedRectangle(cornerRadius: 16)
                .overlay {
                    VStack(spacing: 0) {
                        Spacer()
                        Text(alertTitle)
                            .foregroundColor(.black)
                        Text(alertSubTitle)
                            .foregroundColor(.gray05)
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray03)

                        HStack(spacing: 0) {
                            Button(
                                action: {
                                    
                                },
                                label: {
                                    Text(leftBtnTitle)
                                        .foregroundColor(.gray05)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            )
                            
                            Rectangle()
                                .frame(width: 1, height: 56)
                                .foregroundColor(.gray03)
                            
                            Button(
                                action: {
                                    
                                },
                                label: {
                                    Text(rightBtnTitle)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        
                                }
                            )
                        }
                        .frame(height: 56)
                        
                    }
                    
                }
                .frame(width: 294, height: 168)
                .foregroundColor(.white)
            
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView()
            .previewLayout(.sizeThatFits)
    }
}
