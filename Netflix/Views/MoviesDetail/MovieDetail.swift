//
//  MovieDetail.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 25/06/21.
//

import SwiftUI

struct MovieDetail: View {
    var movie:Movie
    let screen = UIScreen.main.bounds
    @State var seasonPicker = false
    @State private var selectedSeson = 1
    
    @Binding var movieDetailToShow:Movie?
    
    var body: some View {
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        //close the view'
                        movieDetailToShow = nil
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .scaledToFill()
                            .font(.system(size: 30))
                        
                    })
                }
                .padding(.horizontal,22)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        StandardHomeView(movie: exampleMovie5)
                            .frame(width:screen.width/2.5)
                        MovieInfoSubHedaline(movie: movie)
                        if movie.promotionHeadline != nil{
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: Color.red) {
                            //
                        }
                        .padding(.top,5)
                        //current episode info
                        EpiosodeInfoView(movie: movie)
                        CastInfoView(movie: movie)
                        HStack(spacing:60){
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                //
                            }
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                                //
                            }
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                //
                            }
                            Spacer()
                        }
                        .padding(.leading,20)
                        // CustomTabSwitcher()
                        CustomTabSwitcher(tabs: [.episode,.trailers,.more], movie: movie, seasonPicker: $seasonPicker, selectedSeson: $selectedSeson)
                    }
                    .padding(.horizontal,10)
                }
                Spacer()
            }
            .foregroundColor(.white)
            
            if seasonPicker{
                Group{
                    Color.black.opacity(0.9)
                    VStack(spacing:35){
                        Spacer()
                        
                        ForEach(0..<(movie.numberOfSeason ?? 0)) { season in
                            
                            Button(action: {
                                self.seasonPicker = false
                                self.selectedSeson = season+1
                            }, label: {
                                Text("Season \(season+1)")
                                    .foregroundColor(selectedSeson == season + 1 ? .white : .gray)
                                    .bold()
                                    .font(selectedSeson == season + 1 ? .title : .title2)
                            })
                        }
                        Spacer()
                        
                        Button(action: {
                            self.seasonPicker = true
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
                        })
                        .padding(.bottom,30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
}



struct MovieInfoSubHedaline: View {
    var movie:Movie
    var body: some View {
        HStack(spacing:20){
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text("\(movie.year)")
            RatingView(rating: movie.rating)
            Text(movie.numberOfSesaonDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical,6)
    }
}

struct RatingView: View {
    var rating:String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(3.0)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
            
        }
        .frame(width:50,height: 20)
    }
}

struct CastInfoView: View {
    var movie:Movie
    var body: some View {
        VStack(spacing:3){
            HStack{
                Text("Cast : \(movie.cast)")
                Spacer()
            }
            HStack{
                Text("Creators : \(movie.creatores)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical,7)
    }
}

struct EpiosodeInfoView: View {
    var movie:Movie
    var body: some View {
        VStack{
            HStack{
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical,4)
            HStack{
                Text(movie.episodeDescription)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
