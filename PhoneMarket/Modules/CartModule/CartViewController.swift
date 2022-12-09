//
//  CartViewController.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 09.12.2022.
//

import UIKit
import SnapKit

protocol CartViewControllerProtocol: AnyObject {
    func update(phoneCart: [PhoneModel])
}

final class CartViewController: UIViewController, CartViewControllerProtocol {
    
    private lazy var titleLabel = UILabel()
    private lazy var containerView = UIView()
    private lazy var cartTableView = UITableView()
    private lazy var totalView = UIView()
    private lazy var totalLabel = UILabel()
    private lazy var deliveryLabel = UILabel()
    private lazy var totalPriceLabel = UILabel()
    private lazy var deliveryFreeLabel = UILabel()
    private lazy var checkoutButton = UIButton(type: .system)
    private var products: [PhoneModel]?
    
    var presenter: CartPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.updateProducts()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        addTitleLabel()
        addContainerView()
        addCartTableView()
        addTotalView()
        setupNavBar()
    }
    
    func update(phoneCart: [PhoneModel]) {
        self.products = phoneCart
        guard let presenter = presenter else { return }
        totalPriceLabel.text = "$ \(presenter.getTotalPrice()) us"
        cartTableView.reloadData()
    }
    
    private func setupNavBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backImage"), style: .done, target: self, action: #selector(backButtonAction))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cartIcon"), style: .plain, target: self, action: #selector(openCart))
    }
    
    @objc
    private func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func openCart() {

    }
    
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(166)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(44)
        }
        titleLabel.text = "My Cart"
        titleLabel.font = .systemFont(ofSize: 35, weight: .bold)
        titleLabel.textColor = .themeColor
    }
    
    private func addContainerView() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        containerView.backgroundColor = .themeColor
        containerView.layer.cornerRadius = 25
    }
    
    private func addCartTableView() {
        containerView.addSubview(cartTableView)
        cartTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(370)
        }
        cartTableView.register(CartTableCell.self,
                               forCellReuseIdentifier: CartTableCell.identifier)
        
        cartTableView.dataSource = self
        cartTableView.backgroundColor = .clear
        cartTableView.delegate = self
        
    }
    
    private func addTotalView() {
        containerView.addSubview(totalView)
        totalView.snp.makeConstraints {
            $0.top.equalTo(cartTableView.snp.bottom).offset(5)
            $0.width.equalTo(self.view.frame.width + 10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(75)
        }
        totalView.backgroundColor = .clear
        totalView.layer.borderColor = UIColor.lightGray.cgColor
        totalView.layer.borderWidth = 2
        
        addTotalLabel()
        addDeliveryLabel()
        addTotalPriceLabel()
        addDeliveryFreeLabel()
    }
    
    private func addTotalLabel() {
        totalView.addSubview(totalLabel)
        totalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(20)
        }
        totalLabel.text = "Total"
        totalLabel.textColor = .white
        totalLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    private func addDeliveryLabel() {
        totalView.addSubview(deliveryLabel)
        deliveryLabel.snp.makeConstraints {
            $0.top.equalTo(totalLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(20)
        }
        deliveryLabel.text = "Delivery"
        deliveryLabel.textColor = .white
        deliveryLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    private func addTotalPriceLabel() {
        totalView.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(20)
        }
        totalPriceLabel.textColor = .white
        totalPriceLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    private func addDeliveryFreeLabel() {
        totalView.addSubview(deliveryFreeLabel)
        deliveryFreeLabel.snp.makeConstraints {
            $0.top.equalTo(totalPriceLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(20)
        }
        deliveryFreeLabel.text = "Free"
        deliveryFreeLabel.textColor = .white
        deliveryFreeLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
}

//MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableCell.identifier, for: indexPath) as? CartTableCell,
              let products = products
        else { return UITableViewCell() }
        cell.setupCell(with: products[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
}

//MARK: - UITableViewDelegate

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
