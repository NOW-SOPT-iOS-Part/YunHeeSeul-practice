//
//  WelcomeViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/6/24.
//

import UIKit

import SnapKit

protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

class WelcomeViewController_DelegatePattern: UIViewController {
    
    // MARK: - UI Properties
    
    private let rabbitImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(resource: .danggeun)
        return img
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(resource: .black)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "???님\n반가워요!"
        label.font = UIFont.pretendard(.head1)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(resource: .primaryOrange)
        button.layer.cornerRadius = 6
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor(resource: .white), for: .normal)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.pretendard(.subhead1)
        return button
    }()
    
    lazy var reloginButton: UIButton = {
        let button = UIButton()
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
    
    weak var delegate: DataBindProtocol?
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setStyle()
        bingID()
    }
}


// MARK: - Private Methods

private extension WelcomeViewController_DelegatePattern {
    
    func setLayout() {
        self.view.addSubviews(rabbitImage,
                              welcomeLabel,
                              mainButton,
                              reloginButton)
        
        rabbitImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(150)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(rabbitImage.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(71)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(60)
        }
        
        reloginButton.snp.makeConstraints {
            $0.top.equalTo(mainButton.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(60)
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
    }
    
    func bingID() {
        guard let idText = id else {return}
        self.welcomeLabel.text = "\(idText)님\n반가워요!"
    }
    
    @objc
    func backToLoginButtonDidTap() {
        if let id  = id {
            delegate?.dataBind(id: id)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
