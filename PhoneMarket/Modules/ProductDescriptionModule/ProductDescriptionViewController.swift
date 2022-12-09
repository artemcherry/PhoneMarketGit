//
//  ProductDescriptionViewController.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 08.12.2022.
//

import UIKit
import SnapKit

protocol ProductDescriptionViewControllerProtocol: AnyObject {
    func updatePhoneDescription(with model: PhoneModel)
}
 
final class ProductDescriptionViewController: UIViewController, ProductDescriptionViewControllerProtocol {
    
    var presenter: ProductDescriptionPresenterProtocol?
    private var phoneDescription: PhoneModel?
    private var cartProducts = [PhoneModel]()
    
    private lazy var galleryCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 250, height: 350)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 60)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ImageGalleryCollectionCell.self, forCellWithReuseIdentifier: ImageGalleryCollectionCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        return collection
    }()
    
    private lazy var descriptionView: DescriptionView = {
       let view = DescriptionView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getProduct()
        setupUI()
        setupNavBar()
    }
    
    //MARK: - ProductDescriptionViewControllerProtocol
    
    func updatePhoneDescription(with model: PhoneModel) {
        self.phoneDescription = model
        galleryCollectionView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        addGalleryCollectionView()
        
        addDescriptionView()
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
        presenter?.openCart(products: cartProducts)
    }
    
    private func addGalleryCollectionView() {
        view.addSubview(galleryCollectionView)
        galleryCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.view.frame.height / 2)
        }
        galleryCollectionView.dataSource = self
    }
    
    private func addDescriptionView() {
        view.addSubview(descriptionView)
        descriptionView.snp.makeConstraints {
            $0.height.equalTo(self.view.frame.height / 2)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        descriptionView.backgroundColor = .white
        descriptionView.layer.cornerRadius = 30
        descriptionView.clipsToBounds = true
        if let phoneDescription = phoneDescription {
            descriptionView.updateView(with: phoneDescription)
        }
        descriptionView.delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension ProductDescriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        phoneDescription?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageGalleryCollectionCell.identifier, for: indexPath) as? ImageGalleryCollectionCell else { return UICollectionViewCell() }
        cell.loadImage(urlString: phoneDescription?.images[indexPath.row] ?? "")
        return cell
    }
}

//MARK: - DescriptionViewDelegate
extension ProductDescriptionViewController: DescriptionViewDelegate {
    func addToCartPressed() {
        guard let product = phoneDescription else { return }
        self.cartProducts.append(product)
        let alertVC = UIAlertController(title: "Success", message: "Added to your cart", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true)
    }
}
