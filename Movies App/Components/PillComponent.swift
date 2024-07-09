//
//  PillComponent.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct PillComponent: View {
    var text: String
    var color: Color = .blue
    
    var body: some View {
        Text("\(text)")
            .padding([.bottom,.top], 4)
            .padding([.trailing,.leading], 12)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .foregroundColor(.white)
    }
}
