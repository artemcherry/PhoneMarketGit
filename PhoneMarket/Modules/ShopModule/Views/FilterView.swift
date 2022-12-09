//
//  FilterView.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 07.12.2022.
//

import UIKit

final class FilterView: UIView {
    
    var closeButtonAction: (() -> Void)?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filter options"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .themeColor
        return label
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        return button
    }()
    
    private lazy var brandFilter = filterField(title: "Brand", placeholder: "  Samsung")
    private lazy var priceFilter = filterField(title: "Price", placeholder: "  $300 - $500")
    private lazy var sizeFilter = filterField(title: "Size", placeholder: "  4.5 to 5.5 inches")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addContainerView()
        addCrossButton()
        addTitleLabel()
        addDoneButton()
        addFilters()
    }
    
    private func addContainerView() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addCrossButton() {
        containerView.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 37),
            closeButton.widthAnchor.constraint(equalToConstant: 37)
        ])
        closeButton.backgroundColor = .themeColor
        closeButton.layer.cornerRadius = 10
        closeButton.setImage(UIImage(named: "cross"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 37)
        ])
        titleLabel.textAlignment = .center
    }
    
    private func addDoneButton() {
        containerView.addSubview(applyButton)
        NSLayoutConstraint.activate([
            applyButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            applyButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            applyButton.heightAnchor.constraint(equalToConstant: 37),
            applyButton.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        applyButton.setTitle("Done", for: .normal)
        applyButton.tintColor = .white
        applyButton.backgroundColor = .accentColor
        applyButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        applyButton.layer.cornerRadius = 10
    }
    
    private func addFilters() {
        containerView.addSubview(brandFilter)
        containerView.addSubview(priceFilter)
        containerView.addSubview(sizeFilter)
        
        NSLayoutConstraint.activate([
            brandFilter.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            brandFilter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            brandFilter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            brandFilter.heightAnchor.constraint(equalToConstant: 60),
            
            priceFilter.topAnchor.constraint(equalTo: brandFilter.bottomAnchor, constant: 20),
            priceFilter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            priceFilter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            priceFilter.heightAnchor.constraint(equalToConstant: 60),
            
            sizeFilter.topAnchor.constraint(equalTo: priceFilter.bottomAnchor, constant: 10),
            sizeFilter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            sizeFilter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            sizeFilter.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
    
    private func filterField(title: String, placeholder: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .themeColor
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel.text = title
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        let filterLabel = UILabel()
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.textColor = .themeColor
        filterLabel.font = .systemFont(ofSize: 18, weight: .regular)
        filterLabel.text = placeholder
        filterLabel.layer.borderWidth = 1
        filterLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(filterLabel)
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            filterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        return view
    }
    
    @objc
    private func closeButtonTapped() {
        closeButtonAction?()
    }
}
