//
//  GridView.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct ShowsGridView: View {
    let shows: [FetchedShow]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                ForEach(shows, id: \.self.show.id) { show in
                    NavigationLink {
                        ShowDetailsView(singleShow: show)
                    } label: {
                        MovieCardComponent(singleShow: show)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}
