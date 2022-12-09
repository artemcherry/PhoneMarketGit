//
//  AppDelegate.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainMudiler = MainBuilder()
        let router = MainRouter(mainBuilder: mainMudiler)
        let rootVC = mainMudiler.createSplashModule(router: router)
        let navigationController = UINavigationController(rootViewController: rootVC)
        router.navigationController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

