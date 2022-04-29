//
//  NetworkManager.swift
//  test
//
//  Created by Admin on 4/28/22.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL =
    "https://api.spoonacular.com/recipes/complexSearch?maxFat=25&number=25&apiKey=16e2291352d0443a82a128a22ac82e2c&query="
    
    func getProducts(with product : String, completion : @escaping ([Product]) -> Void) {
        guard let url = URL(string: baseURL + "\(product)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Data returned incorrect")
                completion([])
                return
            }
            do {
                let decoder = JSONDecoder()
                let infoData = try decoder.decode(SearchResults.self, from: data)
                completion(infoData.results)
            } catch {
                print("Something")
                completion([])
            }
        }
        task.resume()
    }
    
    func getProductImage(with urlString : String, completion : @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Data returned incorrect")
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
    }
}
