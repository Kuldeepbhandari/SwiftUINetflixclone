//
//  MoreLikeThis.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 26/06/21.
//

import SwiftUI

struct MoreLikeThis: View {
    var movies : [Movie]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
            LazyVGrid(columns: columns) {
                ForEach(movies.indices){ index in
                    StandardHomeView(movie: movies[index])
                }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}
