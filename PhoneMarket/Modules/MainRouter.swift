//
//  MainRouter.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func splash()
    func shop()
    func productDescription(product: PhoneModel)
    func cart(products: [PhoneModel])
}

final class MainRouter: MainRouterProtocol {
    
    var navigationController: UINavigationController?
    private let mainBuilder: MainBuilderProtocol
    
    init(mainBuilder: MainBuilderProtocol) {
        self.mainBuilder = mainBuilder
    }
    
    func splash() {
        let viewController = mainBuilder.createSplashModule(router: self)
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    func shop() {
        let viewController = mainBuilder.createShopModule(router: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func productDescription(product: PhoneModel) {
        let viewController = mainBuilder.createProductDescriptionModule(router: self, product: product)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func cart(products: [PhoneModel]) {
        let viewController = mainBuilder.createCartModule(products: products)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
