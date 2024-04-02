//
//  UIButton+.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/3/24.
//

import UIKit

extension UITextField {

    //TextField 기본 속성 커스텀
    func setTextField(forBackgroundColor: UIColor, forBorderColor: UIColor, forBorderWidth: CGFloat, forCornerRadius: CGFloat? = nil) {
      self.clipsToBounds = true
      self.layer.borderColor = forBorderColor.cgColor
      self.layer.borderWidth = forBorderWidth
      self.backgroundColor = forBackgroundColor
      
      if let cornerRadius = forCornerRadius {
          self.layer.cornerRadius = cornerRadius
      }  else {
          self.layer.cornerRadius = 0
      }
    }
    
    
    //TextField placeholder 커스텀
    func setPlaceholder(placeholder: String, fontColor: UIColor?, font: UIFont) {
    self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                    attributes: [.foregroundColor: fontColor!,
                                                                 .font: font])
    }
}
