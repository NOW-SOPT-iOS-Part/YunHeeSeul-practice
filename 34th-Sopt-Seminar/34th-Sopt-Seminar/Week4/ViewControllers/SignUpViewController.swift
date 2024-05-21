//
//  SignUpViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/27/24.
//

import UIKit

import SnapKit
import Then
import Moya

final class SignUpViewController: UIViewController {
    
    private let rootView = SignUpView()
    
    
    let userProvider = MoyaProvider<UserTargetType>(
        plugins:  [MoyaLoggingPlugin()]
    )
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setTarget()
    }
    
    private func setTarget() {
        rootView.signUpButton.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func signUpButtonDidTap() {
        guard let id = rootView.idTextField.text else { return }
        guard let password = rootView.passwordTextField.text else { return }
        guard let nickName = rootView.nickNameTextField.text else { return }
        guard let phoneNumber = rootView.phoneNumberTextField.text else { return }
        
        let request = SignUpRequestModel(
            authenticationId: id,
            password: password,
            nickname: nickName,
            phone: phoneNumber
        )
        
        UserService.shared.signUp(request: request) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponseModel else { return }
                dump(data)
                self?.pushToCheckUserInfoVC()
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    private func pushToCheckUserInfoVC() {
        let checkUserInfoVC = CheckUserInfoViewController()
        self.navigationController?.pushViewController(checkUserInfoVC, animated: true)
    }
}
