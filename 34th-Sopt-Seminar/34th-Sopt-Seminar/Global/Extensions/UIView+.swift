//
//  UIView+.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/4/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
