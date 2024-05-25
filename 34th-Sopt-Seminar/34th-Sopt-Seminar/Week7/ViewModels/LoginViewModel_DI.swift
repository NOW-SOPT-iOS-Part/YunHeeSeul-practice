//
//  LoginViewModel_DI.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 5/25/24.
//

import UIKit

protocol LoginViewModelType {
    var isValid: ObservablePattern<Bool> { get }
    var errMessage: ObservablePattern<String> { get }
    
    func checkValid(id: String?, password: String?)
}

final class LoginViewModel_DI: LoginViewModelType {
    var isValid: ObservablePattern<Bool> = ObservablePattern<Bool>.init(false)
    var errMessage: ObservablePattern<String> = ObservablePattern<String>.init(nil)
    
    func checkValid(id: String?, password: String?) {
        guard let id else {
            errMessage.value = "아이디가 비어있습니다."
            return
        }
        guard let password else {
            errMessage.value = "비밀번호가 비어있습니다."
            return
        }
        
        let idRegEx = "[A-Za-z0-9]{5,13}"
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        
        guard let _ = id.range(of: idRegEx, options: .regularExpression) else {
            errMessage.value = "아이디가 유효하지 않습니다."
            return
        }
        
        guard let _ = password.range(of: pwRegEx, options: .regularExpression) else {
            errMessage.value = "비밀번호가 유효하지 않습니다."
            return
        }
        isValid.value = true
        
    }
}
