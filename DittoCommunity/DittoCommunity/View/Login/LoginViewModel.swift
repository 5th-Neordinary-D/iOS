//
//  SympathyTestViewModel.swift
//  DittoCommunity
//
//  Created by 김인섭 on 11/25/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var hasDoneTest = false
    @Published var questions: [Question] = [
        .init(question: "나 오늘 택배 뜯다가\n칼에 손 베였어ㅠㅠ", options: [
            .init(text: "괜찮아? 어떡해 ㅠㅠ 아팠겠다. 병원은 갔어? ", score: 25),
            .init(text: "뭔 택배? 얼마나 다쳤는데? ", score: 0)
        ]),
        .init(question: "너 오늘 힘들어 보이길래\n이거 보낸다 ㅠㅠ 힘내!", options: [
            .init(text: "헉..감동이야..잘먹을게! (진짜 감동)", score: 25),
            .init(text: "고마워 잘 먹을게! (내가 힘들어보였나?) ", score: 0)
        ]),
        .init(question: "하..나 오늘 헤어졌어..\n위로 좀 해줘" , options: [
            .init(text: "괜찮아? 너무 힘들겠다 기다려봐 내가 전화할게! ", score: 25),
            .init(text: "왜 헤어졌어?", score: 0)
        ]),
        .init(question: "헐 야 나 늦을 거 같아ㅠ\n퇴근시간이라 차가 막히네..", options: [
            .init(text: "음 알겠어 기다리고 있을게! (근데 사과는?) ", score: 25),
            .init(text: "음 알겠어 기다리고 있을게! (이유가 타당하군) ", score: 0)
        ])
    ]
}

struct Question {
    
    var question: String
    var options: [Option]
    
    struct Option {
        var text: String
        var isSelected: Bool = false
        var score: Int
    }
}
