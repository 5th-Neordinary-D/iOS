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
    
    static var mock: [Self] = [
        .init(writerId: 0, feedId: 0, 
              title: "직장에서 이런 일이 있었네요.",
              content: "제가 작성한 기획서를 매번 부족하다는 이유로 까고,,, 직장 상사의 감정 쓰레기통이 된 거 같아요.. ㅠ",
              category: "회사",
              commentCount: 0, likeCount: 0, isLikeChecked: false
             ),
        .init(writerId: 0, feedId: 0, 
              title: "입사 한 달째 .. 아직도 모르는 게 많아요ㅠㅠ", content: "아직도 모르는 게 많아요. 입사 동기는 벌써 적응했던데 언제쯤 일에 익숙해질까요?",
              category: "회사", commentCount: 0, likeCount: 0, isLikeChecked: false),
        .init(writerId: 0, feedId: 0, 
              title: "요즘 인간관계가 좁아진 것 같아요..", content: "회사 - 집, 회사- 집을 반복하다 보니 인간관계가 너무 좁아진 거 같아서ㅠㅠ 가끔 세상에 혼자 사는 거 같아요..",
              category: "인간관계", commentCount: 0, likeCount: 0, isLikeChecked: false),
        .init(writerId: 0, feedId: 0,
              title: "대학 친구는 정말 비즈니스인가요?",
              content: "방학하면 연락을 거의 안하고 중고등학교 때처럼 끈끈하지 않은 것 같아요. 원래 이렇게 비즈니스 관계인가요?",
              category: "인간관계", commentCount: 0, likeCount: 0, isLikeChecked: false),
        .init(writerId: 0, feedId: 0, title: "여자친구의 남사친이 신경 쓰여요.",
              content: "사귀기 전부터 거슬리던 남사친이 계속 연락을 하는데 거절하지 않는 여자친구에게 화가 나요. 제가 이해심이 부족한 건가요?",
              category: "연애", commentCount: 0, likeCount: 0, isLikeChecked: false),
        .init(writerId: 0, feedId: 0, title: "남자친구의 권태기에 상처 받았어요.", content: "초반에는 애정표현도 많이 해주고 매번 보고싶다고 달려와줬는데.. 요즘엔 일이 바쁘다 뭐가 힘들다 하며 절 피하는 것 같아요.. 저는 아직 불타는데..제가 부족한 거 일까요?", category: "회사", commentCount: 0, likeCount: 0, isLikeChecked: false),
        .init(writerId: 0, feedId: 0, title: "엄마가 저랑 오빠를 차별해요", content: "장남이라고 맛잇는 반찬과 좋은 방은 늘 저희 오빠꺼네요.. 저도 잘 먹을 줄 아는데 ㅠㅠㅠ 정말 너무하는 거 같아요...", category: "가족", commentCount: 0, likeCount: 0, isLikeChecked: false),
        .init(writerId: 0, feedId: 0, title: "엄마랑 자꾸 싸워요", content: "저는 성인인데 엄마가 하나부터 열까지 모든 걸 간섭해요..제 옷 입는 스타일까지 간섭하는 건 너무 하는 거 아닌가요?", category: "가족", commentCount: 0, likeCount: 0, isLikeChecked: false)
    ]
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
