//
//  QuotesCoordinator.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 27/05/2023.
//

import UIKit

final class QuotesCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    
    func start() {
        let quotesVC = QuotesViewController()
        quotesVC.coordinator = self
        navigationController.setViewControllers([quotesVC], animated: false)
    }
    
    func navigateToFavorites() {
        let favoritesCoordinator = FavoritesCoordinator(navigationController: navigationController)
        favoritesCoordinator.start()
        childCoordinators.append(favoritesCoordinator)
    }
    
}
