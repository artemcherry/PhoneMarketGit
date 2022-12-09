//
//  HotSaleModel.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

struct HotSaleModel: Codable {
    let id: Int?
    let isNew: Bool?
    let title: String?
    let subtitle: String?
    let picture: String?
    let isBuy: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle, picture
        case isNew = "is_new"
        case isBuy = "is_buy"
    }
}
