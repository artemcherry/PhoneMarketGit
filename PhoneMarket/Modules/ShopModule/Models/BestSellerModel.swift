//
//  BestSellerModel.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

struct BestSellerModel: Codable {
    let id: Int?
    let isFavorite: Bool?
    let title: String?
    let priceWithoutDiscount: Int?
    let discountPrice: Int?
    let picture: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, picture
        case isFavorite = "is_favorites"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
    }
}
