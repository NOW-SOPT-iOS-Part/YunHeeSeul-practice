//
//  UIFont+.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/3/24.
//

import UIKit

enum FontName {
    case head1_extraBold
    case body1_bold
    case body1_semiBold
    
    var rawValue: String {
        switch self {
        case .head1_extraBold:
            return "Pretendard-ExtraBold"
        case .body1_bold:
            return "Pretendard-Bold"
        case .body1_semiBold:
            return "Pretendard-SemiBold"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .head1_extraBold:
            return 25
        case .body1_bold:
            return 18
        case .body1_semiBold:
            return 14

        }
    }
}

extension UIFont {
    static func pretendard(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
}
