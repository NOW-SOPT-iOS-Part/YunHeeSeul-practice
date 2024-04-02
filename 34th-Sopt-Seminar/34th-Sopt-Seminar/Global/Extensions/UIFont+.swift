//
//  UIFont+.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/3/24.
//

import UIKit

enum FontName {
    case head1
    case subhead1, subhead2, subhead3, subhead4, subhead5
    case info12
    
    
    var rawValue: String {
        switch self {
        case .head1:
            return "Pretendard-ExtraBold"
        case .subhead1, .subhead3:
            return "Pretendard-Bold"
        case .subhead4:
            return "Pretendard-SemiBold"
        case .subhead2, .subhead5, .info12:
            return "Pretendard-Regular"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .head1:
            return 25
        case .subhead1:
            return 18
        case .subhead2:
            return 16
        case .subhead3:
            return 15
        case .subhead4, .subhead5:
            return 14
        case .info12:
            return 12

        }
    }
}

extension UIFont {
    static func pretendard(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
}
