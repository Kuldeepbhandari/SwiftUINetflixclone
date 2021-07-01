//
//  HomeVM.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 22/06/21.
//

import Foundation

class HomeVM : ObservableObject{
    
    @Published var movies : [String:[Movie]] = [:]
    
    public var allCategories : [String]{
        movies.keys.map{String($0)}
    }
    
    public var allGenere : [HomeGenere] = [.AllGenere,.Action,.Comedy,.Horror,.Thriller]
    
    public func getMovies(in categories:String,andHomeRow homeRow:HomeTopRow,addGenere genere:HomeGenere) -> [Movie]{
        
        switch homeRow {
        case .home:
            return movies[categories] ?? []
        case .tvShows:
            return (movies[categories] ?? []).filter{($0.movieType == .tvShow) && ($0.genere == genere)}
        case .movies:
            return (movies[categories] ?? []).filter{($0.movieType == .movie) &&  ($0.genere == genere)}
        case .myList:
            return movies[categories] ?? []

        }
    }
    init() {
        setupMovie()
    }
    
    func setupMovie(){
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Scify Movies"] = exampleMovies.shuffled()

    }
}
