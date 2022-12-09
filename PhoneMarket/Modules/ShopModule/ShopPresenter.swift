//
//  ShopPresenter.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

protocol ShopPresenterProtocol: AnyObject {
    func viewDidLoad()
    func openDescrition()
    
}

final class ShopPresenter: ShopPresenterProtocol {
    
    private let view: ShopViewControllerProtocol
    private let router: MainRouterProtocol
    private let interactor: ShopInteractorProtocol
    private var categories = [CategoryModel]()
    private var hotSales = [HotSaleModel]()
    
    init(view: ShopViewControllerProtocol, router: MainRouterProtocol, interactor: ShopInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getCategories()
        getHotSales()
        getBestSellers()
    }

    private func getCategories() {
        self.categories = self.interactor.getCategories()
        self.view.updateCategories(with: categories)
    }
    
    private func getHotSales() {
        self.interactor.getHotSales { hotSales, error in
            if let hotSales = hotSales {
                self.view.updateHotSales(with: hotSales)
            } else {
                print("fail")
            }
        }
    }
    
    private func getBestSellers() {
        self.interactor.getBestSellers { bestSellers, error in
            if let bestSellers = bestSellers {
                self.view.updateBestSellers(with: bestSellers)
            } else {
                print("Fail")
            }
        }
    }
    
    func openDescrition() {
        self.interactor.getProductDescription {[weak self] phone in
            self?.router.productDescription(product: phone)

        }
    }
}
