//
//  LoginView.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/20/24.
//

import UIKit

import Then

protocol LoginViewDelegate: AnyObject {
    func presentWelcomeVC()
    func pushToWelcomeVC()
    func textFieldChange()
    func maskButtonTapped()
    func clearButtonTapped()
    func onClickSwitch()    
}

final class LoginView: UIView {
    
    // MARK: - UI Properties
    
    let titleLabel = UILabel().then {
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = UIColor(resource: .black)
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(.subhead1)
    }
    
    lazy var idTextField =  UITextField().then {
        $0.setPlaceholder(placeholder: "아이디",
                                 fontColor: UIColor(resource: .grey300),
                                 font: UIFont.pretendard(.subhead4))
        $0.setTextField(forBackgroundColor: UIColor(resource: .grey200),
                               forBorderColor: UIColor(resource: .grey200),
                               forBorderWidth: 0,
                               forCornerRadius: 3)
        $0.setLeftPadding(amount: 23)
        $0.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        rightView.addSubview(clearButton)
        $0.rightView = rightView
        $0.rightViewMode = .always
    }
    
    lazy var passwordTextField = UITextField().then {
        $0.setPlaceholder(placeholder: "비밀번호",
                                 fontColor: UIColor(resource: .grey300),
                                 font: UIFont.pretendard(.subhead4))
        $0.setTextField(forBackgroundColor: UIColor(resource: .grey200),
                               forBorderColor: UIColor(resource: .grey200),
                               forBorderWidth: 0,
                               forCornerRadius: 3)
        $0.setLeftPadding(amount: 23)
        $0.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        $0.isSecureTextEntry = true
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        rightView.addSubview(maskButton)
        $0.rightView = rightView
        $0.rightViewMode = .always
    }
    
    lazy var maskButton = UIButton().then {
        $0.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        $0.tintColor = UIColor(resource: .grey300)
        $0.addTarget(self, action: #selector(maskButtonTapped), for: .touchUpInside)
    }
    
    lazy var clearButton = UIButton().then {
        $0.isHidden = true
        $0.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        $0.tintColor = UIColor(resource: .grey300)
        $0.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    lazy var loginButton = UIButton().then {
        $0.backgroundColor = UIColor(resource: .grey200)
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor(resource: .white), for: .normal)
        $0.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        $0.titleLabel?.font = UIFont.pretendard(.subhead1)
        $0.layer.cornerRadius = 6
        $0.isEnabled = false
    }
    
    let modeLabel = UILabel().then {
        $0.text = "mode"
        $0.textColor = UIColor(resource: .black)
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(.subhead1)
    }
    
    lazy var switchButton = UISwitch().then {
        $0.onTintColor = UIColor(resource: .orange200)
        $0.tintColor = UIColor(resource: .black)
        $0.isOn = false
        $0.addTarget(self, action: #selector(onClickSwitch), for: .valueChanged)
    }
    
    // MARK: - UI Properties
    
    weak var delegate: LoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setStyle()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




// MARK: - Private Methods

private extension LoginView {
    
    func setLayout() {
        self.addSubviews(titleLabel,
                              idTextField,
                              passwordTextField,
                              loginButton,
                              switchButton,
                              modeLabel)
        
        idTextField.addSubviews(clearButton)
        passwordTextField.addSubviews(maskButton)
        
        modeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(97)
            $0.leading.equalToSuperview().inset(142)
            $0.height.equalTo(30)
            $0.width.equalTo(60)
        }
        
        switchButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(97)
            $0.leading.equalTo(modeLabel.snp.trailing).offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(modeLabel.snp.bottom).offset(70)
            $0.width.equalTo(236)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(70)
            $0.width.equalTo(335)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.width.equalTo(335)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.width.equalTo(335)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        maskButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
        clearButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    func setStyle() {
        self.backgroundColor = UIColor(resource: .white)
    }
    
    func setDelegate() {
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    @objc 
    func presentToWelcomeVC() {
        self.delegate?.presentWelcomeVC()
    }
    
    func pushToWelcomeVC() {
        self.delegate?.pushToWelcomeVC()
    }
    
    @objc
    func textFieldChange() {
        self.delegate?.textFieldChange()
    }
    
    @objc
    func maskButtonTapped() {
        self.delegate?.maskButtonTapped()
    }
    
    @objc
    func clearButtonTapped() {
        self.delegate?.clearButtonTapped()
    }
    
    @objc
    func onClickSwitch() {
        self.delegate?.onClickSwitch()        
    }
    
}


// MARK: - Delegates

extension LoginView: UITextFieldDelegate {
    func textFieldDidBeginEditing (_ textField: UITextField) {
        
        if textField.placeholder == "아이디" {
            self.idTextField.layer.borderWidth = 2
            self.idTextField.layer.borderColor = UIColor(resource: .grey500).cgColor
        } else {
            self.passwordTextField.layer.borderWidth = 2
            self.passwordTextField.layer.borderColor = UIColor(resource: .grey500).cgColor
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.placeholder == "아이디" {
            self.idTextField.layer.borderWidth = 0
            self.idTextField.layer.borderColor = UIColor(resource: .grey200).cgColor
        } else {
            self.passwordTextField.layer.borderWidth = 0
            self.passwordTextField.layer.borderColor = UIColor(resource: .grey200).cgColor
        }
    }
}

