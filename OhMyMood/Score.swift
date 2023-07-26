//
//  Score.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/26.
//

import UIKit

enum Score: CaseIterable {
    case one
    case five
    case ten
    
    var title: String {
        switch self {
        case .one:      return "1점+"
        case .five:     return "5점+"
        case .ten:      return "10점+"
        }
    }
}
