//
//  WebService.swift
//  MVVMFetchLearn
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

enum NetworkError: Error {
    case badURL
    case badRequest
    case decodingError
}

class WebService {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badURL
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return products
        
    }
    
}
