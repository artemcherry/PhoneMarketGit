//
//  CustomHeaderView.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

final class CustomHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "CustomHeaderView"
    
    private lazy var headerTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var headerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .accentColor
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitles(title: String, buttonTitle: String) {
        self.headerTitle.text = title
        self.headerButton.setTitle(buttonTitle, for: .normal)
    }
    
    private func setupUI() {        
        contentView.addSubview(headerTitle)
        contentView.addSubview(headerButton)
        
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            headerTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headerTitle.widthAnchor.constraint(equalToConstant: 200),
            headerTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            
            headerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            headerButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headerButton.widthAnchor.constraint(equalToConstant: 70),
            headerButton.heightAnchor.constraint(lessThanOrEqualToConstant: 40)
        
        ])
    }
}
