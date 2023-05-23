//
//  QuotesViewController.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 15/05/2023.
//

import UIKit

class QuotesViewController: UIViewController {
    
    let quotesService = QuotesService()
    
    let viewModel = QuotesViewModel()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupQuoteCard()
        setupButtonSection()
        setupNavbar()
        setupAutoLayout()
        
    }
    
    func setupMainView(){
        view.backgroundColor = UIColor(
            red: CGFloat(0x2A) / 255.0,
            green: CGFloat(0x39) / 255.0,
            blue: CGFloat(0x90) / 255.0,
            alpha: 1.0
        )
    }
    
    func setupQuoteCard(){
        view.addSubview(quoteCardView)
        quoteCardView.addSubview(quoteLabel)
        quoteCardView.addSubview(quoteAuthorLabel)
    }
    
    func setupButtonSection(){
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(loadNextQuoteButton)
        buttonStackView.addArrangedSubview(addToFavoritesButton)
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
        
        buttonStackView.bottomAnchor.constraint(equalTo: navbarStackView.topAnchor, constant: -100).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        loadNextQuoteButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addToFavoritesButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        addToFavoritesButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        quoteCardView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        quoteCardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        quoteCardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        quoteCardView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor,constant: -40).isActive = true
        
        quoteLabel.topAnchor.constraint(equalTo: quoteCardView.topAnchor, constant: 40).isActive = true
        quoteLabel.leftAnchor.constraint(equalTo: quoteCardView.leftAnchor, constant: 20).isActive = true
        quoteLabel.rightAnchor.constraint(equalTo: quoteCardView.rightAnchor, constant: -20).isActive = true
        quoteAuthorLabel.topAnchor.constraint(equalTo: quoteCardView.bottomAnchor, constant: -60).isActive = true
        quoteAuthorLabel.leftAnchor.constraint(equalTo: quoteCardView.leftAnchor, constant: 20).isActive = true
    }
    
    
    
    //MARK: - Quote Card
    
    private let quoteCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is a random quote example."
        label.numberOfLines = 0
        return label
    }()
    
    private let quoteAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Author Name"
        return label
    }()
    
    
    
    //MARK: - Button section
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    private let loadNextQuoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(
            red: CGFloat(0xF0) / 255.0,
            green: CGFloat(0x62) / 255.0,
            blue: CGFloat(0x92) / 255.0,
            alpha: 1.0
        )
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(loadNextQuoteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func loadNextQuoteButtonPressed() {
        viewModel.loadNextQuoteButtonPressed()
        quoteLabel.text = viewModel.getQuoteText()
        quoteAuthorLabel.text = viewModel.getQuoteAuthor()
    }
    
    private let addToFavoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("♡", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 40
        return button
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


