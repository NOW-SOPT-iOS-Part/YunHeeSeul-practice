//
//  CheckUserInfoViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/27/24.
//

import UIKit

final class CheckUserInfoViewController: UIViewController {
    private let logoImageView = UIImageView(image: .danggeun)
    private let idLabel = UILabel()
    private let nickNameLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        requestUserInfo()
    }

    private func requestUserInfo() {
        //memeberId에 아까 받은 멤버 아이디 직접 넣어주기
        UserService.shared.getUserInfo(memberId: "\(11)") { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? UserInfoResponseModel else {
                    return }
                self?.idLabel.text = data.data.authenticationId
                self?.nickNameLabel.text = data.data.nickname
                self?.phoneNumberLabel.text = data.data.phone
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
    
    private func setStyle() {
        self.view.backgroundColor = .white
        
        idLabel.do {
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
            $0.textAlignment = .center
        }
        
        nickNameLabel.do {
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
            $0.textAlignment = .center
        }
        
        phoneNumberLabel.do {
            $0.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
            $0.textAlignment = .center
        }
    }
    
    private func setLayout() {
        [logoImageView, idLabel, nickNameLabel, phoneNumberLabel].forEach {
            self.view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(87)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(150)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
        }
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
    }
}
