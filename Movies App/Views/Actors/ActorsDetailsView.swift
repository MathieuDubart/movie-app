//
//  ActorsDetailsView.swift
//  Movies App
//
//  Created by Mathieu Dubart on 23/05/2024.
//

import SwiftUI

struct ActorsDetailsView: View {
    var singleActor: FetchedActor
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                if let img = singleActor.person.image {
                    AsyncImageComponent(image: img.original, width: 350, height: 450)
                }
                
                Text(singleActor.person.name)
                    .font(.title)
                
                
                VStack {
                    HStack {
                        DateComponent(date: singleActor.person.birthday)
                        Text("-")
                        DateComponent(date: singleActor.person.deathday)
                    }

                    Spacer()
                    
                    
                    if let country = singleActor.person.country {
                        PillComponent(text: country.name, color: .blue)
                    }
                }
            }
        }
        .padding()
    }
}
