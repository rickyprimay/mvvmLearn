//
//  Home.swift
//  MVVMFetchLearn
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var vm = ProductListViewModel(webService: WebService())
    
    var body: some View {
        NavigationView {
            List(vm.products) { product in
                ProductCardView(product: product)
            }
            .navigationTitle("Products")
            .task {
                await vm.populateProducts()
            }
        }
    }
}

#Preview {
    Home()
}
