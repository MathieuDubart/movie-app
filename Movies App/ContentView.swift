//
//  ContentView.swift
//  Movies App
//
//  Created by Mathieu Dubart on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var movieToSearch: String = ""
    @State private var personToSearch: String = ""
    
    private var apiController = TVMazeApiController()
    
    @State private var shows: [FetchedShow] = [FetchedShow]()
    @State private var actors: [FetchedActor] = [FetchedActor]()
    
    var body: some View {
        TabView {
            /* Movies search Tab */
            NavigationStack() {
                ShowsGridView(shows: shows)
                    .navigationTitle("Search for movies")
            }
            .searchable(text: $movieToSearch)
            .onAppear {
                fetchMoviesDataOnLaunch(for: "A")
            }
            .onSubmit(of: .search, fetchMoviesDataForSearch)
            .onChange(of: movieToSearch, fetchMoviesDataForSearch)
            .tabItem { Label("Shows", systemImage: "film").tag("movies") }
            
            /* Actors search Tab */
            NavigationStack() {
                ActorsGridView(actors: actors)
                    .navigationTitle("Search for actors")
            }
            .searchable(text: $personToSearch)
            .onAppear {
                fetchActorsDataOnLaunch(for: "A")
            }
            .onSubmit(of: .search, fetchActorsDataForSearch)
            .onChange(of: personToSearch, fetchActorsDataForSearch)
            .tabItem { Label("Actors", systemImage: "person").tag("actors") }
        }
    }
    
    private func fetchMoviesDataOnLaunch(for movieName: String) {
        Task {
            await apiController.fetchData(for: movieName, fetchType: .shows) { shows in
                self.shows = shows as! [FetchedShow]
            }
        }
    }
    
    private func fetchMoviesDataForSearch() {
        Task {
            await apiController.fetchData(for: movieToSearch, fetchType: .shows) { shows in
                self.shows = shows as! [FetchedShow]
            }
        }
    }
    
    private func fetchActorsDataOnLaunch(for actorsName: String) {
        Task {
            await apiController.fetchData(for: actorsName, fetchType: .actors) { actors in
                self.actors = actors as! [FetchedActor]
            }
        }
    }
    
    private func fetchActorsDataForSearch() {
        Task {
            await apiController.fetchData(for: personToSearch, fetchType: .actors) { actors in
                self.actors = actors as! [FetchedActor]
            }
        }
    }
}

#Preview {
    ContentView()
}
