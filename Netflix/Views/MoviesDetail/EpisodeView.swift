//
//  EpisodeView.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 28/06/21.
//

import SwiftUI

struct EpisodeView: View {
    var episodes : [Episode]
    @Binding var seasonPicker:Bool
    @Binding var selectedSeson:Int
    
    func getEpisode(forSeason season:Int) -> [Episode]{
        return episodes.filter{$0.season == season}
    }
    var body: some View {
        VStack(spacing:20){
            //season picker
            HStack{
                Button(action: {
                    seasonPicker = true
                }, label: {
                    Group{
                        Text("Season \(selectedSeson)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 14))
                    .padding(.vertical,10)
                    
                })
                Spacer()
            }
            
            //Episode List
            ForEach(getEpisode(forSeason: selectedSeson)) { episode in
                VStack(alignment:.leading){
                    HStack{
                        VideoPreviewImage(imageUrl: episode.thumbnailURL, videoUrl: episode.videoURL)
                            .frame(width:120,height: 75)
                            .clipped()
                        
                        VStack(alignment:.leading){
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    
                    Text(episode.description)
                        .font(.system(size: 14))
                        .lineLimit(3)
                }
                .padding(.bottom,20)
            }
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.horizontal,20)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodeView(episodes: allExampleEpisodes, seasonPicker: .constant(false), selectedSeson: .constant(1))
    }
    }
}
