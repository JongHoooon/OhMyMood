//
//  Mood.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/25.
//

enum Mood: Int, CaseIterable {
    case veryGood
    case good
    case soso
    case bad
    case veryBad
    
    var name: String {
        switch self {
        case .veryGood:     return "완전행복지수"
        case .good:         return "적당미소지수"
        case .soso:         return "그냥그냥지수"
        case .bad:          return "좀속상한지수"
        case .veryBad:      return "많이슬픈지수"
        }
    }
    
    var key: String {
        switch self {
        case .veryGood:     return "veryGood"
        case .good:         return "good"
        case .soso:         return "soso"
        case .bad:          return "bad"
        case .veryBad:      return "veryBad"
        }
    }
}
