//
//  HomeView.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 21/06/21.
//

import SwiftUI

struct HomeView: View {
    var homeVM = HomeVM()
    let screen = UIScreen.main.bounds
    @State private var movieDetailToShow : Movie? = nil
    @State private var topRowSelection : HomeTopRow = .home
    @State private var homeGenere : HomeGenere = .AllGenere
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            //Main Vstack
            ScrollView {
                LazyVStack{
                    TopRowButton(topRowSelection: $topRowSelection, homeGenere: $homeGenere,showGenreSelection:$showGenreSelection,showTopRowSelection:$showTopRowSelection)
                    TopMoviePreview(movie: exampleMovie5)
                        .frame(width:screen.width)
                        .padding(.top,-110)
                        .zIndex(-1)
                    
                    HomeStack(homeVM: homeVM, movieDetailToShow: $movieDetailToShow, topRowSelection: topRowSelection, selectedGenere: homeGenere)
                }
            }
            
            if movieDetailToShow != nil{
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection{
                Group{
                Color.black.opacity(0.9)
                    VStack(spacing:40){
                        Spacer()
                        ForEach(HomeTopRow.allCases,id:\.self){ topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection{
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                }else{
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            })
                        }
                        Spacer()
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom,30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection{
                Group{
                Color.black.opacity(0.9)
                    VStack(spacing:40){
                        Spacer()
                        ScrollView{
                        ForEach(homeVM.allGenere,id:\.self){ genere in
                            Button(action: {
                                homeGenere = genere
                                showGenreSelection = false
                            }, label: {
                                if genere == homeGenere{
                                    Text("\(genere.rawValue)")
                                        .bold()
                                }else{
                                    Text("\(genere.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            })
                            .padding(.bottom,40)
                        }
                        }
                        Spacer()
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        })
                        .padding(.bottom,30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
        }
        .foregroundColor(.white)
    }
}


struct TopRowButton:View {
    @Binding  var topRowSelection : HomeTopRow
    @Binding  var homeGenere : HomeGenere
    @Binding  var showGenreSelection : Bool
    @Binding  var showTopRowSelection : Bool
    var body: some View{
        
        switch topRowSelection {
        case .home:
            HStack{
                
                Button(action: {
                    topRowSelection = .home
                }) {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .tvShows
                }) {
                    Text("TV Shows")
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }) {
                    Text("Movies")
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {
                    topRowSelection = .myList
                }) {
                    Text("My List")
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                  //  topRowSelection = .myList
                    
                }) {
                    Text("All Genere")
                }
                .buttonStyle(PlainButtonStyle())
                
            }
        

        // .background(Color.black)
        .foregroundColor(.white)
        .padding(.leading,10)
        .padding(.trailing,20)
            
        case .tvShows,.myList,.movies:
            HStack{
                Button(action: {
                    topRowSelection = .home
                }) {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                }
                .buttonStyle(PlainButtonStyle())
                HStack(spacing:20){
                Button(action: {
                   // topRowSelection = .tvShows
                    showTopRowSelection = true
                }) {
                    HStack{
                    Text(topRowSelection.rawValue)
                        .font(.system(size: 18))
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 9))
                            .rotationEffect(.degrees(180))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    //topRowSelection = .
                    showGenreSelection = true
                }) {
                    HStack{
                        Text(homeGenere.rawValue)
                        .font(.system(size: 14))
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 7))
                            .rotationEffect(.degrees(180))
                }
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            }
            .padding(.leading,25)
            .padding(.trailing,30)
        

        }
}
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


enum HomeTopRow:String,CaseIterable{
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenere : String{
    case AllGenere
    case Action
    case Comedy
    case Horror
    case Thriller
}

