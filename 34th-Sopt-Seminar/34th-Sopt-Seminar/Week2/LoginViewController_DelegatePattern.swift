//
//  LoginViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/6/24.
//

import UIKit

import SnapKit

class LoginViewController_DelegatePattern: UIViewController {
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = UIColor(resource: .black)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendard(.subhead1)
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.setPlaceholder(placeholder: "아이디",
                                 fontColor: UIColor(resource: .grey300),
                                 font: UIFont.pretendard(.subhead4))
        textField.setTextField(forBackgroundColor: UIColor(resource: .grey200),
                               forBorderColor: UIColor(resource: .grey200),
                               forBorderWidth: 0,
                               forCornerRadius: 3)
        textField.setLeftPadding(amount: 23)
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        rightView.addSubview(clearButton)
        textField.rightView = rightView
        textField.rightViewMode = .always
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.setPlaceholder(placeholder: "비밀번호",
                                 fontColor: UIColor(resource: .grey300),
                                 font: UIFont.pretendard(.subhead4))
        textField.setTextField(forBackgroundColor: UIColor(resource: .grey200),
                               forBorderColor: UIColor(resource: .grey200),
                               forBorderWidth: 0,
                               forCornerRadius: 3)
        textField.setLeftPadding(amount: 23)
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        textField.isSecureTextEntry = true
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        rightView.addSubview(maskButton)
        textField.rightView = rightView
        textField.rightViewMode = .always
        
        return textField
    }()
    
    private lazy var maskButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = UIColor(resource: .grey300)
        button.addTarget(self, action: #selector(maskButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.tintColor = UIColor(resource: .grey300)
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(resource: .grey200)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(resource: .white), for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        button.layer.cornerRadius = 6
        button.isEnabled = false
        return button
    }()
    
    private let modeLabel: UILabel = {
        let label = UILabel()
        label.text = "mode"
        label.textColor = UIColor(resource: .black)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendard(.subhead1)
        return label
    }()
    
    private lazy var switchButton: UISwitch = {
        let button = UISwitch()
        button.onTintColor = UIColor(resource: .orange200)
        button.tintColor = UIColor(resource: .black)
        button.isOn = false
        button.addTarget(self, action: #selector(onClickSwitch), for: .valueChanged)
        
        return button
    }()
    
    // MARK: - UI Properties
    
    var isActivate: Bool = false
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setStyle()
        setDelegate()
    }
    
}


// MARK: - Private Methods

private extension LoginViewController_DelegatePattern {
    
    func setLayout() {
        self.view.addSubviews(titleLabel,
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
        self.view.backgroundColor = .white
    }
    
    func setDelegate() {
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func presentToWelcomeVC() {
        self.idTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.delegate = self
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.modalTransitionStyle = .flipHorizontal
        welcomeVC.id = self.idTextField.text ?? ""
        
        if switchButton.isOn {
            welcomeVC.welcomeLabel.textColor = UIColor(resource: .white)
            welcomeVC.view.backgroundColor = UIColor(resource: .black)
            welcomeVC.reloginButton.backgroundColor = UIColor(resource: .orange200)
            welcomeVC.reloginButton.setTitleColor(UIColor(resource: .black), for: .normal)
        } else {
            welcomeVC.welcomeLabel.textColor = UIColor(resource: .black)
            welcomeVC.view.backgroundColor = UIColor(resource: .white)
        }
        
        self.present(welcomeVC, animated: true)
    }
    
    func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.delegate = self
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    @objc
    func loginButtonDidTap() {
        presentToWelcomeVC()
        //        pushToWelcomeVC()
    }
    
    @objc
    func textFieldChange() {
        let id = self.idTextField.text ?? ""
        let pw = self.passwordTextField.text ?? ""
        
        if !id.isEmpty {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
        
        if !id.isEmpty && !pw.isEmpty {
            loginButton.backgroundColor = UIColor(resource: .primaryOrange)
            loginButton.isEnabled = true
            isActivate = true
        } else {
            loginButton.backgroundColor = switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
            loginButton.isEnabled = false
            isActivate = false
        }
    }
    
    @objc
    func maskButtonTapped() {
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
    }
    
    @objc
    func clearButtonTapped() {
        self.idTextField.text = ""
        clearButton.isHidden = true
        loginButton.backgroundColor = switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        loginButton.isEnabled = false
        isActivate = false
    }
    
    @objc
    func onClickSwitch() {
        self.view.backgroundColor = switchButton.isOn ? UIColor(resource: .black) : UIColor(resource: .white)
        self.idTextField.backgroundColor = switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        self.passwordTextField.backgroundColor = switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        self.modeLabel.textColor = switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .black)
        self.titleLabel.textColor = switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .black)
        self.maskButton.tintColor = switchButton.isOn ? UIColor(resource: .black) : UIColor(resource: .grey300)
        self.clearButton.tintColor = switchButton.isOn ? UIColor(resource: .black) : UIColor(resource: .grey300)
        self.idTextField.setPlaceholder(placeholder: "아이디",
                                        fontColor: switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .grey300),
                                        font: .pretendard(.subhead4))
        self.passwordTextField.setPlaceholder(placeholder: "비밀번호",
                                              fontColor: switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .grey300),
                                              font: .pretendard(.subhead4))
        
        if !isActivate {
            self.loginButton.backgroundColor = switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        } else {
            self.loginButton.backgroundColor = UIColor(resource: .primaryOrange)
        }
        
    }
    
}


// MARK: - Delegates

extension LoginViewController_DelegatePattern: UITextFieldDelegate {
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

extension LoginViewController_DelegatePattern: DataBindProtocol {
    func dataBind(id: String?) {
        if let id = id {
            idTextField.text = "\(id)는 뭘로 할꺼얌"
        }
    }
}
