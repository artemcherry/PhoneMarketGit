//
//  CartPresenter.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 09.12.2022.
//

import Foundation

protocol CartPresenterProtocol: AnyObject {
    func updateProducts()
    func getTotalPrice() -> Int
}

final class CartPresenter: CartPresenterProtocol {
    
    let view: CartViewControllerProtocol
    let products: [PhoneModel]
    
    init(view: CartViewControllerProtocol, products: [PhoneModel]) {
        self.view = view
        self.products = products
    }
    
    func updateProducts() {
        self.view.update(phoneCart: products)
    }
    
    func getTotalPrice() -> Int {
        let prices = products.map { $0.price }
        var total = 0
        for price in prices {
            total += price
        }
        return total
    }
}
