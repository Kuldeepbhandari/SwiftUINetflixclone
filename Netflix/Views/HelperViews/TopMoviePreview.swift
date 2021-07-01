//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 22/06/21.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    var movie:Movie
     
    var body: some View {

        ZStack{
            KFImage(movie.thubmnailUrl)
                .resizable()
                .scaledToFill()
                .clipped()
            VStack{
                
                Spacer()
                HStack{
                    ForEach(movie.categoires, id: \.self) { categories in
                        Text(categories)
                            .font(.footnote)
                        if !isLastCat(categories){
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 3))
                            
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        //
                    }
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill") {
                        //
                    }
                    .frame(width:120)
                    Spacer()
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        //
                    }
                    
                    Spacer()
                    
                }
                .padding(.vertical,14)
            }
            .background(LinearGradient.blackGradient)
            .padding(.top,275)
        }
        .foregroundColor(.white)
    }
    
    
    func isLastCat(_ cat:String) -> Bool{
        let catCount = movie.categoires.count
      if let index = movie.categoires.firstIndex(of: cat) {
            if index+1 != catCount{
                return false
            }
        }
        return true
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
