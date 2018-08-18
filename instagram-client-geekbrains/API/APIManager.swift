//
//  APIManager.swift
//  instagram-client-geekbrains
//
//  Created by Aleksandr Zhuravlev on 18/08/2018.
//  Copyright © 2018 Aleksandr Zhuravlev. All rights reserved.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func load(_ urlString: String, _ completion: @escaping (Any?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(try? JSONSerialization.jsonObject(with: data, options: .mutableContainers))
        }.resume()
    }
}
