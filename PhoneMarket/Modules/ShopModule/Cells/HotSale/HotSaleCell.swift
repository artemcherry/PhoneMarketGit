//
//  HotSaleCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

protocol HotSaleCellDelegate: AnyObject {
    func openProduct()
}

final class HotSaleCell: UITableViewCell {
    
    static let identifier = "HotSalesCell"
    
    var delegate: HotSaleCellDelegate?
    
    private lazy var hotSaleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40), height: 190)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 25
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HotSaleCollectionCell.self, forCellWithReuseIdentifier: HotSaleCollectionCell.identifier)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        return collection
    }()
    
    var viewModel = [HotSaleModel]()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear

        contentView.addSubview(hotSaleCollectionView)
        NSLayoutConstraint.activate([
            hotSaleCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hotSaleCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hotSaleCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hotSaleCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        hotSaleCollectionView.dataSource = self
        hotSaleCollectionView.delegate = self
    }
   
}

//MARK: UICollectionViewDataSource

extension HotSaleCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSaleCollectionCell.identifier, for: indexPath) as? HotSaleCollectionCell else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel[indexPath.row])
        cell.backgroundColor = .clear

        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension HotSaleCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openProduct()
    }
}
