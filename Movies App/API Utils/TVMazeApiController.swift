//
//  TVMazeApiController.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import Foundation

class TVMazeApiController {
    enum FetchType: String {
        case shows, actors
    }
    
    let showsUrl = "https://api.tvmaze.com/search/shows?q="
    let actorsUrl = "https://api.tvmaze.com/search/people?q="
    
    func fetchData(for textToSearch: String, fetchType: FetchType, completion: @escaping ([Any]) -> Void) async -> Void {
        var apiUrl: URL?
        
        switch fetchType {
        case .shows:
            apiUrl = URL(string: "\(showsUrl)\(textToSearch)")
        case .actors:
            apiUrl = URL(string: "\(actorsUrl)\(textToSearch)")
        }
        
        guard let url = apiUrl else {
            return
        }
        
        do {
            var returnedData: [FetchedResult] = [FetchedResult]()
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            if fetchType == .shows {
                returnedData = try decoder.decode([FetchedShow].self, from: data)
            }
            
            if fetchType == .actors {
                returnedData = try decoder.decode([FetchedActor].self, from: data)
            }
            
            completion(returnedData)
        } catch {
            print("Error attempting fetching data: \(error)")
        }
        
        return
    }
}
