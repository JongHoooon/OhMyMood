//
//  Color.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/26.
//

import UIKit

enum Color: CaseIterable {
    case black
    case red
    case green
    
    var title: String {
        switch self {
        case .black:    return "검정"
        case .red:      return "빨강"
        case .green:   return "초록"
        }
    }
    
    var color: UIColor {
        switch self {
        case .black:    return .black
        case .red:      return .red
        case .green:   return .green
        }
    }
}
