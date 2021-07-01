//
//  StandardHomeView.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 21/06/21.
//

import SwiftUI
import Kingfisher

struct StandardHomeView: View {
    var movie:Movie
    
    var body: some View {
        KFImage(movie.thubmnailUrl)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct StandardHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeView(movie: exampleMovie1)
    }
}
