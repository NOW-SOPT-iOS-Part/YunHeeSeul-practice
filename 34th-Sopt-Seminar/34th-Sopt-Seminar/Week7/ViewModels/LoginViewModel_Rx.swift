//
//  LoginViewModel_Rx.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 5/25/24.
//

import RxSwift
import RxRelay

final class LoginViewModel_Rx: ViewModelType {

    private var idText: String?
    private var passwordText: String?
    
    struct Input {
        let idTextFieldDidChangeEvent: Observable<String?>
        let passwordTextFieldDidChangeEvent: Observable<String?>
        let loginButtonDidTapEvent: Observable<Void>
    }
    
    struct Output {
        var isValid = PublishRelay<Void>()
        var errMessage = PublishRelay<String>()
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.idTextFieldDidChangeEvent.subscribe(onNext: { [weak self] id in
            self?.idText = id
        }).disposed(by: disposeBag)
        
        input.passwordTextFieldDidChangeEvent.subscribe(onNext: { [weak self] password in
            self?.passwordText = password
        }).disposed(by: disposeBag)
        
        input.loginButtonDidTapEvent.subscribe(onNext: { [weak self] _ in
            guard let id = self?.idText else {
                output.errMessage.accept("아이디가 비어있습니다.")
                return
            }
            guard let password = self?.passwordText else {
                output.errMessage.accept("비밀번호가 비어있습니다.")
                return
            }
            
            let idRegEx = "[A-Za-z0-9]{5,13}"
            let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
            
            guard let _ = id.range(of: idRegEx, options: .regularExpression) else {
                output.errMessage.accept("아이디가 유효하지 않습니다.")
                return
            }
            
            guard let _ = password.range(of: pwRegEx, options: .regularExpression) else {
                output.errMessage.accept("비밀번호가 유효하지 않습니다.")
                return
            }
            output.isValid.accept(Void())
        }).disposed(by: disposeBag)
        
        return output
    }
}
