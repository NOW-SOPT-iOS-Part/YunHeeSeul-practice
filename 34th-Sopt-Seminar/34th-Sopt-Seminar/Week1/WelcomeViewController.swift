//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/2/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let rabbitImage: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        img.image = UIImage(resource: .danggeun)
        return img
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 105, height: 60))
        label.textColor = UIColor(resource: .black)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "???님\n반가워요!"
        label.font = UIFont.pretendard(.head1)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(resource: .primaryOrange)
        button.layer.cornerRadius = 6
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor(resource: .white), for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        return button
    }()
    
    private lazy var reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(resource: .grey200)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(resource: .grey300), for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        return button
    }()
    
    
    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        [rabbitImage, welcomeLabel, mainButton, reloginButton].forEach {
            self.view.addSubview($0)
        }
        bingID()
    }
    
    private func bingID() {
        guard let idText = id else {return}
        self.welcomeLabel.text = "\(idText)님\n반가워요!"

//        if idText = id {
//            self. welcomeLabel.text = "\(idText)님\n반가워요!"
//        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
