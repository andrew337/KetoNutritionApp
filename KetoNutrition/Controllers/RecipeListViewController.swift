//
//  RecipeListViewController.swift
//  test
//
//  Created by Admin on 4/26/22.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    var products : [Product] = []
    
    private let tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSearchController()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        configureUI()
        NetworkManager.shared.getProducts(with: "soup") { [weak self] product in
            DispatchQueue.main.async {
                self?.products = product
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        
    }
    
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = " Enter something"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func configureUI() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            tableView.heightAnchor.constraint(equalToConstant: view.bounds.height)
        ])
    }
}

extension RecipeListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        let item = products[indexPath.row]
        //var newImage : UIImage
        
        NetworkManager.shared.getProductImage(with: item.image) { image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                cell.productImageView.image = image
            }
        }
        cell.productTitle.text = item.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedProduct = products[indexPath.row]
    
        let vc = RecipeDetailViewController(productNumber: selectedProduct.id, productName: selectedProduct.title)
        
        NetworkManager.shared.getProductImage(with: selectedProduct.image) { image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                vc.mealImageView.image = image
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
