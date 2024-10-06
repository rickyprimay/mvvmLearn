//
//  ProductListViewModel.swift
//  MVVMFetchLearn
//
//  Created by Ricky Primayuda Putra on 06/10/24.
//

import SwiftUI

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateProducts() async {
        do {
            let products = try await webService.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
}

struct ProductViewModel: Identifiable {
    
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String{
        product.title
    }
    
    var price: Double {
        product.price
    }
    
    var description: String {
        product.description
    }
    
    var image: String {
        product.image
    }
    
}
