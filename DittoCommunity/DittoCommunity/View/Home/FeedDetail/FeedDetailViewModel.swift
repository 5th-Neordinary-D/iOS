//
//  FeedDetailViewModel.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/26/23.
//

import Foundation

class FeedDetailViewModel: ObservableObject {
    @Published var feed: DetailFeed? = .mock
    @Published var showLottieContainer = false
    @Published var commentText = ""
    
    func didTapSubmit() {
        feed?.comments.append(
            .init(
                commentId: 0,
                content: commentText,
                fCount: 0,
                tCount: 0,
                author: .init(id: 0, username: "박이든", heartLevel: "78%"),
                isLiked: false,
                comments: []
            )
        )
        feed?.commentCount += 1
        commentText = ""
    }
}
