//
//  ItemCollectionViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/20/24.
//

import UIKit

protocol ItemCollectoinViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemCollectionViewCell"
    var itemRow: Int?
    
    weak var delegate: ItemCollectoinViewCellDelegate?
    
    private let itemImageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.heart, for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setHierarchy()
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.heartButton.isSelected = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        
        contentView.addSubviews(itemImageView,
                                nameLabel,
                                priceLabel,
                                heartButton)
    }
    
    private func setLayout() {
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
    
    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(
                state: self.heartButton.isSelected,
                row: itemRow
            )
        }
    }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text =  itemData.price
        heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
}
