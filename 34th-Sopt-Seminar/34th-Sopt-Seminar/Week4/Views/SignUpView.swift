//
//  SignUpView.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/27/24.
//

import UIKit

import SnapKit
import Then
import Moya

final class SignUpView: UIView {
    
    private let titleLabel = UILabel()
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    let nickNameTextField = UITextField()
    let phoneNumberTextField = UITextField()
    lazy var signUpButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.text = "회원가입"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.numberOfLines = 2
            $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        }
        
        idTextField.do {
            $0.placeholder = "아이디를 입력해주세요"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호를 입력해주세요"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        }
        
        nickNameTextField.do {
            $0.placeholder = "닉네임을 입력해주세요"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        }
        
        phoneNumberTextField.do {
            $0.placeholder = "전화번호를 입력해주세요"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        }
        
        signUpButton.do {
            $0.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
            $0.setTitle("회원가입하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        }
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, nickNameTextField, phoneNumberTextField, signUpButton].forEach {
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(161)
            $0.width.equalTo(236)
            $0.height.equalTo(44)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalTo(idTextField)
            $0.height.equalTo(52)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalTo(idTextField)
            $0.height.equalTo(52)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalTo(idTextField)
            $0.height.equalTo(52)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(35)
            $0.horizontalEdges.equalTo(idTextField)
            $0.height.equalTo(58)
        }
    }
}
