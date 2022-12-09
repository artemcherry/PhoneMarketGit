//
//  ShopInteractor.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

protocol ShopInteractorProtocol: AnyObject {
    func getCategories() -> [CategoryModel]
    func getHotSales(completion: @escaping([HotSaleModel]?, Error?) -> Void)
    func getBestSellers(completion: @escaping([BestSellerModel]?, Error?) -> Void)
    func getProductDescription(completion: @escaping (PhoneModel) -> Void)

}

final class ShopInteractor: ShopInteractorProtocol {
    
    private let networkService = NetworkService()
    
    private let categories = [ CategoryModel(title: "Phones", imageName: "phones"),
                               CategoryModel(title: "Computers", imageName: "computers"),
                               CategoryModel(title: "Health", imageName: "health"),
                               CategoryModel(title: "Books", imageName: "books"),
                               CategoryModel(title: "Phones", imageName: "phones")
    ]
    
    func getCategories() -> [CategoryModel] {
        return categories
    }
    
    func getHotSales(completion: @escaping([HotSaleModel]?, Error?) -> Void) {
        let urlString = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        networkService.getProducts(urlString: urlString) { networkModel, error in
            if let networkModel = networkModel,
               let hotSalesModel = networkModel.hotSales{
                DispatchQueue.main.async {
                    completion(hotSalesModel, nil)
                }
            } else {
                print("Fail")
            }
        }
    }
    
    func getBestSellers(completion: @escaping ([BestSellerModel]?, Error?) -> Void) {
        let urlString = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        networkService.getProducts(urlString: urlString) { networkModel, error in
            if let networkModel = networkModel,
               let hotSalesModel = networkModel.bestSellers{
                DispatchQueue.main.async {
                    completion(hotSalesModel, nil)
                }
            } else {
                print("Fail")
            }
        }
    }
    
    func getProductDescription(completion: @escaping (PhoneModel) -> Void) {
        let urlString = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        networkService.getProductDescription(urlString: urlString) { phoneModel, error in
            if let phoneModel = phoneModel {
                completion(phoneModel)
            } else {
                let error = NSError()
                print(error.localizedDescription)
            }
        }
    }
}
