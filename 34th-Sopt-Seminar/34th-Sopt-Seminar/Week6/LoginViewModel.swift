//
//  LoginViewModel.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 5/25/24.
//

import UIKit

final class LoginViewModel {
    // 클로저 타입의 프로퍼티 선언
    var isValid: ((Bool) -> Void)?
    var errMessage: ((String?) -> Void)?
    
    func checkValid(id: String?, password: String?) {
        guard let id = id, !id.isEmpty else {
            errMessage?("아이디가 비어있습니다.")
            return
        }
        guard let password = password, !password.isEmpty else {
            errMessage?("비밀번호가 비어있습니다.")
            return
        }
        
        let idRegEx = "[A-Za-z0-9]{5,13}"
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        
        if id.range(of: idRegEx, options: .regularExpression) == nil {
            errMessage?("아이디가 유효하지 않습니다.")
            return
        }
        
        if password.range(of: pwRegEx, options: .regularExpression) == nil {
            errMessage?("비밀번호가 유효하지 않습니다.")
            return
        }
        
        isValid?(true)
    }
}

