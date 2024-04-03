//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/2/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let rabbitImage: UIImageView = {
        let img = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 112,
                                            y: UIScreen.main.bounds.height / 812 * 87,
                                            width: UIScreen.main.bounds.width / 375 * 150,
                                            height: UIScreen.main.bounds.height / 812 * 150))
        img.image = UIImage(resource: .danggeun)
        return img
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 140,
                                          y: UIScreen.main.bounds.height / 812 * 295,
                                          width: UIScreen.main.bounds.width / 375 * 105,
                                          height: UIScreen.main.bounds.height / 812 * 60))
        label.textColor = UIColor(resource: .black)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "???님\n반가워요!"
        label.font = UIFont.pretendard(.head1)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 20,
                                            y: UIScreen.main.bounds.height / 812 * 426,
                                            width: UIScreen.main.bounds.width / 375 * 335,
                                            height: UIScreen.main.bounds.height / 812 * 58))
        button.backgroundColor = UIColor(resource: .primaryOrange)
        button.layer.cornerRadius = 6
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor(resource: .white), for: .normal)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        return button
    }()
    
    private lazy var reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 375 * 20,
                                            y: UIScreen.main.bounds.height / 812 * 498,
                                            width: UIScreen.main.bounds.width / 375 * 335,
                                            height: UIScreen.main.bounds.height / 812 * 58))
        button.backgroundColor = UIColor(resource: .grey200)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(resource: .grey300), for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        return button
    }()
    
    // MARK: - Properties
    
    var id: String?
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setStyle()
        bingID()
    }
}


// MARK: - Private Methods

private extension WelcomeViewController {
    
    private func setLayout() {
        self.view.addSubviews(rabbitImage,
                              welcomeLabel,
                              mainButton,
                              reloginButton)
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func bingID() {
        guard let idText = id else {return}
        self.welcomeLabel.text = "\(idText)님\n반가워요!"
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
