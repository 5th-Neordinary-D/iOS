//
//  FeedDetailView.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/26/23.
//

import SwiftUI

struct FeedDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = FeedDetailViewModel()
    
    let id: Int
    
    @State var scrollToBottom = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.5)
            .onEnded { viewModel.showLottieContainer = $0 }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            topBar
            ScrollViewReader(content: { proxy in
                ScrollView {
                    LazyVStack(content: {
                        contentView
                        Color.gray01.frame(height: 8)
                        commentsView
                        Spacer()
                            .id(1000)
                    })
                }
                .onChange(of: scrollToBottom, perform: { newValue in
                    proxy.scrollTo(1000)
                })
                .redacted(viewModel.feed == nil)
                commentInput
            })
        }
    }
    
    @ViewBuilder var topBar: some View {
        CustomNavigationBar(
            isDisplayLeadingBtn: true,
            isDisplayTrailingBtn: true,
            leadingItems: [(Icon.chevronLeft, { self.dismiss() })],
            trailingItems: [(Icon.more, { })]
        )
    }
    
    @ViewBuilder var contentView: some View {
        VStack(alignment: .leading, spacing: 0) {
            userInfoView
                .padding(.bottom, 24)
            Text(viewModel.feed?.title ?? "  ")
                .font(.h2)
                .foregroundColor(Color.gray07)
                .padding(.bottom, 10)
            Text(viewModel.feed?.content ?? "  ")
                .font(.b1)
                .foregroundColor(Color.gray06)
                .padding(.bottom, 16)
                .lineSpacing(6)
            sympathyContainer
                .padding(.bottom, 25)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder var userInfoView: some View {
        HStack(spacing: 10) {
            Image("placeholder")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(.gray02)
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.feed?.author.username ?? "  ")
                    .font(.t1)
                    .foregroundColor(Color.gray07)
                Text("디토지수 " + (viewModel.feed?.author.heartLevel ?? "  "))
                    .font(.b2)
                    .foregroundColor(Color.gray05)
            }
            Spacer()
            Text(viewModel.feed?.category ?? "  ")
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .foregroundColor(Color.gray07)
                .font(.b2)
                .background(Color.gray01)
                .cornerRadius(8)
        }
    }
    
    @ViewBuilder var sympathyContainer: some View {
        HStack(spacing: 4) {
            if viewModel.feed?.sympathyCount == 0 {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.gray03)
                    .padding(.trailing, 4)
                Text("첫 공감 남기기")
                    .font(.b2)
                    .foregroundColor(.gray05)
            } else {
                if viewModel.feed?.sympathy1 != 0 {
                    LottieView(data: loadAnimationData(named: "emotion1")!)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .padding(.trailing, 4)
                }
                if viewModel.feed?.sympathy2 != 0 {
                    LottieView(data: loadAnimationData(named: "emotion2")!)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .padding(.trailing, 4)
                }
                if viewModel.feed?.sympathy3 != 0 {
                    LottieView(data: loadAnimationData(named: "emotion3")!)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .padding(.trailing, 4)
                }
                if viewModel.feed?.sympathy4 != 0 {
                    Image("emotion4")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 4)
                }
                Text(String(viewModel.feed?.sympathyCount ?? 0))
                    .font(.b2)
                    .foregroundColor(Color.gray05)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color.gray03, lineWidth:1)
        }
        .gesture(longPress)
        .overlay(alignment: .top) {
            if viewModel.showLottieContainer {
                lottieContainer
                    .offset(x: 100, y: -90)
            }
        }
    }
    
    @ViewBuilder var lottieContainer: some View {
        HStack(spacing: 12) {
            if let data = loadAnimationData(named: "emotion1") {
                LottieView(data: data)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .onTapGesture {
                        viewModel.feed?.sympathy1 += viewModel.feed?.isLiked ?? false ? -1 : 1
                        viewModel.feed?.sympathyCount += viewModel.feed?.isLiked ?? false ? -1 : 1
                        viewModel.feed?.isLiked.toggle()
                        viewModel.showLottieContainer = false
                    }
            }
            if let data = loadAnimationData(named: "emotion2") {
                LottieView(data: data)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .onTapGesture {
                        viewModel.feed?.sympathy2 += viewModel.feed?.isLiked ?? false ? -1 : 1
                        viewModel.feed?.sympathyCount += viewModel.feed?.isLiked ?? false ? -1 : 1
                        viewModel.feed?.isLiked.toggle()
                        viewModel.showLottieContainer = false
                    }
            }
            if let data = loadAnimationData(named: "emotion3") {
                LottieView(data: data)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .onTapGesture {
                        viewModel.feed?.sympathy3 += viewModel.feed?.isLiked ?? false ? -1 : 1
                        viewModel.feed?.sympathyCount += viewModel.feed?.isLiked ?? false ? -1 : 1
                        viewModel.feed?.isLiked.toggle()
                        viewModel.showLottieContainer = false
                    }
            }
            Image("emotion4")
                .resizable()
                .frame(width: 44, height: 44)
                .onTapGesture {
                    viewModel.feed?.sympathy4 += viewModel.feed?.isLiked ?? false ? -1 : 1
                    viewModel.feed?.sympathyCount += viewModel.feed?.isLiked ?? false ? -1 : 1
                    viewModel.feed?.isLiked.toggle()
                    viewModel.showLottieContainer = false
                }
        }
        .padding(16)
        .frame(height: 76)
        .background(Color.white)
        .cornerRadius(100)
        .shadow(color: .black.opacity(0.08), radius: 2, x: 0, y: 4)
    }
    
    @ViewBuilder var commentsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("공감댓글 " + String(viewModel.feed?.commentCount ?? 0))
                    .font(.b2)
                    .foregroundColor(Color.gray06)
                    .frame(height: 22)
                Spacer()
            }.padding(.bottom, -3)
            if let comments = viewModel.feed?.comments {
                ForEach(Array(comments.enumerated()), id: \.offset) { index, item in
                    commentCell(item)
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder func commentCell(_ comment: DetailFeed.Comment) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image("placeholder")
                    .resizable()
                    .frame(width: 36, height: 36)
                VStack(alignment: .leading, spacing: 0) {
                    Text(comment.author.username)
                        .font(.t2)
                        .foregroundColor(.gray07)
                    Text("디토지수 " + comment.author.heartLevel)
                        .font(.b4)
                        .foregroundColor(.gray05)
                }
                Spacer()
                Icon.more.image
            }.frame(height: 38)
            Text(comment.content)
                .font(.b1)
                .foregroundColor(.gray06)
                .padding(.leading, 44)
        }
    }
    
    @ViewBuilder var commentInput: some View {
        VStack {
            TextField(
                "따뜻한 공감을 남겨주세요",
                text: $viewModel.commentText,
                onCommit: {
                    withAnimation {
                        viewModel.didTapSubmit()
                        scrollToBottom.toggle()
                    }
                }
            )
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .padding(.trailing, 34)
            .overlay(alignment: .trailing, content: {
                Button(action: {
                    withAnimation {
                        viewModel.didTapSubmit()
                        scrollToBottom.toggle()
                    }
                }, label: {
                    Text("등록")
                        .foregroundColor(
                            viewModel.commentText.isEmpty ?
                            .gray04 : .primary02
                        )
                        .font(.b1)
                        .padding(.trailing, 24)
                })
            })
            .background(Color.gray01)
            .cornerRadius(100)
            .padding(.horizontal, 20)
            .padding(.top, 12)
            Spacer()
        }
        .frame(height: 81)
        .overlay(alignment: .top) {
            Color.gray03.frame(height: 1)
        }
    }
}

private func loadAnimationData(named name: String) -> Data? {
    guard let url = Bundle.main.url(forResource: name, withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return nil
    }
    return data
}


struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        FeedDetailView(id: 0)
        MainTabView()
    }
}
