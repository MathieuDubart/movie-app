//
//  ShowDetailsView.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct ShowDetailsView: View {
    var singleShow: FetchedShow
    
    var body: some View {
        ScrollView {
            VStack {
                if let img = singleShow.show.image {
                    AsyncImageComponent(image: img.original, width: 350, height: 450)
                }
                
                HStack {
                    DateComponent(date: singleShow.show.premiered)
                    
                    if let rating = singleShow.show.rating {
                        RatingComponent(rating: rating.average)
                    }
                }
                
                HStack {
                    ForEach(singleShow.show.genres, id: \.self) { genre in
                        PillComponent(text: genre, color: .green)
                    }
                }
                
                if let summary = singleShow.show.summary {
                    Text(summary.withoutHtmlTags)
                } else {
                    Text("No summary available")
                }
                
            }
            .padding()
        }
        .navigationTitle(singleShow.show.name)
    }
}
