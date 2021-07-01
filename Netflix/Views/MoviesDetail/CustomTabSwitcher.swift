//
//  CustomTabSwitcher.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 26/06/21.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    var tabs:[CustomTab]
    var movie:Movie
    @State private var selectedTab : CustomTab = .episode
    @Binding var seasonPicker:Bool
    @Binding var selectedSeson:Int
    func RedBarWidth(_ customTab:CustomTab) -> CGFloat{
        return customTab.rawValue.widhtOfString(usingFont: .systemFont(ofSize: 16,weight: .bold))
    }
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(tabs, id: \.self) { tab in
                        VStack{
                            //Red bar
                            Rectangle()
                                .frame(width: RedBarWidth(tab), height:6)
                                .foregroundColor(tab == selectedTab ? Color.red : Color.clear)
                            Button(action: {
                                
                                selectedTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16,weight:.bold))
                                    .foregroundColor(tab == selectedTab ? Color.white : Color.gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: RedBarWidth(tab), height:30)
                        }
                    }
                }
            }
            //Selected View
            switch selectedTab{
            case .episode:
                EpisodeView(episodes: movie.episodes ?? [], seasonPicker: $seasonPicker, selectedSeson: $selectedSeson)
            case .trailers:
                TrailerList(trailer:movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThis)
            }
        }
    }
}


enum CustomTab:String{
    case episode = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
           // CustomTabSwitcher(tabs: [.episode,.more,.trailers], movie: exampleMovie1)
            CustomTabSwitcher(tabs: [.episode,.more,.trailers], movie: exampleMovie1, seasonPicker: .constant(false), selectedSeson: .constant(1))
        }
        .foregroundColor(.white)
    }
}
