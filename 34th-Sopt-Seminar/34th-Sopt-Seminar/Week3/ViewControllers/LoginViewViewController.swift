//
//  LoginViewViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/20/24.
//

import UIKit

class LoginViewViewController: UIViewController {    

    private let loginView = LoginView()
    
    var isActivate: Bool = false
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginView.delegate = self
    }

}

extension LoginViewViewController: LoginViewDelegate {

    func textFieldChange() {
        let id = self.loginView.idTextField.text ?? ""
        let pw = self.loginView.passwordTextField.text ?? ""
        
        if !id.isEmpty {
            loginView.clearButton.isHidden = false
        } else {
            loginView.clearButton.isHidden = true
        }
        
        if !id.isEmpty && !pw.isEmpty {
            loginView.loginButton.backgroundColor = UIColor(resource: .primaryOrange)
            loginView.loginButton.isEnabled = true
            isActivate = true
        } else {
            loginView.loginButton.backgroundColor = loginView.switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
            loginView.loginButton.isEnabled = false
            isActivate = false
        }
    }
    
    func maskButtonTapped() {
        self.loginView.passwordTextField.isSecureTextEntry = !self.loginView.passwordTextField.isSecureTextEntry

    }
    
    func clearButtonTapped() {
        self.loginView.idTextField.text = ""
        loginView.clearButton.isHidden = true
        loginView.loginButton.backgroundColor = loginView.switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        loginView.loginButton.isEnabled = false
        isActivate = false
    }
    
    // 모드를 변경해줄 때 만약 컴포넌트가 늘어난다면 그 컴포넌트의 변경된 스타일을 지정해주기 위해 코드를 더 추가해주어야 함
    func onClickSwitch() {
        self.view.backgroundColor = loginView.switchButton.isOn ? UIColor(resource: .black) : UIColor(resource: .white)
        self.loginView.idTextField.backgroundColor = loginView.switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        self.loginView.passwordTextField.backgroundColor = loginView.switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        self.loginView.modeLabel.textColor = loginView.switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .black)
        self.loginView.titleLabel.textColor = loginView.switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .black)
        self.loginView.maskButton.tintColor = loginView.switchButton.isOn ? UIColor(resource: .black) : UIColor(resource: .grey300)
        self.loginView.clearButton.tintColor = loginView.switchButton.isOn ? UIColor(resource: .black) : UIColor(resource: .grey300)
        self.loginView.idTextField.setPlaceholder(placeholder: "아이디",
                                                  fontColor: loginView.switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .grey300),
                                        font: .pretendard(.subhead4))
        self.loginView.passwordTextField.setPlaceholder(placeholder: "비밀번호",
                                                        fontColor: loginView.switchButton.isOn ? UIColor(resource: .white) : UIColor(resource: .grey300),
                                              font: .pretendard(.subhead4))
        
        if !isActivate {
            self.loginView.loginButton.backgroundColor = loginView.switchButton.isOn ? UIColor(resource: .orange200) : UIColor(resource: .grey200)
        } else {
            self.loginView.loginButton.backgroundColor = UIColor(resource: .primaryOrange)
        }
    }
    
    // 화면 전환 시 설정된 모드에 따라 다음 화면의 스타일을 변경해주어야 한느데 만약 컴포넌트가 늘어난다면 그 컴포넌트의 변경된 스타일을 지정해주기 위해 코드를 더 추가해주어야 함
    func presentWelcomeVC() {
        self.loginView.idTextField.resignFirstResponder()
        self.loginView.passwordTextField.resignFirstResponder()
        
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.delegate = self
        welcomeVC.id = self.loginView.idTextField.text ?? ""
        
        if loginView.switchButton.isOn {
            welcomeVC.welcomeLabel.textColor = UIColor(resource: .white)
            welcomeVC.view.backgroundColor = UIColor(resource: .black)
            welcomeVC.reloginButton.backgroundColor = UIColor(resource: .orange200)
            welcomeVC.reloginButton.setTitleColor(UIColor(resource: .black), for: .normal)
        } else {
            welcomeVC.welcomeLabel.textColor = UIColor(resource: .black)
            welcomeVC.view.backgroundColor = UIColor(resource: .white)
        }
        
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.delegate = self
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
}

extension LoginViewViewController: DataBindProtocol {
    func dataBind(id: String?) {
        if let id = id {
            loginView.idTextField.text = "\(id)는 뭘로 할꺼얌"
        }
    }
}
