//
//  QuotesViewController.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 15/05/2023.
//

import UIKit

class QuotesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupNavbar()
        setupAutoLayout()
    }
    
    func setupNavbar(){
        view.addSubview(navbarView)
        navbarStackView.addArrangedSubview(navbarQuotesButton)
        navbarStackView.addArrangedSubview(navbarFavoritesButton)
//        navbarStackView.addArrangedSubview(navbarProfileButton)
        navbarView.addSubview(navbarStackView)
    }
    
    func setupAutoLayout() {
        navbarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navbarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navbarView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        navbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
        
        navbarStackView.leftAnchor.constraint(equalTo: navbarView.leftAnchor).isActive = true
        navbarStackView.rightAnchor.constraint(equalTo: navbarView.rightAnchor).isActive = true
        navbarStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
        
    private let navbarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let navbarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        return stackView
    }()
    
    private static func navbarButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.tintColor = .systemGray
        return button
    }

    private let navbarQuotesButton: UIButton = {
        return navbarButton(title: "Quotes")
    }()

    private let navbarFavoritesButton: UIButton = {
        return navbarButton(title: "Favorites")
    }()

    private let navbarProfileButton: UIButton = {
        return navbarButton(title: "Profile")
    }()
}
