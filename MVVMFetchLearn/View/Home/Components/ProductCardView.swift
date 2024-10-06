//
//  ProductCardView.swift
//  MVVMFetchLearn
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

struct ProductCardView: View {
    let product: ProductViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Text(product.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.bottom, 5)
            
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
            
            Divider()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding(.vertical, 5)
    }
}
