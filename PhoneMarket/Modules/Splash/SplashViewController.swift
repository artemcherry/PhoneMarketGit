//
//  SplashViewController.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
}

final class SplashViewController: UIViewController, SplashViewControllerProtocol {
    
    private lazy var logoBackGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .accentColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var logoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 2
        label.text = "Ecommerce Concept"
        label.textColor = .white
        return label
    }()
    
    var presenter: SplashPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.openShop()
    }
    

    
    private func setupUI() {
        view.backgroundColor = .themeColor
        addLogoBackgroundView()
        addLogoTitleLabel()
    }

    private func addLogoBackgroundView() {
        view.addSubview(logoBackGroundView)
        NSLayoutConstraint.activate([
            logoBackGroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoBackGroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoBackGroundView.heightAnchor.constraint(equalToConstant: 132),
            logoBackGroundView.widthAnchor.constraint(equalToConstant: 132)
        ])
        logoBackGroundView.layer.cornerRadius = 66
        logoBackGroundView.layer.masksToBounds = true
    }
    
    private func addLogoTitleLabel() {
        view.addSubview(logoTitleLabel)
        NSLayoutConstraint.activate([
            logoTitleLabel.topAnchor.constraint(equalTo: logoBackGroundView.topAnchor, constant: 32),
            logoTitleLabel.leadingAnchor.constraint(equalTo: logoBackGroundView.leadingAnchor, constant: 34),
            logoTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            logoTitleLabel.bottomAnchor.constraint(equalTo: logoBackGroundView.bottomAnchor, constant: -20)
        ])
    }
    
}

