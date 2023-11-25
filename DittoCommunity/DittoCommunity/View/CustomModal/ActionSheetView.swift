//
//  ActionSheetView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct ActionSheetView: View {
    
    let firstTitle: String
    let secondTitle: String
    let thirdTitle: String
    
    let firstBtnAction: () -> Void
    let secondBtnAction: () -> Void
    let thirdBtnAction: () -> Void
    
    init(
        firstTitle: String = "프로필 방문",
        secondTitle: String = "응원 보내기",
        thirdTitle: String = "취소하기",
        firstBtnAction: @escaping () -> Void = {},
        secondBtnAction: @escaping () -> Void = {},
        thirdBtnAction: @escaping () -> Void = {}
    ) {
        self.firstTitle = firstTitle
        self.secondTitle = secondTitle
        self.thirdTitle = thirdTitle
        self.firstBtnAction = firstBtnAction
        self.secondBtnAction = secondBtnAction
        self.thirdBtnAction = thirdBtnAction
    }
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(height: 180)
                    .overlay {
                        VStack(spacing: 0) {
                            Button(
                                action: {
                                    firstBtnAction()
                                },
                                label: {
                                    Text(firstTitle)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            )
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray03)
                            
                            Button(
                                action: {
                                    secondBtnAction()
                                },
                                label: {
                                    Text(secondTitle)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            )
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray03)
                            
                            Button(
                                action: {
                                    thirdBtnAction()
                                },
                                label: {
                                    Text(thirdTitle)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            )
                        }
                        .foregroundColor(.black)
                    }
            }
//            .edgesIgnoringSafeArea(.bottom)
            .padding(.horizontal, 15)
            .padding(.bottom, 23)
            
                
        }
    }
}



struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
