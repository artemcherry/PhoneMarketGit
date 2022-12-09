//
//  BestSellerCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit


final class BestSellerCell: UITableViewCell {
    
    static let identifier = "BestSellerCell"
    
    private lazy var bestSellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ((UIScreen.main.bounds.width - 46) / 2), height: 210)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumInteritemSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(BestSellerCollectionCell.self, forCellWithReuseIdentifier: BestSellerCollectionCell.identifier)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    var viewModel = [BestSellerModel]()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.addSubview(bestSellerCollectionView)
        NSLayoutConstraint.activate([
            bestSellerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bestSellerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bestSellerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bestSellerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension BestSellerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionCell.identifier, for: indexPath) as? BestSellerCollectionCell else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension BestSellerCell: UICollectionViewDelegate {

    
}
