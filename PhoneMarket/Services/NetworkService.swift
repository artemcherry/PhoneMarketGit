//
//  NetworkService.swift
//  PhoneMarket
//
//  Created by Артём (почини свой компьютер) on 04.12.2022.
//

import Foundation

final class NetworkService {
    
    func getProducts(urlString: String, completion: @escaping (GeneralNetworkModel?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                guard let decodedData = try? JSONDecoder().decode(GeneralNetworkModel.self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(decodedData, nil)
                }
            } else {
                let error = NSError()
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        .resume()
    }
    
    
    func getProductDescription(urlString: String, completion: @escaping (PhoneModel?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                guard let decodedData = try? JSONDecoder().decode(PhoneModel.self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(decodedData, nil)
                }
            } else {
                let error = NSError()
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        .resume()
    }
}
