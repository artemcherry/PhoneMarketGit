//
//  HotSaleCollectionCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 06.12.2022.
//

import UIKit

final class HotSaleCollectionCell: UICollectionViewCell {
    
    static let identifier = "HotSaleCollectionCell"
    
    private lazy var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var buyNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .bold)
        button.tintColor = .themeColor
        button.setTitle("Buy now!", for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var newLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addPhoneImageView()
        addTitleLabel()
        addDescriptionLabel()
        addBuyNowButton()
    }
    
    private func addPhoneImageView() {
        contentView.addSubview(phoneImageView)
        NSLayoutConstraint.activate([
            phoneImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            phoneImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            phoneImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            phoneImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        phoneImageView.layer.cornerRadius = 15
        phoneImageView.clipsToBounds = true
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: phoneImageView.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: phoneImageView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: phoneImageView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func addDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: phoneImageView.leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: phoneImageView.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func addBuyNowButton() {
        contentView.addSubview(buyNowButton)
        NSLayoutConstraint.activate([
            buyNowButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 26),
            buyNowButton.leadingAnchor.constraint(equalTo: phoneImageView.leadingAnchor, constant: 32),
            buyNowButton.widthAnchor.constraint(equalToConstant: 98),
            buyNowButton.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        buyNowButton.layer.cornerRadius = 5
    }
    
    private func addNewView() {
        contentView.addSubview(newLabel)
        
        NSLayoutConstraint.activate([
            newLabel.topAnchor.constraint(equalTo: phoneImageView.topAnchor, constant: 20),
            newLabel.leadingAnchor.constraint(equalTo: phoneImageView.leadingAnchor, constant: 20),
            newLabel.heightAnchor.constraint(equalToConstant: 27),
            newLabel.widthAnchor.constraint(equalToConstant: 27)
        ])
        
        newLabel.layer.cornerRadius = 13.5
        newLabel.clipsToBounds = true
        newLabel.backgroundColor = .accentColor
        newLabel.text = "New"
        newLabel.font = .systemFont(ofSize: 10, weight: .bold)
        newLabel.textColor = .white
        
    }
    
    func configureCell(with model: HotSaleModel) {
        self.titleLabel.text = model.title ?? ""
        self.descriptionLabel.text = model.subtitle
        self.phoneImageView.load(urlString: model.picture ?? "")
        if model.isNew ?? false {
            addNewView()
        }
    }
}
