//
//  ImageGalleryCollectionCell.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 08.12.2022.
//

import UIKit
import SnapKit

final class ImageGalleryCollectionCell: UICollectionViewCell {
    
    static let identifier = "ImageGalleryCollectionCell"
    
    private lazy var containerView = UIView()
    private lazy var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
        containerView.layer.cornerRadius = 20
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        containerView.layer.shouldRasterize = true
        containerView.clipsToBounds = true
        
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func loadImage(urlString: String) {
        imageView.load(urlString: urlString)
    }
}
 
