//
//  ActorsCardComponent.swift
//  Movies App
//
//  Created by Mathieu Dubart on 23/05/2024.
//

import SwiftUI

struct ActorsCardComponent: View {
    var singleActor: FetchedActor
    
    var body: some View {
        VStack {
            if let img = singleActor.person.image {
                AsyncImageComponent(image: img.original)
            }
            
            Text(singleActor.person.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            if let country = singleActor.person.country {
                PillComponent(text: country.name, color: .blue)
                    .font(.caption)
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
