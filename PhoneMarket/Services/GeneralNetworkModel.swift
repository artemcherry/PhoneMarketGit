//
//  GeneralNetworkModel.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

struct GeneralNetworkModel: Codable {
    let hotSales: [HotSaleModel]?
    let bestSellers: [BestSellerModel]?
    
    enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSellers = "best_seller"
    }
}
