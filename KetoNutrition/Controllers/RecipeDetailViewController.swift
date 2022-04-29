//
//  RecipeDetailViewController.swift
//  test
//
//  Created by Admin on 4/28/22.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var productNuber : Int!
    var productName : String!
    
    init(productNumber : Int, productName : String) {
        super.init(nibName: nil, bundle: nil)
        self.productNuber = productNumber
        self.productName = productName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mealImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 110
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ketoLabel : UILabel = {
        let label = UILabel()
       // label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.shadowColor = .systemGreen
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe Detail"
        view.backgroundColor = .systemBackground
        configure()
        ketoLabel.text = ("It works let's god fdfsdf fsdfssf")
        mealImageView.image = UIImage(named: "food")
    }
    
    private func configure() {
        
        view.addSubview(ketoLabel)
        view.addSubview(mealImageView)
        
        NSLayoutConstraint.activate([
        
            ketoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            ketoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ketoLabel.widthAnchor.constraint(equalToConstant: 210),
            ketoLabel.heightAnchor.constraint(equalToConstant: 70),
            
            mealImageView.topAnchor.constraint(equalTo: ketoLabel.bottomAnchor, constant: 15),
            mealImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mealImageView.widthAnchor.constraint(equalToConstant: 220),
            mealImageView.heightAnchor.constraint(equalToConstant: 220)
        
        ])
    }

}
