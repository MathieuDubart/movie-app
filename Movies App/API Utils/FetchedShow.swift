//
//  FetchedShows.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import Foundation

struct FetchedShow: FetchedResult, Codable {
    struct Show: Codable {
        struct ShowRating: Codable {
            var average: Double?
        }
        
        struct ShowImage: Codable {
            var medium: String?
            var original: String?
        }
        
        var id: Int
        var name: String
        var language: String
        var genres: [String]
        var premiered: String?
        var rating: ShowRating?
        var image: ShowImage?
        var summary: String?
    }

    var score: Double
    var show: Show
}
