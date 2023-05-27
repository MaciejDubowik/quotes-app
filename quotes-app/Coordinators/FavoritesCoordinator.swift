//
//  FavoritesCoordinator.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 27/05/2023.
//

import UIKit

final class FavoritesCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let favoritesVC = FavoritesViewController()
        navigationController.pushViewController(favoritesVC, animated: false)
        
    }

}
