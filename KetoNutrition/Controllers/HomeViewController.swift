//
//  HomeViewController.swift
//  test
//
//  Created by Admin on 4/26/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.text = "Hello everyone"
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gobutton : UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.systemGreen
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(gobutton)
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configure() {
        
        gobutton.addTarget(self, action: #selector(didTapGo), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 250),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            gobutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            gobutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gobutton.widthAnchor.constraint(equalToConstant: 300),
            gobutton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapGo() {
        let vc = RecipeListViewController()
        vc.title = "Recipes"
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
