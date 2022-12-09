//
//  DescriptionView.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 08.12.2022.
//

import UIKit
import SnapKit

protocol DescriptionViewDelegate: AnyObject {
    func addToCartPressed()
}

final class DescriptionView: UIView {
    
    private lazy var containerView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var likeImageView = UIImageView(image: UIImage(named: "likeImage"))
    private lazy var ratingImageView = UIImageView(image: UIImage(named: "rating"))
    private lazy var typesImageView = UIImageView(image: UIImage(named: "types"))
    private lazy var parametersImageView = UIImageView(image: UIImage(named: "parameters"))
    private lazy var selectLabel = UILabel()
    private lazy var color1 = UIView()
    private lazy var color2 = UIView()
    private lazy var capacity1 = UILabel()
    private lazy var capacity2 = UILabel()
    private lazy var addToCartButton = UIButton(type: .system)
    
    var viewModel: PhoneModel?
    var delegate: DescriptionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with model: PhoneModel) {
        titleLabel.text = model.title
        color1.backgroundColor = UIColor(hexString: model.color[0])
        color2.backgroundColor = UIColor(hexString: model.color[1])
        capacity1.text = model.capacity[0]
        capacity2.text = model.capacity[1]
        addToCartButton.setTitle("Add to cart   $\(model.price)", for: .normal)
    }
    
    private func setupUI() {
        addContainerView()
        addTitleLabel()
        addLikeImageView()
        addRatingImageView()
        addTypesImageView()
        addParametesImageView()
        addSelectLabel()
        addColor1()
        addColor2()
        addCapacity2()
        addCapacity1()
        addAddToCartButton()
    }
    
    private func addContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.width.lessThanOrEqualToSuperview()
        }
        titleLabel.textColor = .themeColor
        titleLabel.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    private func addLikeImageView() {
        containerView.addSubview(likeImageView)
        likeImageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(37)
            $0.height.equalTo(33)
        }
    }
    
    private func addRatingImageView() {
        containerView.addSubview(ratingImageView)
        ratingImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(18)
            $0.width.equalTo(126)
        }
    }
    
    private func addTypesImageView() {
        containerView.addSubview(typesImageView)
        typesImageView.snp.makeConstraints {
            $0.height.equalTo(33)
            $0.width.equalTo(347)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(ratingImageView.snp.bottom).offset(20)
        }
    }
    
    private func addParametesImageView() {
        containerView.addSubview(parametersImageView)
        parametersImageView.snp.makeConstraints {
            $0.height.equalTo(47)
            $0.width.equalTo(344)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(typesImageView.snp.bottom).offset(20)
        }
    }
    
    private func addSelectLabel() {
        containerView.addSubview(selectLabel)
        selectLabel.snp.makeConstraints {
            $0.top.equalTo(parametersImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(47)
        }
        selectLabel.text = "Select color and capacity"
        selectLabel.textColor = .black
        selectLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private func addColor1() {
        containerView.addSubview(color1)
        color1.snp.makeConstraints {
            $0.top.equalTo(selectLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(40)
        }
        color1.layer.cornerRadius = 20
    }
    
    private func addColor2() {
        containerView.addSubview(color2)
        color2.snp.makeConstraints {
            $0.top.equalTo(selectLabel.snp.bottom).offset(10)
            $0.leading.equalTo(color1.snp.trailing).offset(20)
            $0.height.width.equalTo(40)
        }
        color2.layer.cornerRadius = 20
    }
    
    private func addCapacity1() {
        containerView.addSubview(capacity1)
        capacity1.snp.makeConstraints {
            $0.top.equalTo(selectLabel.snp.bottom).offset(20)
            $0.trailing.equalTo(capacity2.snp.leading).offset(-20)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        capacity1.font = .systemFont(ofSize: 13, weight: .bold)
        capacity1.textColor = .white
        capacity1.backgroundColor = .accentColor
        capacity1.textAlignment = .center
    }
    
    private func addCapacity2() {
        containerView.addSubview(capacity2)
        capacity2.snp.makeConstraints {
            $0.top.equalTo(selectLabel.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        capacity2.font = .systemFont(ofSize: 13, weight: .bold)
        capacity2.layer.cornerRadius = 10
        capacity2.textColor = .lightGray
        capacity2.textAlignment = .center
    }
    
    private func addAddToCartButton() {
        containerView.addSubview(addToCartButton)
        addToCartButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        addToCartButton.backgroundColor = .accentColor
        addToCartButton.layer.cornerRadius = 15
        addToCartButton.tintColor = .white
        addToCartButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        addToCartButton.addTarget(self, action: #selector(addToCartPressed), for: .touchUpInside)
    }
    
    @objc
    private func addToCartPressed() {
        delegate?.addToCartPressed()
    }
}

