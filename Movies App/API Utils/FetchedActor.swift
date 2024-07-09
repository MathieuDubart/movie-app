//
//  FetchedActor.swift
//  Movies App
//
//  Created by Mathieu Dubart on 23/05/2024.
//

import Foundation

struct FetchedActor: FetchedResult, Codable {
    struct Person: Codable {
        struct Country: Codable {
            var name: String
        }
        
        struct PersonImage: Codable {
            var medium: String?
            var original: String?
        }
        
        var id: Int
        var name: String
        var country: Country?
        var birthday: String?
        var deathday: String?
        var gender: String?
        var image: PersonImage?
    }

    var score: Double
    var person: Person
}
