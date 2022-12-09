//
//  CartTableCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 09.12.2022.
//

import UIKit
import SnapKit

final class CartTableCell: UITableViewCell {
    
    static let identifier = "CartTableCell"
    
    private lazy var containerView = UIView()
    private lazy var productImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var stepperView = UIView()
    private lazy var binImageView = UIImageView(image: UIImage(named: "binImage"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with model: PhoneModel) {
        self.productImageView.load(urlString: model.images[0])
        titleLabel.text = model.title
        priceLabel.text = "$\(model.price)"
    }
    
    private func setupUI() {
        addContainerView()
        addProductImageView()
        addTitleLabel()
        addPriceLabel()
        addBinImageView()
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
    
    private func addProductImageView() {
        containerView.addSubview(productImageView)
        productImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        productImageView.layer.cornerRadius = 15
        productImageView.clipsToBounds = true
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(4)
            $0.top.equalToSuperview()
            $0.height.lessThanOrEqualToSuperview()
        }
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private func addPriceLabel() {
        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(4)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.height.lessThanOrEqualToSuperview()
        }
        priceLabel.textColor = .accentColor
        priceLabel.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private func addBinImageView() {
        containerView.addSubview(binImageView)
        binImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(15)
        }
    }
}
