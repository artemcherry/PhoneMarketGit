//
//  CategoryCollectionCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

final class CategoryCollectionCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionCell"
    
    private lazy var imageContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .themeColor
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addImageView()
        addTitleLabel()
    }
    
    private func addImageView() {
       contentView.addSubview(imageContainerView)
      
        NSLayoutConstraint.activate([
            imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 71)
        ])
        imageContainerView.layer.cornerRadius = 35.5
        
        imageContainerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
        ])
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 7),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
    func configureCell(with model: CategoryModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.imageName)
    }
    
    func didSelect() {
        self.imageContainerView.backgroundColor = .accentColor
        self.titleLabel.textColor = .accentColor
    }
    
    func didDeselect() {
        self.imageContainerView.backgroundColor = .white
        self.titleLabel.textColor = .themeColor
    }
}

