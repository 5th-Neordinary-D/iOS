//
//  CategoryType.swift
//  DittoCommunity
//
//  Created by Subeen on 2023/11/25.
//

import Foundation

enum CategoryType: String, CaseIterable, Identifiable, CustomStringConvertible {
    
    var id : String { UUID().uuidString }
    
    case relationship = "인간관계"
    case love = "연애"
    case family = "가족"
    case company = "회사"
    case employ = "취업/이직"
    case health = "건강"
    case develop = "자기계발"
    case pet = "반려동물"
    case etc = "기타"
    
    var description: String {
        return self.rawValue
    }
}
