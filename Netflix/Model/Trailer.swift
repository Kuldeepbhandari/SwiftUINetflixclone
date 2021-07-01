//
//  Trailer.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 28/06/21.
//

import Foundation

struct Trailer:Identifiable,Hashable{
    var id : String = UUID().uuidString
    var name:String
    var videoURL:URL
    var thumbnailImageURL:URL
}

