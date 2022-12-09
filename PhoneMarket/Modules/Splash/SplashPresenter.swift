//
//  SplashPresenter.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    func openShop()
}

final class SplashVPresenter: SplashPresenterProtocol {
    
    private let view: SplashViewControllerProtocol
    private let router: MainRouterProtocol
    private let interactor: SplashInteractorProtocol
    private let networkService = NetworkService()
    
    init(view: SplashViewControllerProtocol, router: MainRouterProtocol, interactor: SplashInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func openShop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.router.shop()

        }
    }
}
