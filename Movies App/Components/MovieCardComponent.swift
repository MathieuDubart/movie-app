//
//  MovieCardComponent.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct MovieCardComponent: View {
    var singleShow: FetchedShow
    
    var body: some View {
        VStack {
            if let img = singleShow.show.image {
                AsyncImageComponent(image: img.original)
            }
            
            Text(singleShow.show.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack() {
                DateComponent(date: singleShow.show.premiered)
                
                if let rating = singleShow.show.rating {
                    
                    RatingComponent(rating: rating.average)
                }
            }

        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
