//
//  LoginViewController_LiveCoding.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 5/25/24.
//

import UIKit
import SnapKit

import RxSwift

final class LoginViewController_LiveCoding: UIViewController {
    
    private let rootView = LoginView()
    
    private let viewModel: LoginViewModel_Rx
    
    private let disposeBag = DisposeBag()
    
    init(viewMoel: LoginViewModel_Rx) {
        self.viewModel = viewMoel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        bindViewModel()
    }
    
    
    private func bindViewModel() {
        let input = LoginViewModel_Rx.Input(
            idTextFieldDidChangeEvent: rootView.idTextField.rx.text.asObservable(),
            passwordTextFieldDidChangeEvent: rootView.passwordTextField.rx.text.asObservable(),
            loginButtonDidTapEvent: rootView.loginButton.rx.tap.asObservable())
        
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        
        output.isValid.subscribe(
            onNext: { _ in
                print(#function)
                self.pushToWelcomeVC()
            }).disposed(by: disposeBag)
        
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}


