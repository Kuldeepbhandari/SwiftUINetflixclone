//
//  TrailerList.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 28/06/21.
//

import SwiftUI

struct TrailerList: View {
    var trailer : [Trailer]
    let screen = UIScreen.main.bounds
    var body: some View {
        
        VStack{
            ForEach(trailer) { trailers in
                VStack(alignment:.leading){
                VideoPreviewImage(imageUrl: trailers.thumbnailImageURL, videoUrl: trailers.videoURL)
                    .frame(maxWidth:screen.width)
                    Text(trailers.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding(.bottom,10)
                
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
        TrailerList(trailer: exampleTrailers)
    }
    }
}
