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
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "???님\n반가워요!"
        label.font = UIFont.pretendard(.head1_extraBold)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 1, green: 0.435, blue: 0.059, alpha: 1)
        button.layer.cornerRadius = 6
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.pretendard(.body1_bold)
        return button
    }()
    
    private lazy var reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 0.867, green: 0.871, blue: 0.89, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 0.675, green: 0.69, blue: 0.725, alpha: 1), for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.body1_bold)
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
