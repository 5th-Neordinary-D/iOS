//
//  DetailFeed.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/26/23.
//

import Foundation

struct DetailFeed: Codable {
    
    let id: Int
    let category: String
    let title: String
    let content: String
    var sympathy1: Int
    var sympathy2: Int
    var sympathy3: Int
    var sympathy4: Int
    var sympathy5: Int
    var sympathyCount: Int
    var isLiked: Bool
    var commentCount: Int
    var author: Author
    var comments: [Comment]
    
    struct Author: Codable {
        let id: Int
        let username: String
        let heartLevel: String
    }
    
    struct Comment: Codable {
        let commentId: Int
        let content: String
        var fCount: Int
        var tCount: Int
        let author: Author
        var isLiked: Bool
        var comments: [Comment]
    }
}

extension DetailFeed {
    static var mock: Self {
        .init(
            id: 1,
            category: "인간관계",
            title: "블라블라 고민이 있습니다.",
            content: "덕분에 힘이 납니다! 오늘 처음 가입했는데 많은 분들이 계신 걸 보니 든든해요.덕분에 힘이 납니다! 오늘 처음 가입했는데 많은 분들이 계신 걸 보니 든든해요.덕분에 힘이 납니다! 오늘 처음 가입했는데 많은 분들이 계신 걸 보니 든든해요.덕분에 힘이 납니다! 오늘 처음 가입했는데 많은 분들이 계신 걸 보니 든든해요.덕분에 힘이 납니다!",
            sympathy1: 0,
            sympathy2: 0,
            sympathy3: 0,
            sympathy4: 0,
            sympathy5: 0,
            sympathyCount: 0,
            isLiked: false,
            commentCount: 0,
            author: .init(
                id: 1,
                username: "하루",
                heartLevel: "55%"
            ),
            comments: [
                .init(
                    commentId: 0,
                    content: "공감해요 어쩌구저쩌구",
                    fCount: 0,
                    tCount: 0,
                    author: .init(id: 0, username: "박이든", heartLevel: "78%"),
                    isLiked: false,
                    comments: []
                )
            ]
        )
    }
}

//{
//  "id": 2,
//    "category": "카테고리",
//  "title": "제목",
//  "content": "내용",
//    "sympathy1": 1,
//    "sympathy2": 1,
//  "sympathy3": 1,
//  "sympathy4": 1,
//  "sympathy5": 1,
//    "sympathyCount": 5,
//  "isLiked": false,
//  "commentCount": 3,
//  "author" : {
//    "id": 1,
//    "username": "닉네임",
//    "heartLevel": "53%"
//  },
//  "comments": [
//    {
//        "commentId": 1,
//        "content": "안녕하세요",
//        "fCount": 1,
//        "tCount": 2,
//        "author": {
//          "id": 2,
//          "username": "닉네임",
//          "heartLevel": "80%"
//         },
//        "isLiked": false;
//         "comments": [
//           {
//             "commentId": 2,
//             "content": "안녕하세요",
//             "fCount": 1,
//             "tCount": 2,
//             "author": {
//            "id": 3,
//            "username": "닉네임",
//            "heartLevel": "80%"
//            }
//          }
//         ]
//    },
//   {
//    "commentId": 1,
//    "content": "안녕하세요",
//    "fCount": 1,
//    "tCount": 3,
//    "author": {
//      "id": 2,
//      "username": "닉네임",
//      "heartLevel": "80%"
//      }
//   }
//  ]
//}
