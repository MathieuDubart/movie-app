//
//  AsyncImageComponent.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct AsyncImageComponent: View {
    var image: String?
    var width: Int = 100
    var height: Int = 160
    
    var body: some View {
        if let img = image {
            AsyncImage(url: URL(string: img)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(width: CGFloat(width), height: CGFloat(height))
            .padding()
        }
    }
}

#Preview {
    AsyncImageComponent()
}
