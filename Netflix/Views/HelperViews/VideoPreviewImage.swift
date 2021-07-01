//
//  VideoPreviewImage.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 28/06/21.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    var imageUrl:URL
    var videoUrl:URL
    @State private var showVideoPlayer = false
    
    var body: some View {
        ZStack{
            KFImage(imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Button(action: {
                showVideoPlayer = true
            }, label: {
                Image(systemName: "play.fill")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
            })
            .sheet(isPresented: $showVideoPlayer, content: {
                VideoPlayerView(url: videoUrl)
            })
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageUrl: exampleImageURL, videoUrl: exampleVideoURL)
    }
}
