//
//  Utils.swift
//  Movies App
//
//  Created by Mathieu Dubart on 23/05/2024.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}

protocol FetchedResult {
    var score: Double {get set}
}
