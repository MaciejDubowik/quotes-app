//
//  QuoteCell.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 20/05/2023.
//

import UIKit

class QuoteCell: UITableViewCell {
    static let id = "QuoteCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupQuoteCell()
        self.setupAutoLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupQuoteCell() {
        self.contentView.addSubview(quoteCellLabel)
        self.contentView.addSubview(authorCellLabel)
        self.contentView.addSubview(categoryCellLabel)
    }
    
    private func setupAutoLayout() {
        quoteCellLabel.leftAnchor.constraint(equalTo: authorCellLabel.rightAnchor, constant: 20).isActive = true
        quoteCellLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        quoteCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        quoteCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 ).isActive = true

        authorCellLabel.leftAnchor.constraint(equalTo: categoryCellLabel.rightAnchor, constant: 20).isActive = true
        authorCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20 ).isActive = true
        
        categoryCellLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        categoryCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20 ).isActive = true
    }
    
    
    let quoteCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    let authorCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    let categoryCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    
    
}
