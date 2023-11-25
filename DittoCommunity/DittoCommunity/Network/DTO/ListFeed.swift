//
//  ListFeed.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation

struct ListFeed: Codable {
    let writerId: Int
    let feedId: Int
    let title: String
    let content: String
    let category: String
    var commentCount: Int
    var likeCount: Int
    var isLikeChecked: Bool
}

extension ListFeed {
    
    static var mock: [Self] = Array(
        repeating: .init(
            writerId: 1,
            feedId: 1,
            title: "직장에서 이런 일이 있었네요...",
            content: "제가 작성한 기획서를 매번 부족하다는 이유로 까고,,, 직장 상사의 감정 쓰레기통이 된 거 같아요.. ㅠ",
            category: "가족",
            commentCount: 4,
            likeCount: 10,
            isLikeChecked: true
        ),
        count: 20
    )
}

//{
//    "writerId": 2,
//    "title": "test",
//    "content" : "test",
//    "category" : "test",
//    "commentCount": 3,
//    "likeCount": 4,
//    "isLikeChecked": true,
//    "createdAt": "2023-07-13 00:08:07.627623",
//    "updatedAt": "2023-07-13 00:08:07.627623"
//},
