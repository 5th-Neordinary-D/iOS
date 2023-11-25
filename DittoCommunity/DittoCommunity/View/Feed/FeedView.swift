//
//  FeedView.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import SwiftUI

struct FeedView: View {
    @StateObject var feedViewModel: FeedViewModel
    @State var isCategoryTapped: Bool = false
    @State var isCancel: Bool = false
    @State var category = ""
    
    var body: some View {

            VStack {
                CustomNavigationBar(
                    title: "글 작성",
                    isDisplayLeadingBtn: true,
                    isDisplayTrailingBtn: true,
                    leadingItems: [(Icon.cancel, {
                        // 게시물 등록 취소
//                        isCancel.toggle()
                    })],
                    trailingItems: [(Icon.complete, {
                        // TODO: - 게시물 등록
                    })]
                )
                
                // 피드 타이틀 인풋 뷰
                FeedTitleInputView(feedViewModel: feedViewModel)
                
                
                Rectangle()
                    .stroke(Color.gray03)
                    .frame(height: 60)
                    .overlay {
                        Button(
                            action: {
                                isCategoryTapped.toggle()
                            },
                            label: {
                                HStack {
                                    Text(category == "" ? "공감을 원하는 글 카테고리를 선택하세요" : category)
                                        .foregroundColor(category == "" ? .gray07 : .orange)
                                        .font(.b1)
                                        .frame(maxHeight: .infinity)
                                    Spacer()
                                    Icon.arrowRight.image
                                }
                                .padding(.horizontal, 20)
                            }
                        )
                    }
                
                    

                // 피트 콘텐츠 인풋 뷰
                FeedContentInputView(feedViewModel: feedViewModel)
            }
            .popup(isPresented: $isCategoryTapped) {
                CategoryModalView2(isCategoryTapped: $isCategoryTapped, category: $category)
            } customize: {
                $0
                    .type(.toast)
                    .position(.bottom)
                    .animation(.spring())
                    .closeOnTapOutside(true)
                    .backgroundColor(.black.opacity(0.5))
                    .dragToDismiss(true)
            }
            .overlay {
                
                if isCancel {
                    CustomAlertView(
                        alertTitle: "작성 중인 글은 저장되지 않습니다.",
                        alertSubTitle: "작성을 그만두시겠어요?",
                        leftBtnTitle: "이어서 쓰기",
                        rightBtnTitle: "작성 그만두기",
                        leftBtnAction: {},
                        rightBtnAction: {}
                    )
                }
            }
    }
}

// MARK: - 피드 타이틀 인풋 뷰
fileprivate struct FeedTitleInputView: View {
    @ObservedObject private var feedViewModel: FeedViewModel
    
    fileprivate init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
    }
    
    fileprivate var body: some View {
        TextField(
            "제목을 입력하세요.",
            text: $feedViewModel.feed.title
        )
        .font(.h2)
        .padding(.horizontal, 20)
    }
}

// MARK: - 카테고리 선택 뷰
//struct CategorySelectView: View {
//
//    @Binding var isCategoryTapped: Bool
//
//    var body: some View {
//        Rectangle()
//            .stroke(Color.gray03)
//            .frame(height: 60)
//            .overlay {
//                Button(
//                    action: {
//                        isCategoryTapped.toggle()
//                    },
//                    label: {
//                        HStack {
//                            Text(category == "" ? "공감을 원하는 글 카테고리를 선택하세요" : category)
//                                .foregroundColor(.gray07)
//                                .font(.b1)
//                                .frame(maxHeight: .infinity)
//                            Spacer()
//                            Icon.arrowRight.image
//                        }
//                        .padding(.horizontal, 20)
//                    }
//                )
//            }
//    }
//}

// MARK: - 피드 콘텐츠 인풋 뷰
private struct FeedContentInputView: View {
    @ObservedObject private var feedViewModel: FeedViewModel        // ObservedObject로 주입 받기
    
    fileprivate init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
    }
    
    fileprivate var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $feedViewModel.feed.content)
                .font(.b1)
            
            if feedViewModel.feed.content.isEmpty {
                Text("내용을 입력해주세요")
                    .font(.b1)
                    .foregroundColor(.gray04)
                    .allowsHitTesting(false)        // 터치가 먹지 않게 함. Text가 아닌 위의 TextEditor에 터치가 먹도록 함.
                    .padding(.top, 10)
                    .padding(.leading, 5)
            }
        }
        .padding(.horizontal, 20)
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(
            feedViewModel: .init(
                feed: .init(
                    title: "",
                    category: "",
                    content: ""
                )
            )
        )
        .previewLayout(.sizeThatFits)
    }
}
