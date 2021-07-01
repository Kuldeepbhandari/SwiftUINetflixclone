//
//  Movie.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 21/06/21.
//

import Foundation

struct Movie : Identifiable {
    var id:String
    var name:String
    var thubmnailUrl:URL
    var categoires:[String]
    var genere : HomeGenere = .AllGenere
    //movie detail
    var year:Int
    var rating:String
    var numberOfSeason:Int?
    
    var currentEpisode:CurrentEpisodeInfo?
    var defaultEpisodeInfo:CurrentEpisodeInfo
    
    var promotionHeadline:String?
    var creatores:String
    var cast:String
    
    
    var moreLikeThis : [Movie]
    var episodes:[Episode]?
    var trailers : [Trailer]
    
    
    var movieType:MovieType{
        return episodes == nil ? .movie : .tvShow
    }
    
    var episodeDescription:String{
        if let current = currentEpisode{
            return current.descrption
        }else{
           return defaultEpisodeInfo.descrption
        }
    }
    var numberOfSesaonDisplay:String{
        if let num = numberOfSeason{
            if num == 1{
                return "1 Season"
            }else{
                return "\(num) Seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay:String{
       if let currnt = currentEpisode{
        return "E\(currnt.episode):S\(currnt.season) \(currnt.episodeName)"
       }else{
        return "E\(defaultEpisodeInfo.episode):S\(defaultEpisodeInfo.season) \(defaultEpisodeInfo.episodeName)"
       }
    }
}


struct CurrentEpisodeInfo:Hashable,Equatable{
    var episodeName:String
    var descrption:String
    var season:Int
    var episode:Int
}


enum MovieType{
    case movie
    case tvShow
}
