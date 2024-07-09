//
//  DateComponent.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct DateComponent: View {
    var date: String?
    
    var body: some View {
        if let d = DateConverter.shared.convertDate(date) {
            Text("\(d.formatted(date: .abbreviated, time: .omitted))")
                .foregroundColor(.primary.opacity(0.5))
                .font(.caption)
        } else {
            Text("Unknown date")
                .foregroundColor(.primary.opacity(0.5))
                .font(.caption)
        }
    }
}

#Preview {
    DateComponent()
}
