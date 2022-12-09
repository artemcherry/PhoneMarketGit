//
//  ProductDescriptionPresenter.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 08.12.2022.
//

import Foundation

protocol ProductDescriptionPresenterProtocol: AnyObject {
    func getProduct()
    func openCart(products: [PhoneModel])
}

final class ProductDescriptionPresenter: ProductDescriptionPresenterProtocol {
    
    let view: ProductDescriptionViewControllerProtocol
    let interactor: ProductDescriptionInteractorProtocol
    let router: MainRouterProtocol
    let product: PhoneModel
    
    init(view: ProductDescriptionViewControllerProtocol,
         interactor: ProductDescriptionInteractorProtocol,
         router: MainRouterProtocol,
         product: PhoneModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.product = product
    }
    
    func getProduct() {
        self.view.updatePhoneDescription(with: product)
    }
    
    func openCart(products: [PhoneModel]) {
        self.router.cart(products: products)
    }
}
