//
//  BestSellerCollectionCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 06.12.2022.
//

import UIKit

final class BestSellerCollectionCell: UICollectionViewCell {
    
    static let identifier = "BestSellerCollectionCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var priceWithDiscountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .themeColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceWithoutDiscountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .themeColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with model: BestSellerModel) {
        self.titleLabel.text = model.title
        self.priceWithDiscountLabel.text = "$\(model.discountPrice ?? 0)"
        
        let attributeString:NSMutableAttributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "$ \(model.priceWithoutDiscount ?? 0)"))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        priceWithoutDiscountLabel.attributedText = attributeString
        
        productImageView.load(urlString: model.picture ?? "")
        
        likeImageView.image = model.isFavorite ?? false ? UIImage(named: "like") : UIImage(named: "unlike")
    }
    
    private func setupUI() {
        addContainerView()
        addProductImageView()
        addLikeImageView()
        addPriceWithDiscountLabel()
        addPriceWithoutDiscountLabel()
        addTitleLabel()
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        containerView.backgroundColor = .white
    }
    
    private func addProductImageView() {
        containerView.addSubview(productImageView)
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60)
        ])
    }
    
    private func addLikeImageView() {
        containerView.addSubview(likeImageView)
        NSLayoutConstraint.activate([
            likeImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 11),
            likeImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            likeImageView.heightAnchor.constraint(equalToConstant: 35),
            likeImageView.widthAnchor.constraint(equalToConstant: 35),
        ])
        containerView.bringSubviewToFront(likeImageView)
    }
    
    private func addPriceWithDiscountLabel() {
        containerView.addSubview(priceWithDiscountLabel)
        NSLayoutConstraint.activate([
            priceWithDiscountLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 7),
            priceWithDiscountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            priceWithDiscountLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor),
            priceWithDiscountLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -33)
        ])
    }
    
    private func addPriceWithoutDiscountLabel() {
        containerView.addSubview(priceWithoutDiscountLabel)
        NSLayoutConstraint.activate([
            priceWithoutDiscountLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 7),
            priceWithoutDiscountLabel.leadingAnchor.constraint(equalTo: priceWithDiscountLabel.trailingAnchor, constant: 7),
            priceWithoutDiscountLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor),
            priceWithoutDiscountLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -33)
        ])
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: priceWithDiscountLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor)
        ])
    }
}
