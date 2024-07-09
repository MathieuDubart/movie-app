//
//  DateConverter.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import Foundation

class DateConverter {
    static let shared = DateConverter()
    
    private init() {}
    
    func convertDate(_ date: String?) -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let d = date {
            let formattedDate = dateFormatter.date(from: d)
            return formattedDate
        }
        
        return nil
    }
}
