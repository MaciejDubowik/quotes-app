//
//  FavoriteViewController.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 15/05/2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    private let favoritesQuotes: [Quote] = [Quote(quote: "Inside every adult there\'s still a child that lingers. We\'re happiness merchants - giving people the opportunity to dream like children.", author: "Guy Laliberte", category: "happiness"), Quote(quote: "Man is fond of counting his troubles, but he does not count his joys. If he counted them up as he ought to, he would see that every lot has enough happiness provided for it.", author: "Fyodor Dostoevsky", category: "happiness")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupFavoritesTableView()
        setupTopBar()
        setupAutoLayout()
        print(favoritesQuotes.count)
        print(QuoteCell.id)
    }
    
    func setupTopBar(){
        view.addSubview(topView)
        topView.addSubview(headerLabel)
    }
    
    func setupFavoritesTableView(){
        view.addSubview(favoritesTableView)
        self.favoritesTableView.delegate = self
        self.favoritesTableView.dataSource = self
    }
    
    func setupNavbar(){
        view.addSubview(navbarView)
        navbarStackView.addArrangedSubview(navbarQuotesButton)
        navbarStackView.addArrangedSubview(navbarFavoritesButton)
        //        navbarStackView.addArrangedSubview(navbarProfileButton)
        navbarView.addSubview(navbarStackView)
    }
    
    func setupAutoLayout() {
        navbarView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        navbarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navbarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
        
        navbarStackView.leftAnchor.constraint(equalTo: navbarView.leftAnchor).isActive = true
        navbarStackView.rightAnchor.constraint(equalTo: navbarView.rightAnchor).isActive = true
        navbarStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        topView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        headerLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        favoritesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        favoritesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        favoritesTableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        favoritesTableView.bottomAnchor.constraint(equalTo: navbarView.topAnchor ).isActive = true
        
    }
    
    
    
    // MARK: - Top Bar
    
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(
            red: CGFloat(0x2A) / 255.0,
            green: CGFloat(0x39) / 255.0,
            blue: CGFloat(0x90) / 255.0,
            alpha: 1.0
        )
        return view
    }()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorites"
        return label
    }()
    
    
    
    // MARK: - Table View
    
    private let favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        tableView.allowsSelection = true
        tableView.register(QuoteCell.self, forCellReuseIdentifier: QuoteCell.id)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        return tableView
    }()
    
    
    
    //MARK: - Navbar
    
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


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoritesQuotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteCell.id, for: indexPath) as! QuoteCell
        return cell
    }


}
