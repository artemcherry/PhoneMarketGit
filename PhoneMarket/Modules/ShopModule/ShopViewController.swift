//
//  MainViewController.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

protocol ShopViewControllerProtocol: AnyObject {
    func updateCategories(with categories: [CategoryModel])
    func updateHotSales(with hotSales: [HotSaleModel])
    func updateBestSellers(with bestSellers: [BestSellerModel])
}

final class ShopViewController: UIViewController, ShopViewControllerProtocol {
    
    private lazy var shopTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
        table.register(HotSaleCell.self, forCellReuseIdentifier: HotSaleCell.identifier)
        table.register(BestSellerCell.self, forCellReuseIdentifier: BestSellerCell.identifier)
        table.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
        table.backgroundColor = .clear
        return table
    }()
    
    private lazy var customTabBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .themeColor
        return view
    }()
    
    private lazy var explorerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "· Explorer"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        return label
        
    }()
    
    private lazy var cartButton = createButton(imageName: "cart")
    private lazy var favouriteButton = createButton(imageName: "favorite")
    private lazy var personButton = createButton(imageName: "person")
    
    private lazy var filterView: FilterView = {
       let view = FilterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var categories: [CategoryModel]?
    private var hotSales: [HotSaleModel]?
    private var bestSellers: [BestSellerModel]?
    var presenter: ShopPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        navigationBarUpdate()
        addShopTableView()
        addCustomTabBarView()
    }
    
    private func addShopTableView() {
        view.addSubview(shopTableView)
        NSLayoutConstraint.activate([
            shopTableView.topAnchor.constraint(equalTo: view.topAnchor),
            shopTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        shopTableView.delegate = self
        shopTableView.dataSource = self
    }
    
    private func addCustomTabBarView() {
        view.addSubview(customTabBarView)
        NSLayoutConstraint.activate([
            customTabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            customTabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBarView.heightAnchor.constraint(equalToConstant: 72)
        ])
        
        customTabBarView.layer.cornerRadius = 32
        customTabBarView.layer.masksToBounds = true
        
        addExplorerLabel()
        addButtons()
    }
    
    private func addExplorerLabel() {
        customTabBarView.addSubview(explorerLabel)
        NSLayoutConstraint.activate([
            explorerLabel.leadingAnchor.constraint(equalTo: customTabBarView.leadingAnchor, constant: 68),
            explorerLabel.centerYAnchor.constraint(equalTo: customTabBarView.centerYAnchor),
            explorerLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            explorerLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40)
        ])
    }

    private func addButtons() {
        [cartButton, favouriteButton, personButton].forEach { customTabBarView.addSubview($0) }
        NSLayoutConstraint.activate([
            cartButton.leadingAnchor.constraint(equalTo: explorerLabel.trailingAnchor, constant: 47),
            cartButton.centerYAnchor.constraint(equalTo: customTabBarView.centerYAnchor),
            cartButton.heightAnchor.constraint(equalToConstant: 18),
            cartButton.widthAnchor.constraint(equalToConstant: 18),
            
            favouriteButton.leadingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 52),
            favouriteButton.centerYAnchor.constraint(equalTo: customTabBarView.centerYAnchor),
            favouriteButton.heightAnchor.constraint(equalToConstant: 18),
            favouriteButton.widthAnchor.constraint(equalToConstant: 18),
            
            personButton.leadingAnchor.constraint(equalTo: favouriteButton.trailingAnchor, constant: 52),
            personButton.centerYAnchor.constraint(equalTo: customTabBarView.centerYAnchor),
            personButton.heightAnchor.constraint(equalToConstant: 18),
            personButton.widthAnchor.constraint(equalToConstant: 18),
        ])
    }
    
    private func createButton(imageName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func navigationBarUpdate() {
        let navLabel = UILabel()
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "location")
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 15, height: 12)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        
        let vectorDown = NSTextAttachment()
        vectorDown.image = UIImage(named: "vectorDown")
        let vectormageOffsetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0, y: vectormageOffsetY, width: vectorDown.image!.size.width, height: vectorDown.image!.size.height)
        let vectorString = NSAttributedString(attachment: vectorDown)
        
        
        let completeText = NSMutableAttributedString(string: "")
        let locationTitle = NSMutableAttributedString(string: "Zihuatanejo, Gro", attributes:[
            NSAttributedString.Key.foregroundColor: UIColor.themeColor as Any,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)])
        
        completeText.append(attachmentString)
        completeText.append(locationTitle)
        completeText.append(vectorString)
        
        navLabel.attributedText = completeText
        self.navigationItem.titleView = navLabel

        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(filterTapped))
        
    }
    
    @objc
    private func filterTapped() {
        addFilterView()
    }
    
    private func addFilterView() {
        view.addSubview(filterView)
        NSLayoutConstraint.activate([
            filterView.heightAnchor.constraint(equalToConstant: 375),
            filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        filterView.backgroundColor = .white
        
        filterView.layer.cornerRadius = 25
        filterView.clipsToBounds = true
        
        filterView.closeButtonAction = { [weak self] in
            self?.filterView.removeFromSuperview()
        }
    }
    
//MARK: - ShopViewControllerProtocol
    
    func updateCategories(with categories: [CategoryModel]) {
        self.categories = categories
    }
    
    func updateHotSales(with hotSales: [HotSaleModel]) {
        self.hotSales = hotSales
    }
    
    func updateBestSellers(with bestSellers: [BestSellerModel]) {
        self.bestSellers = bestSellers
        self.shopTableView.reloadData()
    }
}

//MARK: - UITableViewDataSource

extension ShopViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let customView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifier) as? CustomHeaderView else { return UIView() }
        
        switch section {
        case 0:
            customView.setupTitles(title: "Select category", buttonTitle: "view all")
            return customView
        case 1:
            customView.setupTitles(title: "Hot sales", buttonTitle: "see more")
            return customView
        default:
            customView.setupTitles(title: "Best seller", buttonTitle: "see more")
            return customView
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier,
                                                                for: indexPath) as? CategoryCell,
                  let categories = categories
            else { return UITableViewCell() }
            cell.viewModel = categories
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotSaleCell.identifier,
                                                                for: indexPath) as? HotSaleCell,
                    let hotSales = hotSales
            else { return UITableViewCell() }
            cell.viewModel = hotSales
            cell.delegate = self
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BestSellerCell.identifier,
                                                                for: indexPath) as? BestSellerCell,
                  let bestSellers = bestSellers
            else { return UITableViewCell() }
            cell.viewModel = bestSellers
            cell.backgroundColor = .clear
            cell.selectionStyle = .default
            return cell
        }
    
    }
}

//MARK: - UITableViewDelegate

extension ShopViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 200
        default
            :
            return 500
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap")
    }
}

//MARK: - BestSellerCellDelegate

extension ShopViewController: HotSaleCellDelegate {
    func openProduct() {
        self.presenter?.openDescrition()
    }
}
