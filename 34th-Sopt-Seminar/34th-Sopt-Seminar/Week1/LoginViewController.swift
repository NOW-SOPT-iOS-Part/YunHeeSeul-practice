//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    static let width = UIScreen.main.bounds.width / 375
    static let height = UIScreen.main.bounds.height / 812

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: width * 69, 
                                          y: height * 161,
                                          width: width * 236,
                                          height: height * 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = UIColor(resource: .black)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendard(.subhead1)
        return label
    }()

    private lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 20,
                                                  y: UIScreen.main.bounds.height / 812 * 276,
                                                  width: UIScreen.main.bounds.width / 375 * 335,
                                                  height: UIScreen.main.bounds.height / 812 * 52))
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
        let textField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 20,
                                                  y: UIScreen.main.bounds.height / 812 * 335,
                                                  width: UIScreen.main.bounds.width / 375 * 335,
                                                  height: UIScreen.main.bounds.height / 812 * 52))
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
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = UIColor(resource: .grey300)
        button.addTarget(self, action: #selector(maskButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.isHidden = true
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.tintColor = UIColor(resource: .grey300)
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 21, 
                                            y: UIScreen.main.bounds.height / 812 * 422,
                                            width: UIScreen.main.bounds.width / 375 * 332,
                                            height: UIScreen.main.bounds.height / 812 * 58))
        button.backgroundColor = UIColor(resource: .grey200)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(resource: .white), for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        button.layer.cornerRadius = 6
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        setLayout()
        setDelegate()
    }

    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setDelegate() {
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    @objc
    func loginButtonDidTap() {
        presentToWelcomeVC()
//        pushToWelcomeVC()
    }
    
    @objc private func textFieldChange() {
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
        } else {
            loginButton.backgroundColor = UIColor(resource: .grey200)
            loginButton.isEnabled = false
        }
        print("\(id), \(pw)")
    }
    
    private func presentToWelcomeVC() {
        self.idTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.modalTransitionStyle = .flipHorizontal
        welcomeVC.id = self.idTextField.text ?? ""
        self.present(welcomeVC, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    @objc
    func maskButtonTapped() {
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
    }
    
    @objc
    func clearButtonTapped() {
        self.idTextField.text = ""
    }
    
}

extension LoginViewController: UITextFieldDelegate {
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
