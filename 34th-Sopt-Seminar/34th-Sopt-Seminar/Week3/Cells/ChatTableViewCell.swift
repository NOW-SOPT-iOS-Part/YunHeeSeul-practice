//
//  ChatTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/20/24.
//

import UIKit

import SnapKit

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setHierarchy()
        setLayout()
        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileImageView: UIImageView = {
      let imgView = UIImageView()
    imgView.layer.borderWidth = 0.5
    imgView.layer.cornerRadius = 20
    imgView.layer.borderColor = UIColor(resource: .grey400).cgColor
    imgView.contentMode = .scaleAspectFill
    imgView.clipsToBounds = true
    imgView.image = UIImage(resource: .cat1)
    return imgView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "유니슬"
        label.textColor = UIColor(resource: .black)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendard(.subhead1)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "00동"
        label.textColor = UIColor(resource: .grey400)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendard(.info12)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕 나 00년생 유니슬ㅋ"
        label.textColor = UIColor(resource: .black)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendard(.subhead5)
        return label
    }()
    
    let subImageView: UIImageView = {
      let imgView = UIImageView()
        imgView.layer.cornerRadius = 4
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(resource: .cat2)
        return imgView
    }()

    
    private func setHierarchy() {
        self.addSubviews(profileImageView,
                         nicknameLabel,
                         locationLabel,
                         titleLabel,
                         subImageView)
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(40)
            $0.centerY.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(nicknameLabel)
            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(4)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        subImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(40)
            $0.centerY.equalToSuperview()
        }
    }
    
}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nicknameLabel.text = chatData.name
        locationLabel.text = chatData.place
        titleLabel.text = chatData.message
        subImageView.image = chatData.itemImg
    }
}
