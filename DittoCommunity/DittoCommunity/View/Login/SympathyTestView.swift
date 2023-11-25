//
//  SympathyTestView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import SwiftUI

struct SympathyTestView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject var appState: AppState
    
    @State var navigateToNext = false
    let pageIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
            topBar
                .padding(.bottom, 36)

            // Indicator
            VStack(spacing: 0) {
                title
                    .padding(.bottom, 44)
                Image("test" + String(pageIndex + 1))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                cellList
                Spacer()
                nextButton
            }.padding(.horizontal, 20)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder var topBar: some View {
        VStack(spacing: 0) {
//            HStack {
//                Icon.chevronLeft.image.onTapGesture { dismiss() }
//                Spacer()
//                Text("건너뛰기")
//                    .font(.b2)
//                    .foregroundColor(.gray05)
//                    .onTapGesture {
//                        // TODO: - 네트워크 통신으로 로그인하기
//                        appState.hasLogin = true
//                    }
//            }
            CustomNavigationBar(
                isDisplayLeadingBtn: true,
                isDisplayTrailingBtn: true,
                leadingItems: [(.chevronLeft, { dismiss() })],
                trailingItems: [(.skip, {
                    // TODO: - 네트워크 통신으로 로그인하기
                    appState.hasLogin = true
                    
                })]
            )
//            .padding(.trailing, 10)
//            .frame(height: 44)
//            .padding(.horizontal, 20)
            pageIndicator
        }
    }
    
    
    @ViewBuilder var pageIndicator: some View {
        HStack(spacing: 0) {
            Color.gray07.frame(width: (CGFloat(UIScreen.screenWidth) / 4) * CGFloat(pageIndex + 1))
            Color.gray03.frame(maxWidth: .infinity)
        }.frame(height: 4)
    }
    
    @ViewBuilder var title: some View {
        HStack {
            Text(viewModel.questions[pageIndex].question)
                .font(.h1)
                .foregroundColor(.gray07)
                .lineLimit(2)
            Spacer()
        }.frame(height: 68)
    }
    
    @ViewBuilder var cellList: some View {
        VStack(spacing: 8) {
            ForEach(0..<2) { index in
                cell(index: index)
            }
        }
    }
    
    @ViewBuilder func cell(index: Int) -> some View {
        
        let isSelected = viewModel.questions[pageIndex].options[index].isSelected
        
        HStack {
            Text(viewModel.questions[pageIndex].options[index].text)
            Spacer()
        }
        .font(.b1)
        .foregroundColor(.gray07)
        .padding(.horizontal, 16)
        .frame(height: 78)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    isSelected ? Color.primary02 : Color.gray03,
                    lineWidth: isSelected ? 2 : 1
                )
        )
        .onTapGesture {
            
            let elseButtonIndex = index == 0 ? 1 : 0
            
            if isSelected {
                viewModel.questions[pageIndex].options[index].isSelected.toggle()
            } else if !isSelected, viewModel.questions[pageIndex].options[elseButtonIndex].isSelected == true {
                viewModel.questions[pageIndex].options[0].isSelected.toggle()
                viewModel.questions[pageIndex].options[1].isSelected.toggle()
            } else if !isSelected {
                viewModel.questions[pageIndex].options[index].isSelected.toggle()
            }
        }
    }
    
    @ViewBuilder var nextButton: some View {
        
        let hasSelected = !viewModel.questions[pageIndex].options.filter { $0.isSelected }.isEmpty
        
        NavigationLink(isActive: $navigateToNext) {
            SympathyTestView(pageIndex: pageIndex + 1)
                .environmentObject(viewModel)
        } label: {
            EmptyView()
        }

        Button(action: {
            if 3 > pageIndex, hasSelected {
                navigateToNext = true
            } else if pageIndex == 3, hasSelected {
                withAnimation {
                    viewModel.hasDoneTest = true
                }
            }
        }, label: {
            Text("다음")
                .font(.t1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(
                    hasSelected ? Color.primary02 : Color.gray02
                )
                .cornerRadius(16)
        })
    }
    
    @ViewBuilder var skipButton: some View {
        Color.gray.cornerRadius(15)
            .frame(height: 56)
            .overlay {
                Text("테스트 건너뛰기")
                    .font(.h2)
                    .foregroundColor(.white)
            }
    }
}

//struct SympathyTestView_Previews: PreviewProvider {
//        static var previews: some View {
//            SympathyTestView(pageIndex: 0)
//        }
//}
