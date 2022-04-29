//
//  ProductTableViewCell.swift
//  test
//
//  Created by Admin on 4/28/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
     let productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     let productTitle : UILabel = {
       let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 0
         label.textAlignment = .left
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.addSubview(productImageView)
        contentView.addSubview(productTitle)
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 60),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            
            productTitle.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 15),
            productTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productTitle.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
}
