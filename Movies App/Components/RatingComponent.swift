//
//  RatingComponent.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct RatingComponent: View {
    var rating: Double?
    
    var body: some View {
       if let average = rating {
           HStack {
               Text("-")
                   .foregroundColor(.primary.opacity(0.5))
               Text("\(average, specifier: "%.1f")")
                   .foregroundColor(average>=6.5 ? .green : .red)

           }
            .font(.caption)
       }
    }
}

#Preview {
    RatingComponent()
}
