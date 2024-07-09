//
//  ActorsGridView.swift
//  Movies App
//
//  Created by Mathieu Dubart on 23/05/2024.
//

import SwiftUI

struct ActorsGridView: View {
    let actors: [FetchedActor]
    @State private var displayAcotr: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                ForEach(actors, id: \.self.person.id) { actor in
                    NavigationLink {
                        ActorsDetailsView(singleActor: actor)
                    } label: {
                        ActorsCardComponent(singleActor: actor)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}
