//
//  MainBuilder.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

protocol MainBuilderProtocol {
    func createSplashModule(router: MainRouterProtocol) -> UIViewController
    func createShopModule(router: MainRouterProtocol) -> UIViewController
    func createProductDescriptionModule(router: MainRouterProtocol, product: PhoneModel) -> UIViewController
    func createCartModule(products: [PhoneModel]) -> UIViewController
}

final class MainBuilder: MainBuilderProtocol {
    
    func createSplashModule(router: MainRouterProtocol) -> UIViewController {
        let view = SplashViewController()
        let ineractor = SplashInteractor()
        let presenter = SplashVPresenter(view: view, router: router, interactor: ineractor)
        view.presenter = presenter
        return view 
    }
    
    func createShopModule(router: MainRouterProtocol) -> UIViewController {
        let view = ShopViewController()
        let interactor = ShopInteractor()
        let presenter = ShopPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        return view
    }
    
    func createProductDescriptionModule(router: MainRouterProtocol, product: PhoneModel) -> UIViewController {
        let view = ProductDescriptionViewController()
        let interactor = ProductDescriptionInteractor()
        let presenter = ProductDescriptionPresenter(view: view, interactor: interactor, router: router, product: product)
        view.presenter = presenter
        return view
    }
    
    func createCartModule(products: [PhoneModel]) -> UIViewController {
        let view = CartViewController()
        let presenter = CartPresenter(view: view, products: products)
        view.presenter = presenter
        return view
    }
}
