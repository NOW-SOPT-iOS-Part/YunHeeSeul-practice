//
//  LoginViewController_DI.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 5/25/24.
//

import UIKit
import SnapKit

final class LoginViewController_DI: UIViewController {
    
    private let rootView = LoginView()
    private let viewModel: LoginViewModelType
    
    override func loadView() {
        self.view = rootView
    }
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setTarget()
        bindViewModel()
    }
    
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private func bindViewModel() {
        viewModel.isValid.bind { [weak self] isValid in
            guard let isValid else { return }
            if isValid { self?.pushToWelcomeVC() }
        }
        
        viewModel.errMessage.bind { [weak self] err in
            guard let err else { return }
            self?.showToast(err)
        }
    }
    
    
    @objc private func loginButtonDidTap() {
        viewModel.checkValid(
            id: rootView.idTextField.text,
            password: rootView.passwordTextField.text
        )
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


