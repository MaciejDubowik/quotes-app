//
//  AppCoordinator.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 27/05/2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get}
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    private let navigationController = UINavigationController()
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let quotesCoordinator = QuotesCoordinator(navigationController: navigationController)
        quotesCoordinator.start()
        childCoordinators.append(quotesCoordinator)
    }
}
